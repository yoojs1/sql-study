
--��¥�� �Լ�, sysdate�� ���� ��¥�� �ǹ�--


--���� �ð��� 12�� �̻��̸� �ݿø�
SELECT SYSDATE ���糯¥, ROUND (sysdate, 'DD') ��, ROUND (SYSDATE, 'MM') ��, ROUND (SYSDATE, 'YYYY')�⵵ 
        , ROUND (MONTHS_BETWEEN('2021/06/10', '2021/10/10') , 1) ������
FROM dual;

SELECT
    hire_date
FROM employees;

--��¥�� ���ϱ� ���⸦ �ϸ� --> ���� ��¥�� ���ϰų� ������.
SELECT sysdate ���ó���, sysdate+1 ����,   sysdate-1 ����
FROM dual;

--���� 1, 2

SELECT sysdate, hire_date, MONTHS_BETWEEN(SYSDATE,hire_date) ������
FROM employees WHERE department_id = 100;

SELECT hire_date, ADD_MONTHS (hire_date , 3) ���ϱ�3����, 
      ADD_MONTHS (hire_date , -3) ����3����
    
FROM employees WHERE employee_id BETWEEN 100 AND 106;

--��ȯ�� �Լ�
--���� --> ���ڷ� ��ȯ

SELECT
    TO_CHAR( 12345678 , '999,999,999') �޸�����,
    TO_CHAR( 12345678.678 , '999,999,999.99') �޸��Ҽ�������,
    TO_CHAR( 12345678 , '$999,999,999') �޷�����,
    TO_CHAR( 12345678 , 'L999,999,999') ������ȭ
FROM DUAL;

--��¥--> ���ڷ� ��ȯ

SELECT 
    TO_CHAR(sysdate , 'YYYY-MM-DD') ��¥ǥ��,
    TO_CHAR(sysdate , 'YYYY-MM-DD HH24:MI:SS') �ð�ǥ��     
FROM DUAL;

--����1,2--

SELECT
    employee_id ,TO_CHAR(hire_date , 'MM/YY') �Ի��
    
FROM EMPLOYEES WHERE department_id = 100;

SELECT last_name �̸� , TO_CHAR( salary, '$99,999.99') ����   
FROM employees WHERE salary > 10000 ORDER BY salary DESC;

--���ڿ�--> ��¥ ��ȯ
SELECT TO_DATE('2011-01-01', 'YYYY-MM-DD')
    
FROM DUAL;

--���ڿ�--> ���� ��ȯ

SELECT TO_NUMBER('0123')+100
    
FROM DUAL;