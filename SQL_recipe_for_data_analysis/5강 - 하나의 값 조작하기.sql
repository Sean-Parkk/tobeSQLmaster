USE SQLRECIPE;
SELECT * FROM MST_USERS;
SELECT USER_ID
, CASE
	WHEN REGISTER_DEVICE = 1 THEN '데스크톱'
    WHEN REGISTER_DEVICE = 2 THEN '스마트폰'
    WHEN REGISTER_DEVICE = 3 THEN '애플리케이션'
    ELSE ''
    END AS DEVICE_NAME
FROM MST_USERS;

-- 5-2

DROP TABLE IF EXISTS access_log ;
CREATE TABLE access_log (
    stamp    varchar(255)
  , referrer text
  , url      text
);

INSERT INTO access_log 
VALUES
    ('2016-08-26 12:02:00', 'http://www.other.com/path1/index.php?k1=v1&k2=v2#Ref1', 'http://www.example.com/video/detail?id=001')
  , ('2016-08-26 12:02:01', 'http://www.other.net/path1/index.php?k1=v1&k2=v2#Ref1', 'http://www.example.com/video#ref'          )
  , ('2016-08-26 12:02:01', 'https://www.other.com/'                               , 'http://www.example.com/book/detail?id=002' )
;

SELECT * FROM ACCESS_LOG;

SELECT STAMP
, SUBSTRING(REFERRER FROM 'https?://([^/]*)') AS REFERER_HOST
FROM ACCESS_LOG;

# 현재 날짜, 시간 가져오기
SELECT
current_date() AS DT
, current_timestamp() AS STAMP;

# 지정한 값의 날짜/시각 데이터 추출하기
SELECT
DATE('2016-01-30') AS DT
, TIMESTAMP('2016-01-30 12:00:00') AS STAMP;

--  날짜/사각에서 특정 필드 추출하기
SELECT
STAMP
,YEAR(STAMP) AS YEAR
,MONTH(STAMP) AS MONTH
,DAY(STAMP) AS DAY
,HOUR(STAMP) AS HOUR
FROM (SELECT TIMESTAMP('2020-07-23 18:30:00') AS STAMP) AS T;

-- 날짜 함수 안 쓰고 SUBSTR으로 추출
SELECT
STAMP
, SUBSTR(STAMP, 1, 4) AS YEAR
, SUBSTR(STAMP, 6, 2) AS MONTH
, SUBSTR(STAMP, 9, 2) AS DAY
, SUBSTR(STAMP, 12, 2) AS HOUR
, SUBSTR(STAMP, 15, 2) AS MINUTE
, SUBSTR(STAMP, 18, 2) AS SECOND
, SUBSTR(STAMP, 1, 7) AS MINUTE
FROM (SELECT TIMESTAMP('2020-07-23 18:30:00') AS STAMP) AS T;

CREATE TABLE purchase_log_with_coupon (
    purchase_id varchar(255)
  , amount      integer
  , coupon      integer
);

INSERT INTO purchase_log_with_coupon
VALUES
    ('10001', 3280, NULL)
  , ('10002', 4650,  500)
  , ('10003', 3870, NULL)
;

SELECT * FROM PURCHASE_LOG_WITH_COUPON;

SELECT 
PURCHASE_ID
, AMOUNT
, COUPON
, AMOUNT - COUPON AS DISCOUNT1
, AMOUNT - IFNULL(COUPON,0) AS DISCOUNT2
, AMOUNT - COALESCE(COUPON, 0) AS DISCOUNT3
FROM PURCHASE_LOG_WITH_COUPON;