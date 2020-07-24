CREATE TABLE mst_user_location (
    user_id   varchar(255)
  , pref_name varchar(255)
  , city_name varchar(255)
);

INSERT INTO mst_user_location
VALUES
    ('U001', '서울특별시', '강서구')
  , ('U002', '경기도수원시', '장안구'  )
  , ('U003', '제주특별자치도', '서귀포시')
;

## 문자열 연결하기
SELECT USER_ID, CONCAT(PREF_NAME, CITY_NAME) AS PREF_CITY
FROM MST_USER_LOCATION;

CREATE TABLE quarterly_sales (
    year integer
  , q1   integer
  , q2   integer
  , q3   integer
  , q4   integer
);

INSERT INTO quarterly_sales
VALUES
    (2015, 82000, 83000, 78000, 83000)
  , (2016, 85000, 85000, 80000, 81000)
  , (2017, 92000, 81000, NULL , NULL )
;

## 분기별 매출 증감 판정
SELECT 
YEAR
, Q1
, Q2
, CASE 
	WHEN (Q2-Q1) > 0 THEN '+'
    WHEN (Q2-Q1) < 0 THEN '-'
    ELSE ''
    END AS JUDGE_Q2_Q1
, Q1-Q2 AS DIFF_Q2_Q1
, SIGN(Q2-Q1) AS SIQN_Q2_Q1
FROM QUARTERLY_SALES;

## 연간 최대/최소 4분기 매출 찾기
SELECT 
YEAR
, GREATEST(Q1, Q2, Q3, Q4) AS GREATEST_SALES
, LEAST(Q1, Q2, Q3, Q4) AS LEAST_SALES;


## 연간 평균 4분기 매출 계산하기
-- 이렇게 하면 NULL값 포함 시 계산 못함
SELECT
YEAR
, (Q1+Q2+Q3+Q4) / 4 AS AVERAGE
FROM QUARTERLY_SALES
ORDER BY YEAR;

-- 이렇게 하면 NULL값 처리는 되나, 평균값 매우 낮아짐
SELECT
year
, (COALESCE(Q1, 0) + COALESCE(Q2, 0) + COALESCE(Q3, 0) + COALESCE(Q4, 0))/4 AS AVERAGE
FROM QUARTERLY_SALES 
ORDER BY YEAR;

-- SIGN과 COALESCE를 적절하게 사용한 예시
SELECT
YEAR
, (COALESCE(Q1, 0)+COALESCE(Q2, 0)+COALESCE(Q3, 0)+COALESCE(Q4, 0))/ 
(SIGN(COALESCE(Q1, 0))+SIGN(COALESCE(Q2, 0))+SIGN(COALESCE(Q3, 0))+SIGN(COALESCE(Q4, 0))) AS AVERAGE
FROM QUARTERLY_SALES
ORDER BY YEAR;

CREATE TABLE advertising_stats (
    dt          varchar(255)
  , ad_id       varchar(255)
  , impressions integer
  , clicks      integer
);

INSERT INTO advertising_stats
VALUES
    ('2017-04-01', '001', 100000,  3000)
  , ('2017-04-01', '002', 120000,  1200)
  , ('2017-04-01', '003', 500000, 10000)
  , ('2017-04-02', '001',      0,     0)
  , ('2017-04-02', '002', 130000,  1400)
  , ('2017-04-02', '003', 620000, 15000)
;

## 정수 자료형의 데이터 나누기
SELECT
DT
, AD_ID
, CLICKS / IMPRESSIONS AS CTR
, 100 * CLICKS / IMPRESSIONS AS CTR_AS_PERCENT
FROM ADVERTISING_STATS
WHERE DT = '2017-04-01';

## 0으로 나누는 것 피하기
SELECT
DT
, AD_ID
, CLICKS / IMPRESSIONS * 100 AS CTR_AS_PRECENT
, CASE 
	WHEN IMPRESSIONS = 0 THEN 0
    ELSE CLICKS / IMPRESSIONS * 100
    END AS CTR_AS_PRECENT_BY_CASE
, 100 * CLICKS / NULLIF(IMPRESSIONS, 0) AS CTR_AS_PRECENT_BY_NULL 
FROM ADVERTISING_STATS;

CREATE TABLE location_1d (
    x1 integer
  , x2 integer
);

INSERT INTO location_1d
VALUES
    ( 5 , 10)
  , (10 ,  5)
  , (-2 ,  4)
  , ( 3 ,  3)
  , ( 0 ,  1)
;

CREATE TABLE location_2d (
    x1 integer
  , y1 integer
  , x2 integer
  , y2 integer
);

INSERT INTO location_2d
VALUES
    (0, 0, 2, 2)
  , (3, 5, 1, 2)
  , (5, 3, 2, 1)
;

## 절대값, RMS 계산하기
SELECT 
ABS(X1 - X2) AS ABS
, SQRT(POWER(X1 - X2, 2)) AS RMS
FROM LOCATION_1D;

## 유클리드거리 구하기
SELECT
SQRT(POWER(X1 - X2, 2) + POWER(Y1 - Y2, 2)) AS L2_DISTANCE
FROM LOCATION_2D;

CREATE TABLE mst_users_with_dates (
    user_id        varchar(255)
  , register_stamp varchar(255)
  , birth_date     varchar(255)
);

INSERT INTO mst_users_with_dates
VALUES
    ('U001', '2016-02-28 10:00:00', '2000-02-29')
  , ('U002', '2016-02-29 10:00:00', '2000-02-29')
  , ('U003', '2016-03-01 10:00:00', '2000-02-29')
;

## 시간 계산하기
SELECT
USER_ID
, TIMESTAMP(REGISTER_STAMP) AS REGISTER_STAMP
, DATE_ADD(TIMESTAMP(REGISTER_STAMP), INTERVAL 1 HOUR) AS AFTER_1_HOUR
, DATE_SUB(TIMESTAMP(REGISTER_STAMP), INTERVAL 30 MINUTE) AS BEFORE_30_MINUTES
, DATE(TIMESTAMP(REGISTER_STAMP)) AS REGISTER_DATE
, DATE(DATE_ADD(TIMESTAMP(REGISTER_STAMP), INTERVAL 1 DAY)) AS AFTER_1_DAY
, DATE_SUB(DATE(TIMESTAMP(REGISTER_STAMP)), INTERVAL 1 MONTH) AS BEFORE_1_MONTH
FROM MST_USERS_WITH_DATES;

## 날짜 데이터들의 차이 계산하기
SELECT
CURRENT_DATE AS TODAY
, DATE(REGISTER_STAMP) AS REGISTER_DATE
, DATEDIFF(CURRENT_DATE, DATE(REGISTER_STAMP)) AS DIFF
FROM MST_USERS_WITH_DATES;

## 사용자의 생년월일로 나이 계산하기
SELECT
USER_ID
, DATE(REGISTER_STAMP) AS REGISTER_DATE
, BIRTH_DATE
, TRUNCATE(((REPLACE(SUBSTR(DATE(REGISTER_STAMP),1, 10), '-', '')) - (REPLACE(SUBSTR(BIRTH_DATE, 1, 10), '-', ''))) / 10000, 0) AS REGISTER_AGE
, TRUNCATE(((REPLACE(SUBSTR(CURRENT_DATE,1, 10), '-', '')) - (REPLACE(SUBSTR(BIRTH_DATE, 1, 10), '-', ''))) / 10000, 0) AS CURRENT_AGE
FROM MST_USERS_WITH_DATES;