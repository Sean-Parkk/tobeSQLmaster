# 기본적인 Aggregation! 
* 알게 된 것
  * ROUND(col, n)
    * ROUND(col, n, 1) 은 n 이후 !
    * 반올림할 때 사용하는 쿼리문
    * EXCEL과 함수가 동일해서 바로 이해됨
    * 하지만 있다는걸 모르면 그건 모르는거다! *메타인지!*
    
  * SELECT에서 계산
    * SELECT (MAX(col1) - MIN(col1)) 이런거 가능
  * CEIL()
    * 올림 함수
    * 반대는 FLOOR()
  * ABS()
    * 절대값 구하는 함수
    * 이것 또한 EXCEL과 동일
  * POWER(val, n)
    * val의 n제곱
  * SQRT(n)
    * n의 제곱근
    
## Revising Aggregations - The Count Function
date: 20/02/10  
Query a count of the number of cities in CITY having a Population larger than 100,000.  
[문제 보기](https://www.hackerrank.com/challenges/revising-aggregations-the-count-function/problem)  
```SQL
SELECT COUNT(*) AS COUNT
FROM CITY
WHERE POPULATION > 100000;
```

## Revising Aggregations - The Sum Function
date: 20/02/10
  Query the total population of all cities in CITY where District is California.
[문제 보기](https://www.hackerrank.com/challenges/revising-aggregations-sum/problem?h_r=next-challenge&h_v=zen)  
```SQL
SELECT SUM(POPULATION) AS SUM
FROM CITY
WHERE DISTRICT = 'California';
```

## Revising Aggregations - Averages
date: 20/02/10
Query the average population of all cities in CITY where District is California.  
[문제 보기](https://www.hackerrank.com/challenges/revising-aggregations-the-average-function/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT AVG(POPULATION) AS AVG
FROM CITY
WHERE DISTRICT = 'California';
```

## Average Population
date: 20/02/10
Query the average population for all cities in CITY, rounded down to the nearest integer.  
[문제 보기](https://www.hackerrank.com/challenges/average-population/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT ROUND(AVG(POPULATION), 0) AS AVG
FROM CITY;
```

## Japan Population
date: 20/02/10
Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.  
[문제 보기](https://www.hackerrank.com/challenges/japan-population/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT SUM(POPULATION) AS SUM
FROM CITY
WHERE COUNTRYCODE = 'JPN';
```

## Population Density Difference
date: 20/02/10
Query the difference between the maximum and minimum populations in CITY.  
[문제 보기](https://www.hackerrank.com/challenges/population-density-difference/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT (MAX(POPULATION) - MIN(POPULATION)) AS DIFF
FROM CITY;
```

## The Blunder
date: 20/02/11
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed), and the actual average salary.
Write a query calculating the amount of error (i.e.: actual-miscalculated average monthly salaries), and round it up to the next integer.  
[문제 보기](https://www.hackerrank.com/challenges/the-blunder/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT CEIL(AVG(Salary)-AVG(REPLACE(Salary,'0',''))) 
FROM EMPLOYEES;
```

## Weather Observation Station 2
date: 
Query the following two values from the STATION table:  
1. The sum of all values in LAT_N rounded to a scale of 2 decimal places.  
2. The sum of all values in LONG_W rounded to a scale of 2 decimal places.  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-2/problem)  
```SQL
SELECT ROUND(SUM(LAT_N),2) AS SUM1, ROUND(SUM(LONG_W),2) AS SUM2
FROM STATION;
```

## Weather Observation Station 13
date: 20/02/11
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than  and less than . Truncate your answer to  decimal places.  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-13/problem?h_r=next-challenge&h_v=zen)  
```SQL
SELECT ROUND(SUM(LAT_N), 4) AS SUM
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;
```

## Weather Observation Station 14
date: 20/02/11
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places.  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-14/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT ROUND(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;
```

## Weather Observation Station 15
date: 20/02/11
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4 decimal places.  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-15/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);
```

## Weather Observation Station 16
date: 20/02/11
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-16/problem)  
```SQL
SELECT ROUND(MIN(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7780;
```

## Weather Observation Station 17
date: 20/02/11
Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places.  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-17/problem?h_r=next-challenge&h_v=zen)  
```SQL
SELECT ROUND(LONG_W,4)
FROM STATION
WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780);
```

## Weather Observation Station 18
date: 20/02/11  
링크 참조  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-18/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT ROUND(ABS(MAX(LAT_N) - MIN(LAT_N)) + ABS(MAX(LONG_W) - MIN(LONG_W)), 4)
FROM STATION;
```

## Weather Observation Station 19
date: 20/02/11
링크 참조  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-19/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT ROUND(SQRT(POWER(MAX(LAT_N)-MIN(LAT_N),2) + POWER(MAX(LONG_W)-MIN(LONG_W),2)),4)
FROM STATION;
```

## Weather Observation Station 20
date: 20/02/11
A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-20/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
풀어야함!
```
