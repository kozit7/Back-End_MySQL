use board;

create table emp(
		EMPNO varchar(5) primary key,
        ENAME varchar(15),
        JOB varchar(15),
        MGR int,
        HIREDATE varchar(15),
        SAL int,
        COMM int,
        DEPTNO int
);


insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
		values('7369','SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
			 ('7499','ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
             ('7521','WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
             ('7566','JONES','MANAGER',7839,'1981-04-02',2975,NULL,20),
             ('7654','MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),
             ('7698','BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30),
             ('7782','CLACK','MANAGER',7839,'1981-06-01',2450,NULL,10),
             ('7788','SCOTT','ANALYST',7566,'1982-12-09',3000,NULL,20),
             ('7839','KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
             ('7844','TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),
             ('7876','ADAMS','CLERK',7788,'1983-01-12',1100,NULL,20),
             ('7900','JAMES','CLERK',7689,'1981-12-03',950,NULL,30),
             ('7902','FORD','ANALYST',7566,'1981-12-03',3000,NULL,20),
             ('7934','MILLER','CLERK',7782,'1980-01-23',1300,NULL,10)
             ;
             
select * from emp
where empno='7566'; -- 사원번호 (ENPNO) 7566 번

-- 사원테이블에서 부서번호 (DEPTNO) 가 20번이고 월급 (SALARY) 이 400 이상인
-- 사원의 이름 (ENAME) 과 직책 (JOB) 검색
select ENAME, JOB-- 사원의 이름(ENAME)과 직책(JOB) 검색
from emp-- 사원테이블
where DEPTNO = 20 -- 부서번호 (DEPTNO)가 20번
AND SAL >= 400; -- 이고(AND) 월급(SALARY)이 400이상

-- 사원테이블에서 월급(SAL)이 200대인
-- 사원의 이름(ENAME)과 직책(JOB) 검색 
SELECT ENAME, JOB
FROM EMP
WHERE SAL >= 2000
AND SAL <= 2999;

-- 사원테이블에서 월급(SAL)이 2000 대인
-- 사원의 이름(ENAME)과 직책(JOB) 검색(BETWEEN 연산자)
SELECT ENAME, JOB
FROM EMP
WHERE SAL BETWEEN 2000 AND 2999; -- 컬럼이 다른것에는 BETWEEN을 사용할수 없다.

-- 사원테이블에서 직업이 'SALESMAN' 이거나 'MANAGER' 인
-- 사원의 사원번호와, 이름을 검색
SELECT EMPNO, ENAME
FROM EMP
WHERE job = 'SALESMAN' OR JOB = 'MANAGER';

-- 사원테이블에서 직업이 'SALESMAN' 이거나 'MANAGER' 인
-- 사원의 사원번호와, 이름을 검색(IN)
SELECT EMPNO, ENAME
FROM EMP
WHERE job IN ('SALESMAN' ,JOB = 'MANAGER');

-- 사원테이블에서 COMM이 NULL값인
-- 사원의 사원번호와, 이름을 검색
select EMPNO, ENAME
from emp
where COMM is NULL; -- is null이면 null값인것을 조회 / is not null 이면 null값이 아닌것을 조회

-- 사원테이블에서 이름이'SMITH'인 사원의
-- 월급과 부서번호를 검색
select SAL, DEPTNO
from EMP
where ENAME = 'SMITH';

-- 사원테이블에서 이름이'S'로 시작하는 사원의
-- 월급과 부서번호를 검색
select SAL, DEPTNO
from EMP
where ENAME like 'S%' ;-- %는 모든문자로 생각하면된다.

-- 사원테이블에서 급여가 높은 순서부터 정렬하세요.
select *
from EMP
order by SAL DESC; -- order by 'column' asc는 오름차순(asc는생략가능)
				   -- order by 'column' desc는 내림차순 으로 정렬해준다.
                   
-- 1. 사원 테이블에서 사원 번호와 이름과 월급을 출력하라
select EMPNO, ENAME, SAL
from emp;

-- 2. 직위가 'SALESMAN'이고 월급이 1000이상인 사원의 이름과 월급을 출력하라.
select ENAME, SAL
from emp
where job ='SALESMAN' and SAL >= 1000;

-- 3. 직위가 MANAGER인 사원을 뽑는데 월급이 높은 사람순으로 이름, 직위, 월급을 출력하라.
select ENAME, JOB, SAL, COMM, DEPTNO
from emp
where job = 'MANAGER' 
order by SAL DESC;

-- 4. 이름이 SCOTT인 사원의 이름, 월급, 직업, 입사일, 부서 번호를 출력하라
select ENAME, SAL, JOB, HIREDATE, DEPTNO
from emp
where ENAME = 'SCOTT';

-- 5. 81년 11월 17일에 입사한 사원의 이름, 월급, 직업, 입사일을 출력하라
select ENAME, JOB, HIREDATE
FROM EMP
WHERE HIREDATE = '1981-11-17';

-- 6. 월급이 3600 이상인 사원들의 이름과 월급을 출력하라
SELECT ENAME, JOB
FROM EMP
WHERE SAL >= 3600;

-- 7. 월급이 1200 이하인 사원들의 이름과 월급, 직업, 부서번호를 출력하라
SELECT ENAME, SAL, JOB, DEPTNO
FROM EMP
WHERE SAL <= 1200;

-- 8. 직업이 SALESMAN이 아닌 사원들의 이름과 부서 번호, 직업을 출력하라
SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE JOB != 'SALESMAN';

-- 9. 월급이 1000에서 3000사이가 아닌 사원들의 이름과 월급을 출력하라
SELECT ENAME, SAL
FROM EMP
WHERE SAL not between 1000 and 3000;

-- 10. 이름의 끝 글자가 T로 끝나는 사원들의 이름과 월급을 출력하라
select ENAME, SAL
from emp
where ENAME like '%T';

-- 11. 커미션이 NULL인 사원들의 이름과 커미션을 출력하라
select ENAME, COMM
from emp
where COMM is null;

-- 12. 직업이 SALESMAN, ANALYST, MANAGER가 아닌 사원들의 이름, 월급, 직업을 출력하라
select ENAME, SAL, JOB
from emp
where job not in ('SALESMAN', 'ANALYST','MANAGER');