## The PADS
date: 20/02/17
링크 참고  
[문제 보기](https://www.hackerrank.com/challenges/the-pads/problem)  

```SQL
SELECT CONCAT(NAME,'(',SUBSTR(Occupation,1,1),')') AS Occupation
FROM OCCUPATIONS
ORDER BY NAME;

SELECT CONCAT('There are a total of ', COUNT(*),' ', LOWER(Occupation),'s.') AS O
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY O;
```
