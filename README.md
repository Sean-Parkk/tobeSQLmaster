# To_be_SQLmaster
* SQL쿼리 작성 연습하기
  * [HackerRank](https://www.hackerrank.com/domains/sql?filters%5Bstatus%5D%5B%5D=unsolved&badge_type=sql) - 진행중
  * [Programmers](https://programmers.co.kr/learn/challenges?tab=sql_practice_kit) - 1문제 빼고 완료 (20/02/06)
- - - -
## HackerRank 공부 요약

#### SELECT의 기본적인 활용을 연습하기
* 난이도 자체는 쉬웠음
* 알게 된 것
  * SUBSTR
    * 엑셀에서 LEFT, RIGHT, MID 정말 많이 쓰는데 SQL에선 SUBSTR이 인덱스 참조엔 종결인듯
    * 특히 끝에서부터 찾는 SUBSTR(col,**-1**,n) 은 파이썬과 동일해서 편했음
  * 와일드카드
    * SQL에서 와일드카드론 %를 사용
    * (TMI) 엑셀에선 와일드카드로 * 사용 (0,?등 도 있지만 주로 *를 썼음)
* 그 외
  * 나머지 구문들은 다 아는 내용이어서 따로 구글링한 것은 없었음
  * 그래도 역시 쿼리 날려보는건 다다익선
  
  

- - - -
## Programmers 공부 요약
* 몇 문제 빼고는 막히지 않고 한 번에 풀었음
 * SQL 문제들을 풀어보면 SELECT에서 WEHRE, HAVING, ORDER 관련 문제가 많음
  * 간혹 JOIN 나오는 정도?
 * 서브쿼리나 윈도우함수는 한 번도 안나왔음
  * 내가 쉬운것만 골라서 풀었을 가능성도 있음
* 추가로 공부해야 할 것
 * JOIN
  * 지금 LEFT JOIN 말고는 쓰는데 약간 버벅거림
  * JOIN 개괄적으로 다시 공부
 * DATE 처리
  * DATE 처리하는 것 다시 공부해야함
  * 날 잡고 빡세게 공부해서 자유자재로 쓸 수 있도록 하기
 
* 못 푼 한 문제 있음
 * 그 문제는 조금 더 공부하고 [나중에 풀어보자](https://programmers.co.kr/learn/courses/30/lessons/59413)
  * (무려 LV.4임!)
 * 못 푼 이유
  * 시간대를 DISTINCT하면 0~23시 중 없는 시간대가 있음
  * 없는 시간대에 대해 DUMMY를 만들어줘야 하는데 그 방법을 모름
  * 정답을 봐도 이해가 잘 안되어서 일단 PASS
