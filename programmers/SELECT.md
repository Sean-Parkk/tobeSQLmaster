## 모든 레코드 조회하기  
date: 20/02/04
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59034)  
```SQL
SELECT *
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;
```

## 역순 정렬하기  
date: 20/02/04  
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59035)  
```SQL
SELECT NAME, DATETIME
FROM ANIMAL_INS
ORDER BY ANIMAL_ID DESC;
```

## 특정 조건을 만족하는 레코드 조회하기
date: 20/02/04  
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59036)  
```SQL
SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE INTAKE_CONDITION = 'Sick';
```

## 특정 조건 제외 후 조회하기
date: 20/02/04
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59037#fn1)
```SQL
SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE INTAKE_CONDITION != 'Aged';


## 레코드 정렬하기
date: 20/02/04
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59403)
```SQL
SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;
```

## 여러 기준으로 정렬하기
date: 20/02/05
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59404)
```SQL
SELECT ANIMAL_ID, NAME, DATETIME
FROM ANIMAL_INS
ORDER BY NAME, DATETIME DESC;
```

## 상위 N개 레코드
date: 20/02/05
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59405)
```SQL
SELECT NAME
FROM ANIMAL_INS
ORDER BY DATETIME
LIMIT 1;
```
