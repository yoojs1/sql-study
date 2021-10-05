
--날짜형 함수, sysdate는 현재 날짜를 의미--


--일은 시간이 12시 이상이면 반올림
SELECT SYSDATE 현재날짜, ROUND (sysdate, 'DD') 일, ROUND (SYSDATE, 'MM') 월, ROUND (SYSDATE, 'YYYY')년도 
        , ROUND (MONTHS_BETWEEN('2021/06/10', '2021/10/10') , 1) 월차이
FROM dual;

SELECT
    hire_date
FROM employees;

--날짜에 더하기 빼기를 하면 --> 실제 날짜가 더하거나 빼진다.
SELECT sysdate 오늘날자, sysdate+1 내일,   sysdate-1 어제
FROM dual;

--예제 1, 2

SELECT sysdate, hire_date, MONTHS_BETWEEN(SYSDATE,hire_date) 월차이
FROM employees WHERE department_id = 100;

SELECT hire_date, ADD_MONTHS (hire_date , 3) 더하기3개월, 
      ADD_MONTHS (hire_date , -3) 빼기3개월
    
FROM employees WHERE employee_id BETWEEN 100 AND 106;

--변환형 함수
--숫자 --> 문자로 변환

SELECT
    TO_CHAR( 12345678 , '999,999,999') 콤마형식,
    TO_CHAR( 12345678.678 , '999,999,999.99') 콤마소수점형식,
    TO_CHAR( 12345678 , '$999,999,999') 달러형식,
    TO_CHAR( 12345678 , 'L999,999,999') 로컬통화
FROM DUAL;

--날짜--> 문자로 변환

SELECT 
    TO_CHAR(sysdate , 'YYYY-MM-DD') 날짜표시,
    TO_CHAR(sysdate , 'YYYY-MM-DD HH24:MI:SS') 시간표시     
FROM DUAL;

--예제1,2--

SELECT
    employee_id ,TO_CHAR(hire_date , 'MM/YY') 입사월
    
FROM EMPLOYEES WHERE department_id = 100;

SELECT last_name 이름 , TO_CHAR( salary, '$99,999.99') 월급   
FROM employees WHERE salary > 10000 ORDER BY salary DESC;

--문자열--> 날짜 변환
SELECT TO_DATE('2011-01-01', 'YYYY-MM-DD')
    
FROM DUAL;

--문자열--> 숫자 변환

SELECT TO_NUMBER('0123')+100
    
FROM DUAL;