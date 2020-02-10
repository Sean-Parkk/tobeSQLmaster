# 기본적인 Aggregation! 
* 알게 된 것
  * ROUND(col, n)
    * 반올림할 때 사용하는 쿼리문
    * EXCEL과 함수가 동일해서 바로 이해됨
    * 하지만 있다는걸 모르면 그건 모르는거다! *메타인지!*
  * SELECT에서 계산
    * SELECT (MAX(col1) - MIN(col1)) 이런거 가능
  * CEIL
    * 올림 함수
    * 반대는 FLOOR()

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

## 
date: 
  
[문제 보기]()  
```SQL

```

## 
date: 
  
[문제 보기]()  
```SQL

```
