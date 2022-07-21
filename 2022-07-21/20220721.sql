use information;

select *
from member;

select *
from board;

alter table board drop writer; -- 테이블 컬럼 삭제

-- join member테이블과 board를 내부조인
select *
from member as m, 
	 board b
where m.id = b.id; -- id 앞에 테이블명.id가 들어가야한다.

select bon,title,name,regdate,cnt
from member as m,
board b
where m.id = b.id;

-- jong member테이블과 board테이블과 내부조인
-- (표기법 : ANSI)
select bon,title,name,regdate,cnt
from member as m
join board b
ON m.id = b.id
where bon=5;

select * from emp;
select * from dept;

select empno,job,hiredate,loc
from emp e, dept d
where e.deptno = d.deptno;

select empno,job,hiredate,loc -- ANSI 방법
from emp e join dept d -- 내부 JOIN
on e.deptno = d.deptno;

select *
-- 왼쪽테이블(EMP)에는 있고, 오른쪽테이블(DEPT)에는 없는 데이터
from emp e LEFT OUTER join dept d -- 외부 JOIN
on e.deptno = d.deptno;

select *
-- 왼쪽테이블(EMP)에는 없고, 오른쪽테이블(DEPT)에는 있는 데이터
from emp e right OUTER join dept d -- 외부 JOIN
on e.deptno = d.deptno;

-- 총 직원 수 , 총 급여 금액 (집단함수)
SELECT count(*)AS '총 직원 수' , 
	   SUM(SAL)AS '총 급여 금액',
       AVG(SAL)AS '급여 평균',
       MAX(SAL)AS '최대 급여',
       MIN(SAL)AS '최저 급여',
       DEPTNO
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2500; -- GROUP BY 를 쓸려고하면 GROUP BY를 먼저쓴후 HAVING 절을쓰고 그뒤에 조건식을 붙여주면 된다.

-- 1. 각 부서별로 지급되는 총 월급은?
SELECT DEPTNO,SUM(SAL)AS '총 급여 금액'
FROM EMP
GROUP BY DEPTNO;

-- 2. 각 직업별로 월급이 제일 많은 사람과 제일 적은 사람의 차이는?
SELECT JOB, MAX(SAL)AS '최대급여', MIN(SAL)AS '최소 급여', MAX(SAL) - MIN(SAL) '급여차이'
FROM EMP
GROUP BY JOB;

-- 3. 커미션이 없는 사람중에 각 부서별로 월급이 제일 작은 사람은?
SELECT ENAME,COMM,DEPTNO, MIN(SAL)AS '최소 급여'
WHERE COMM IS NULL OR COMM = 0
GROUP BY DEPTNO;

-- 4. 급여가 3000대인 회원의 사원번호, 성명, 일하는 지역을 검색
SELECT EMPNO, ENAME, LOC
FROM EMP E 
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL BETWEEN 3000 AND 3900;

-- 5. 성명에 'LA'가 포함된 회원의 성명, 부서명, 일하는 지역을 검색
SELECT ENAME, DNAME, LOC
FROM EMP E
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE ENAME LIKE '%LA%';