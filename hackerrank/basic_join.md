# Enjoy Join Query

* 알게된것
  * JOIN
    * JOIN ~ ON a.a = b.b 뿐만 아니라 >, <등과 같이 등부호 계산도 가능.
  * JOIN과 LEFT JOIN 차이
    * JOIN: NULL값 제외함
    * LEFT JOIN: NULL값 포함해서 출력
  * SELECT
    * CASE WHEN AAA END 에서 AAA에 해당하지 않는 값은 NULL로 나옴
    
  
  
## African Cities
date: 20/02/11  
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.  
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.  
[문제 보기](https://www.hackerrank.com/challenges/african-cities/problem)  
```MYSQL
SELECT C.NAME
FROM CITY AS C LEFT JOIN COUNTRY AS CO
ON C.COUNTRYCODE = CO.CODE
WHERE CO.CONTINENT = 'Africa';
```

## Average Population of Each Continent
date: 20/02/11  
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.  
[문제 보기](https://www.hackerrank.com/challenges/average-population-of-each-continent/problem?h_r=next-challenge&h_v=zen)  
```SQL
SELECT CO.CONTINENT, FLOOR(AVG(C.POPULATION))
FROM COUNTRY AS CO JOIN CITY AS C
ON (C.COUNTRYCODE = CO.CODE)
GROUP BY CO.CONTINENT;
```

## The Report
date:20/02/13  
링크 참고  
[문제 보기](https://www.hackerrank.com/challenges/the-report/problem)  
```SQL
SELECT CASE WHEN G.GRADE >= 8 THEN S.NAME END,
G.GRADE, S.MARKS
FROM STUDENTS AS S INNER JOIN GRADES AS G
ON S.MARKS >= G.MIN_MARK AND S.MARKS <= G.MAX_MARK
ORDER BY G.GRADE DESC, S.NAME, S.MARKS ASC;
```

## Top Competitors
date:20/02/13  
링크 참고  
12줄짜리 쿼리문... 지금까지 쓴 쿼리 중 가장 김 ㄷㄷ..  
[문제 보기](https://www.hackerrank.com/challenges/full-score/problem)  
```SQL
SELECT S.hacker_id, H.name
FROM Submissions AS S 
INNER JOIN Hackers AS H
ON S.Hacker_id = H.hacker_id 
INNER JOIN Challenges AS C 
ON S.challenge_id = C.challenge_id
INNER JOIN Difficulty AS D
ON C.difficulty_level = D.difficulty_level
WHERE S.score = D.score AND C.difficulty_level = D.difficulty_level
GROUP BY H.hacker_id, H.name
HAVING COUNT(S.hacker_id) > 1
ORDER BY COUNT(S.hacker_id) DESC, S.hacker_id ASC;
```

## Asian Population
date:20/02/23  
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.  
[문제 보기](https://www.hackerrank.com/challenges/asian-population/problem)  
```SQL
SELECT SUM(CITY.POPULATION)
FROM CITY 
LEFT JOIN COUNTRY
ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = 'Asia';
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
