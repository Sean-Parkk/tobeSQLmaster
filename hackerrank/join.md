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

## 
date:  
  
[문제 보기]()  
```SQL

```

