# Enjoy Join Query

* 알게된것
  * JOIN과 LEFT JOIN 차이
    * JOIN: NULL값 제외함
    * LEFT JOIN: NULL값 포함해서 출력
  
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

## 
date:  
  
[문제 보기]()  
```SQL

```

