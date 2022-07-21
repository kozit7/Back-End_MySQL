-- 서브쿼리(SELECT)
-- SELECT (SELECT * FROM 테이블명)
-- FROM 테이블명
-- WHERE 조건식
-- 급여가 2000이상인 사원번호,직업,부서명을 조회(JOIN)
SELECT EMPNO, JOB, DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL >= 2000;
-- 급여가 2000이상인 사원번호,직업,부서명을 조회(서브쿼리)
SELECT EMPNO, JOB,(SELECT DNAME FROM DEPT D WHERE E.DEPTNO = D.DEPTNO) DNAME
FROM EMP E
WHERE SAL >= 2000;

-- SELECT *
-- FROM (SELECT * FROM 테이블명)
-- WHERE 조건식
-- 부서별 최대 인원수를 가진 부서명을 검색
-- 부서별(GROUP BY) 최대(MAX) 인원수(COUNT)   MAX와COUNT는 함수이기때문에 SELECT에 써야한다.

SELECT MAX(DEPTNOCNT)
FROM (SELECT COUNT(*) DEPTNOCNT 
		FROM EMP 
	  GROUP BY DEPTNO
      )AS EMPVIEW -- 테이블명이 반드시 필요하다.
      ;

SELECT COUNT(*) DEPTNOCNT -- FROM (SELECT * FROM 테이블명) 괄호안에 가상테이블 을 넣는다.
FROM EMP 
GROUP BY DEPTNO;