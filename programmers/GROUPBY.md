## WHERE, IN, GROUP BY
date: 20/02/05  
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59040)
```SQL
SELECT ANIMAL_TYPE, COUNT(*) AS COUNT
FROM ANIMAL_INS
WHERE ANIMAL_TYPE IN ('Cat', 'Dog')
GROUP BY ANIMAL_TYPE
```

## GROUP BY, HAVING, ORDER BY
date: 20/02/05  
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59041)
```SQL
SELECT NAME, COUNT(*) AS COUNT
FROM ANIMAL_INS
WHERE NAME IS NOT NULL
GROUP BY NAME
HAVING COUNT >= 2
ORDER BY NAME;
```

## HOUR 함수
date: 20/02/05  
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59412)
```SQL
SELECT HOUR(DATETIME) AS HOUR, COUNT(*)
FROM ANIMAL_OUTS
GROUP BY HOUR
HAVING HOUR >= 9 AND HOUR <= 19;
```

## 못 푼 문제...  
https://programmers.co.kr/learn/courses/30/lessons/59413
