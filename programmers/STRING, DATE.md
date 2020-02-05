## WHERE, IN
date: 20/02/05  
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59046)  
```SQL
SELECT ANIMAL_ID, NAME, SEX_UPON_INTAKE
FROM ANIMAL_INS
WHERE NAME IN('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty');
```

## 와일드카드
date: 20/02/05  
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59047)  
```SQL
SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE NAME LIKE '%el%' AND ANIMAL_TYPE = 'Dog'
ORDER BY NAME;
```

## CASE WHEN
date: 20/02/05  
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59409)  
```SQL
SELECT ANIMAL_ID, NAME, 
(CASE  WHEN SEX_UPON_INTAKE LIKE('%Neutered%') THEN 'O' 
            WHEN SEX_UPON_INTAKE LIKE('%Spayed%') THEN 'O' 
            ELSE 'X' END)  AS '중성화'
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;
```

## JOIN, DATE
date: 20/02/05  
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59411)  
```SQL
SELECT o.ANIMAL_ID, o.NAME
FROM ANIMAL_OUTS AS o LEFT JOIN ANIMAL_INS AS i
ON o.ANIMAL_ID = i.ANIMAL_ID
ORDER BY o.DATETIME - i.DATETIME DESC
LIMIT 2;
```

## DATE_FORMAT
date: 20/02/05  
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59414)  
```SQL
SELECT ANIMAL_ID, NAME, DATE_FORMAT(DATETIME, '%Y-%m-%d')
FROM ANIMAL_INS;
```
