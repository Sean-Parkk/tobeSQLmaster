# SELECT의 기본적인 활용을 연습하기
* 난이도 자체는 쉬웠음
* 알게 된 것
  * SUBSTR
    * 엑셀에서 LEFT, RIGHT, MID 정말 많이 쓰는데 SQL에선 SUBSTR이 인덱스 참조엔 종결인듯
    * 특히 끝에서부터 찾는 SUBSTR(col,**-1**,n) 은 파이썬과 동일해서 편했음
  * 와일드카드
    * SQL에서 와일드카드론 %를 사용
    * (TMI) 엑셀에선 와일드카드로 * 사용 (0,?등 도 있지만 주로 *를 썼음)
* 그 외
  * 나머지 구문들은 다 아는 내용이어서 따로 구글링한 것은 없었음
  * 그래도 역시 쿼리 날려보는건 다다익선

## Revising the Select Query ID
date: 20/02/08  
Query all columns for all American cities in CITY with populations larger than 100000. The CountryCode for America is USA.  
[문제 보기](https://www.hackerrank.com/challenges/revising-the-select-query/problem)  
```SQL
SELECT *
FROM CITY
WHERE POPULATION > 100000 AND COUNTRYCODE = 'USA';
```

## Revising the Select Query II
date: 20/02/08  
Query the names of all American cities in CITY with populations larger than 120000. The CountryCode for America is USA.  
[문제 보기](https://www.hackerrank.com/challenges/revising-the-select-query-2/problem?h_r=next-challenge&h_v=zen)  
```SQL
SELECT NAME
FROM CITY
WHERE POPULATION > 120000 AND COUNTRYCODE = 'USA';
```

## SELECT ALL
date: 20/02/08  
Query all columns (attributes) for every row in the CITY table.  
[문제 보기](https://www.hackerrank.com/challenges/select-all-sql/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT * FROM CITY;
```

## Select By ID
date: 20/02/08  
Query all columns for a city in CITY with the ID 1661.  
[문제 보기](https://www.hackerrank.com/challenges/select-by-id/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)
```SQL
SELECT *
FROM CITY
WHERE ID = 1661;
```

## Japanese Cities' Attributes
date: 20/02/08  
Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.  
[문제 보기](https://www.hackerrank.com/challenges/japanese-cities-attributes/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT * 
FROM CITY
WHERE COUNTRYCODE = 'JPN';
```

## Japanese Cities' Names
date: 20/02/08  
Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.  
[문제 보기](https://www.hackerrank.com/challenges/japanese-cities-name/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';
```

## Weather Observation Station 1
date: 20/02/08  
Query a list of CITY and STATE from the STATION table.  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-1/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT CITY, STATE
FROM STATION;
```

## Weather Observation Station 3
date: 20/02/08  
Query a list of CITY names from STATION with even ID numbers only. You may print the results in any order, but must exclude duplicates from your answer.  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-3/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID,2) = 0;
```

## Weather Observation Station 4
date: 20/02/08  
Let N be the number of CITY entries in STATION, and let N' be the number of distinct CITY names in STATION; query the value of N - N' from STATION. In other words, find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-4/problem?h_r=next-challenge&h_v=zen)  
```SQL
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION;
```

## Weather Observation Station 6
date: 20/02/08  
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-6/problem)  
```SQL
SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(SUBSTR(CITY, 1, 1)) IN ('A', 'E', 'I', 'O', 'U');
```

## Weather Observation Station 7
date: 20/02/08  
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-7/problem?h_r=next-challenge&h_v=zen)  
```SQL
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY,-1)) IN('a', 'e', 'i', 'o', 'u');
```

## Weather Observation Station 8
date: 20/02/08  
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-8/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT CITY
FROM STATION
WHERE UPPER(SUBSTR(CITY,1,1)) IN('A', 'E', 'I', 'O', 'U') AND
UPPER(SUBSTR(CITY,-1,1)) IN('A', 'E', 'I', 'O', 'U');
```

## Weather Observation Station 9
date: 20/02/08  
Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-9/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(SUBSTR(CITY, 1, 1)) NOT IN ('A', 'E', 'I', 'O', 'U');
```

## Weather Observation Station 10
date: 20/02/08  
Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-10/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(SUBSTR(CITY, -1, 1)) NOT IN ('A', 'E', 'I', 'O', 'U');
```

## Weather Observation Station 11
date: 20/02/08  
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-11/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(SUBSTR(CITY,1,1)) NOT IN('A', 'E', 'I', 'O', 'U') OR
UPPER(SUBSTR(CITY,-1,1)) NOT IN('A', 'E', 'I', 'O', 'U');
```

## Weather Observation Station 12
date: 20/02/08  
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.  
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-12/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(SUBSTR(CITY,1,1)) NOT IN('A', 'E', 'I', 'O', 'U') AND
UPPER(SUBSTR(CITY,-1,1)) NOT IN('A', 'E', 'I', 'O', 'U');
```

## Higher Than 75 Marks
date: 20/02/08  
Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.  
[문제 보기](https://www.hackerrank.com/challenges/more-than-75-marks/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY SUBSTR(NAME, -3, 3), ID;
```

## Employee Names
date: 20/02/08  
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is their monthly salary.  
[문제 보기](https://www.hackerrank.com/challenges/name-of-employees/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT name
FROM Employee
ORDER BY name;
```

## Employee Salaries
date: 20/20/08  
Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.  
[문제 보기](https://www.hackerrank.com/challenges/salary-of-employees/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen)  
```SQL
SELECT name
FROM Employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id;
```

## Weather Observation Station 5
date: 20/02/24  
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name).  
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.    
[문제 보기](https://www.hackerrank.com/challenges/weather-observation-station-5/problem)  
```SQL
SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY), CITY
LIMIT 1;

SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY
LIMIT 1;
```
