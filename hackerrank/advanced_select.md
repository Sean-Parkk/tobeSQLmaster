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

## Type of Triangle
date: 20/02/21  
삼각형의 세 변의 길이가 A, B, C로 주어졌을 때,  
삼각형인지 판별하고 삼각형 종류 구별하기  
[문제 보기](https://www.hackerrank.com/challenges/what-type-of-triangle/problem)

```SQL
SELECT 
CASE WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
WHEN A = B AND B = C THEN 'Equilateral' 
WHEN A = B OR B = C OR A = C THEN 'Isosceles'
ELSE 'Scalene' END
FROM TRIANGLES;
```

## Binary Tree Nodes
date:20/02/22  
서브쿼리 활용  
[문제 보기](https://www.hackerrank.com/challenges/binary-search-tree-1/problem)
```SQL
SELECT N, 
IF(P IS NULL, 'Root', 
   IF((SELECT COUNT(*) FROM BST WHERE B.N = P) > 0, 'Inner', 'Leaf'))
FROM BST AS B
ORDER BY N;
```
