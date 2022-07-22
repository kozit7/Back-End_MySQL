-- 프로시저 (부서번호가 10번 사원을 출력)
DELIMITER //  -- 선언시작할때 // 사용
CREATE PROCEDURE PR1(A VARCHAR(2))
BEGIN
		SELECT * FROM EMP WHERE DEPTNO = A;
        
END
//
DELIMITER ; -- 끝날때 ; 사용 사용안할시 오류발생
-- PR1프로시저 호출
CALL PR1(10);

-- 함수
show global variables like 'log_bin_trust_function_creators';
SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER //
CREATE FUNCTION FU1(A INT, B INT) RETURNS INT

BEGIN

	RETURN A+B;

END
//
DELIMITER ;
-- FU1 함수 호출
SELECT FU1(10,20)

DELIMITER //
CREATE FUNCTION FU2() RETURNS DOUBLE
BEGIN
	-- 변수 선언(DECLARE)
    DECLARE R DOUBLE;
    SELECT AVG(SAL)
	INTO R
    FROM EMP;
	RETURN  R;

END
//
DELIMITER ;
-- SELECT FU2(); -- 함수호출

DELIMITER //
CREATE FUNCTION  SALES(D VARCHAR(2)) RETURNS INT
BEGIN

	DECLARE F INT;
    SELECT SUM(SAL)
	INTO F
    FROM EMP
    WHERE DEPTNO = D;
    RETURN F;
    END
//
DELIMITER ;
SELECT SALES(30);


    


