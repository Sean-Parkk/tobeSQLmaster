## 테이블 전체의 특징량 계산하기
SELECT
COUNT(*) AS TOTAL_COUNT
, COUNT(DISTINCT USER_ID) AS USER_COUNT
, COUNT(DISTINCT PRODUCT_ID) AS PRODUCT_COUNT
, SUM(SCORE) AS SUM
, AVG(SCORE) AS AVG
, MAX(SCORE) AS MAX
, MIN(SCORE) AS MIN
FROM REVIEW;

## 그루핑한 데이터의 특징량 계산하기
SELECT
USER_ID
, COUNT(*) AS TOTAL_COUNT
, COUNT(DISTINCT PRODUCT_ID) AS PRODUCT_COUNT
, SUM(SCORE) AS SUM
, AVG(SCORE) AS AVG
, MAX(SCORE) AS MAX
, MIN(SCORE) AS MIN
FROM REVIEW
GROUP BY USER_ID;

## ORDER BY 구문으로 순서 정의하기
SELECT
PRODUCT_ID
, SCORE
, ROW_NUMBER() OVER(ORDER BY SCORE DESC) AS 'ROW'
, RANK() OVER(ORDER BY SCORE DESC) AS 'RANK'
, DENSE_RANK() OVER(ORDER BY SCORE DESC) AS 'DENCE_RANK'
, LAG(PRODUCT_ID) OVER(ORDER BY SCORE DESC) AS LAG1
, LAG(PRODUCT_ID, 2) OVER(ORDER BY SCORE DESC) AS LAG2
, LEAD(PRODUCT_ID) OVER(ORDER BY SCORE DESC) AS LEAD1
, LEAD(PRODUCT_ID, 2) OVER(ORDER BY SCORE DESC) AS LEAD2
FROM POPULAR_PRODUCTS
ORDER BY SCORE DESC;

## ORDER BY 구문과 집약 함수 조합하기 - 윈도우 프레임 지정
SELECT
PRODUCT_ID
, SCORE
, ROW_NUMBER() OVER(ORDER BY SCORE DESC) AS 'ROW'
, SUM(SCORE) 
	OVER(ORDER BY SCORE DESC 
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS CUM_SCORE
, AVG(SCORE) 
	OVER(ORDER BY SCORE DESC
		ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS LOCAL_AVG
, FIRST_VALUE(PRODUCT_ID) 
	OVER(ORDER BY SCORE DESC
		ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS 'FIRST_VALUE'
, LAST_VALUE(PRODUCT_ID)
	OVER(ORDER BY SCORE DESC
		ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS 'LAST_VALUE'
FROM POPULAR_PRODUCTS
ORDER BY SCORE DESC;

/*
프레임 지정
* OVER() 내부에 지정
* 기본적으로는 ROWS BETWEEN start AND end 구문
* start, end에는 
	* CURRENT ROW
		* 현재 행
    * 'n PRECEDING'
		* n행 앞
    * 'n FOLLOWING'
		* n행 뒤
    * 'UNBOUNDED PRECENDING'
		* 이전 행 전부
    * 'UNBOUNDED FOLLOWING'
		* 이후 행 전부
    * 등의 키워드 지정
*/


## PARTITION BY와 ORDER BY 조합하기
SELECT
	CATEGORY
    , PRODUCT_ID
    , SCORE
    , ROW_NUMBER() OVER(PARTITION BY CATEGORY ORDER BY SCORE DESC) AS 'ROW'
    , RANK() OVER(PARTITION BY CATEGORY ORDER BY SCORE DESC) AS 'RANK'
    , DENSE_RANK() OVER(PARTITION BY CATEGORY ORDER BY SCORE DESC) AS 'DENSE_RANK'
    
FROM POPULAR_PRODUCTS
ORDER BY CATEGORY, SCORE DESC;

## 각 카테고리의 상위 N개 추출하기
SELECT *
FROM 
	(SELECT
		CATEGORY
        , PRODUCT_ID
        , SCORE
        , ROW_NUMBER() OVER(PARTITION BY CATEGORY ORDER BY SCORE DESC) AS RANK_
	FROM POPULAR_PRODUCTS
    ) AS T
WHERE RANK_ <= 2
ORDER BY CATEGORY, RANK_;

## 카테고리별 순위 최상위 상품 추출하는 쿼리 - 서브쿼리 없이
SELECT 
	DISTINCT CATEGORY
    , FIRST_VALUE(PRODUCT_ID)
		OVER(PARTITION BY CATEGORY ORDER BY SCORE DESC
			ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS PRODUCT_ID
FROM POPULAR_PRODUCTS;

## 행을 열로 변환하기 - 열로 전개할 데이터의 종류, 수를 미리 알고있어야함!
SELECT
	DT
    , MAX(CASE WHEN INDICATOR = 'IMPRESSIONS' THEN VAL END) AS IMPRESSIONS
    , MAX(CASE WHEN INDICATOR = 'SESSIONS' THEN VAL END) AS SESSIONS
    , MAX(CASE WHEN INDICATOR = 'USERS' THEN VAL END) AS USERS
FROM DAILY_KPI
GROUP BY DT
ORDER BY DT;