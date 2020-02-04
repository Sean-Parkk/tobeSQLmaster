## IS NULL
date: 20/02/05  
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59039)  
```SQL
SELECT ANIMAL_ID
FROM ANIMAL_INS
WHERE NAME IS NULL;
```

## IS NOT NULL
date: 20/02/05  
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59407)  
```SQL
SELECT ANIMAL_ID
FROM ANIMAL_INS
WHERE NAME IS NOT NULL
```

## IFNULL
date: 20/02/05  
[문제 보기](https://programmers.co.kr/learn/courses/30/lessons/59410)  
```SQL
SELECT ANIMAL_TYPE, IFNULL(NAME, 'No name'), SEX_UPON_INTAKE
FROM ANIMAL_INS
ORDER BY ANIMAL_ID
```

IFNULL은 처음 썼다!
