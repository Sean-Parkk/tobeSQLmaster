### 최댓값 구하기
date: 20/20/04  
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59415)

MAX를 쓰지 않고, LIMIT 1 로 최댓값을 구하기
```SQL
SELECT DATETIME as 시간
FROM ANIMAL_INS
ORDER BY DATETIME DESC
LIMIT 1;
```

### 최솟값 구하기

date: 20/02/04  
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59038)  
MIN 사용해보기
```SQL
SELECT MIN(DATETIME) AS 시간
FROM ANIMAL_INS;
```

### 개수 구하기

date: 20/02/04  
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59406)  
COUNT 사용하기  
```SQL
SELECT COUNT(ANIMAL_ID) AS count
FROM ANIMAL_INS;
```

### 중복 제거하기
date: 20/02/04  
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59408)  
DISTINCT 사용하기  
```SQL
SELECT COUNT(DISTINCT NAME) as count
FROM ANIMAL_INS;
```
