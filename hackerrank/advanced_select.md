# Select 쿼리 응용!
* SUBSTR()
  * 역시 꼭 기억해놔야하는 함수인듯. 자주 써먹을 듯
* CONCAT(a,b,c)
  * a, b, c 다 붙이기. 컬럼명, 계산컬럼 모두 


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
