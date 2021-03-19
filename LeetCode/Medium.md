# Medium 난이도
## 알게된 것
- DENSE_RANK(), RANK(), ROW_NUMBER()
  - 헷갈려!
    - 3rd bullet 에 달리는 예시는 (10, 10, 7, 7, 7, 4) 를 기준으로 예시를 듦
  - DENSE_RANK(): 겹칠 땐 동 순위로, 그 다음 순위는 +1 
    - (1, 1, 2, 2, 2, 3)
  - RANK(): 겹칠 땐 동 순위로, 그 다음 순위는 동 순위 개수 + 1 -> 이게 무슨 말이냐면 예시를 보자
    - (1, 1, 3, 3, 3, 6)
  - ROW_NUMBER(): 동 순위 그런거 없음
    - (1, 2, 3, 4, 5, 6)

## 쿼리
### Nth Highest Salary
- [링크](https://leetcode.com/problems/nth-highest-salary/)
```SQL
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    DECLARE M INT;
    SET M = N-1;
  RETURN (
      # Write your MySQL query statement below.
      SELECT DISTINCT Salary as getNthHighestSalary
      FROM Employee
      ORDER BY Salary DESC
      LIMIT M, 1);
END
```

## Rank Scores
- [링크](https://leetcode.com/problems/rank-scores/)
```SQL
SELECT score
    , DENSE_RANK() OVER(ORDER BY score DESC) AS `rank`
FROM scores
ORDER BY score DESC;
```

