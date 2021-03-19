# Easy 난이도
## 알게된 것
- LIMIT, OFFSET
  - LIMIT 1 OFFSET 1: 2번째 값부터 시작, 1개의 값 조회
  - LIMIT 3 OFFSET 10: 11번째 값부터 시작, 3개의 값 조회

## 쿼리
### Combine Two Tables
- [링크](https://leetcode.com/problems/combine-two-tables/)
```SQL
SELECT P.FirstName
    , P.LastName
    , A.City
    , A.State
FROM Person P
LEFT JOIN Address A
ON P.PersonId = A.PersonId;
```

###  Second Highest Salary
- [링크](https://leetcode.com/problems/second-highest-salary/)

```SQL
-- 서브쿼리로 풀기
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary NOT IN (SELECT MAX(Salary) FROM Employee)

-- OFFSET으로 풀기
SELECT IFNULL((SELECT DISTINCT Salary) 
    FROM Employee
    ORDER BY Salary
    LIMIT 1 OFFSET 1), NULL) AS SecondHighestSalary
```

### Employees Earning More Than Their Managers
[링크](https://leetcode.com/problems/employees-earning-more-than-their-managers/)

```SQL
-- SELECT * FROM table1, table2
SELECT A.Name AS Employee
FROM Employee A
JOIN Employee B
ON A.ManagerId = B.ID
AND A.Salary > B.Salary;

-- Join
SELECT A.NAME AS Employee
FROM Employee AS A, Employee AS B
WHERE A.ManagerId = B.ID
    AND A.Salary > B.Salary
```

### Duplicate Emails
- [링크](https://leetcode.com/problems/duplicate-emails/)
```SQL
-- With Subquery
SELECT Email
FROM
    (SELECT Email, COUNT(Email) AS count
    FROM Person
    GROUP BY Email) AS t
WHERE count > 1;

-- With Having
SELECT Email
FROM Person
GROUP BY Email
HAVING COUNT(Email) > 1;
```

### Customers Who Never Order
- [링크](https://leetcode.com/problems/customers-who-never-order/solution/)

```SQL
-- Join
SELECT C.NAME AS Customers
FROM Customers C
LEFT JOIN Orders O
ON C.Id = O.CustomerId
WHERE O.Id IS NULL;

-- NOT IN
SELECT Name AS Customers
FROM Customers
WHERE Id NOT IN (SELECT CustomerId From Orders);
```

## Delete Duplicate Emails
- [링크](https://leetcode.com/problems/delete-duplicate-emails/)

```SQL
DELETE p1 
FROM Person p1, Person p2
WHERE
    p1.Email = p2.Email AND p1.Id > p2.Id;
```

## Rising Temperature
- [링크](https://leetcode.com/problems/rising-temperature/)

```SQL
SELECT w1.id
FROM Weather w1
Join Weather w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
AND w1.temperature > w2.temperature
```

## Big Countries
- [링크](https://leetcode.com/problems/big-countries/)

```SQL
SELECT name, population, area
FROM World
WHERE area > 3000000
    OR population > 25000000;
```


## Classes More Than 5 Students
- [링크](https://leetcode.com/problems/classes-more-than-5-students/)

```SQL
SELECT class
FROM courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;
```

## Not Boring Movies
- [링크](https://leetcode.com/problems/not-boring-movies/)

```SQL
SELECT *
FROM cinema
WHERE description != 'boring'
HAVING MOD(id, 2) = 1
ORDER BY rating DESC;
```

## Swap Salary
- [링크](https://leetcode.com/problems/swap-salary/)

```SQL
UPDATE Salary
SET sex =
CASE WHEN sex = 'm' THEN 'f' ELSE 'm' END
```


