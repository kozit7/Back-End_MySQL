-- 1) 'ALLEN'의 직무와 같은 사람의 이름, 부서명, 급여, 직무를 출력하세요.
SELECT ENAME,DNAME,SAL,JOB
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB = (SELECT job FROM emp WHERE  ename = 'ALLEN');

-- 2) JONES가 속해있는 부서의 모든 사람의 사원번호, 이름, 입사일, 급여를 출력하세요.
SELECT EMPNO, ENAME, HIREDATE, SAL
FROM EMP 
WHERE DEPTNO = ( SELECT DEPTNO FROM EMP WHERE ENAME ='JONES');

-- 3) 전체 사원의 평균 임금보다 많은 사원의 사원번호, 이름, 부서명, 입사일, 지역, 급여를 출력하세요.
SELECT EMPNO, ENAME, DNAME, HIREDATE, LOC, SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL >= (SELECT AVG(SAL) FROM EMP);


-- 4) 10번 부서와 같은 일을 하는 사원의 사원번호, 이름, 부서명, 지역, 급여를 급여가 많은 순으로 출력하세요.
SELECT EMPNO, ENAME,DNAME, LOC, SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB IN(SELECT JOB FROM EMP WHERE DEPTNO = 10)
ORDER BY SAL DESC;

-- 5) 'MARTIN'이나 'SCOTT'의 급여와 같은 사원의 사원번호, 이름, 급여를 출력하세요.
SELECT EMPNO, ENAME, SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL IN (SELECT SAL FROM EMP WHERE ENAME IN ('MARTIN','SCOTT'));

-- 6) 부서번호가 30번 부서의 최고 급여보다 높은 사원의 사원번호, 이름, 급여를 출력하세요.
SELECT EMPNO, ENAME, SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO =30);

-- 7) 사원중에서 급여(sal)와 보너스(comm)을 합친 금액이 가장 많은 경우와 가장 적은 경우, 평균 금액을 구하세요. HINT : IFNULL사용
SELECT MAX(SAL+IFNULL(COMM,0)),MIN(SAL+IFNULL(COMM,0)),AVG(SAL+IFNULL(COMM,0))
FROM EMP; 

-- 8) 부서별로 급여합계를 구하세요.
SELECT SUM(SAL)
FROM EMP
GROUP BY DEPTNO;

-- 9) 급여가 3000이상이면, 급여+급여의 15%의 격려금을, 급여가 2000이상이면, 급여+급여의 10%의 격려금을,급여가 1000이상이면,
-- 급여+급여의 5%의 격려금을, 그렇지 않으면 급여를 구하여, 이름, 직업, 급여,격려금을 표시하시오. HINT : CASE
SELECT ENAME,JOB,SAL,
CASE WHEN SAL >= 3000 THEN SAL + SAL * 0.15
	 WHEN SAL >= 2000 THEN SAL + SAL * 0.1
	 WHEN SAL >= 1000 THEN SAL + SAL * 0.05
     ELSE SAL
     END AS "격려금"
FROM EMP;

-- 10) 'MARTIN'과 같은 매니저와 일하는 이름, 직업, 급여, 부서명, 지역을 구하세요.
SELECT ENAME, JOB, SAL, DNAME, LOC
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE MGR = (SELECT MGR FROM EMP WHERE ENAME = 'MARTIN')
;

-- 11) 부서명이 'RESEARCH'인 사람의 이름, 직업, 급여,부서명을 표시하시오.
SELECT ENAME, JOB, SAL, DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE DNAME = 'RESEARCH';

-- 12) 각 부서별 평균 급여를 구하고, 그 중에서 평균 급여가 가장 적은 부서의 평균 급여보다 적게 받는 사원들의 부서명, 지역, 급여를 구하세요.
SELECT DNAME,LOC,SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL < (SELECT MIN(AVGSAL) FROM(SELECT AVG(SAL) AVGSAL FROM EMP GROUP BY DEPTNO) AS MINSALVIEW);
				-- 3.적게받는사람  		2.급여평균 		 평균명칭             1.부서별
                
-- 13) 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데 'BLAKE'는 빼고 출력하라.
SELECT ENAME,HIREDATE 
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM emp WHERE  ename = 'BLAKE')
AND ENAME != 'BLAKE';

-- 14) 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고있는 사원의 사원번호와 이름을 출력하라.
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%');
;

-- 15) 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름, 급여를 출력하라.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP) AND ENAME LIKE '%S%');

-- 16) 커미션을 받는 사원과 부서번호, 월급이 같은 사원의 이름, 월급, 부서번호를 출력하라.
SELECT ENAME, SAL, DEPTNO
FROM EMP 
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE COMM IS NOT NULL AND COMM > 0) -- 부서번호 같은거 조건
AND SAL IN (SELECT SAL FROM EMP WHERE COMM IS NOT NULL AND COMM > 0); -- 급여 같은거 조건

-- 17) 직업명과 사원의 등급을 직업이 'PRESIDENT' 이면 'A', 직업이 'ANALYST' 이면 'B',
-- 직업이 'MANAGER' 이면 'C', 직업이 'SALESMAN' 이면 'D', 직업이 'CLEARK' 이면 'E' 로 표시하시오.
SELECT CASE
WHEN JOB = 'PRESIDENT' THEN 'A'
WHEN JOB = 'ANALYST' THEN 'B'
WHEN JOB = 'MANAGER' THEN 'C'
WHEN JOB = 'SALESMAN' THEN 'D'
ELSE 'E'
END AS JOBNAME
FROM EMP;

-- 18) 10번 부서중에서 30번 부서에는 없는 업무를 하는 사원의 사원번호, 이름, 부서명,입사일, 지역을 출력하라.
SELECT EMPNO, ENAME, DNAME, HIREDATE, LOC
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB IN(SELECT JOB FROM EMP WHERE DEPTNO = '10')
AND JOB NOT IN (SELECT JOB FROM EMP WHERE DEPTNO = '30');

-- 19) 급여가 30번 부서의 최고 급여보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30);

-- 20) 급여가 30번 부서의 최저 급여보다 낮은 사원의 사원번호, 이름, 급여를 출력하라.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL < (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30);

-- 21) 사원 중에서 입사일이 가장 빠른 사원의 사원번호, 이름, 입사일, 부서명을 출력하세요.
SELECT EMPNO, ENAME, HIREDATE, DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE HIREDATE =(SELECT MIN(HIREDATE) FROM EMP);

-- 22) 평균 연봉보다 많이 받는 사원들의 사원번호, 이름, 연봉을 연봉이 높은 순으로 정렬하여 출력하세요.
SELECT EMPNO, ENAME, SAL*12+IFNULL(COMM,0)
FROM EMP
WHERE SAL > ( SELECT AVG(SAL) FROM EMP)
ORDER BY SAL*12+IFNULL(COMM,0) DESC;
 
-- 23) EMP와 DEPT TABLE을 JOIN하여 부서 번호, 부서명, 이름, 급여를 출력하라.
SELECT E.DEPTNO, DNAME, ENAME, SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

-- 24) 이름이 'ALLEN'인 사원의 부서명을 출력하라.
SELECT DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE ENAME ='ALLEN';

-- 25) DEPT Table 에는 존재하는 부서코드이지만 해당부서에 근무하는 사람이 존재하지 않는 경우의 결과를 출력하라.
SELECT *
FROM DEPT
WHERE DEPTNO NOT IN (SELECT DEPTNO FROM EMP);

SELECT *
FROM DEPT D LEFT OUTER JOIN EMP E
ON D.DEPTNO = E.DEPTNO;






