-- ������ �Լ�

-- ���� �Լ�
-- ��ҹ��� ��ȯ UPPER LOWER INITCAP
SELECT UPPER('SQL Course'),LOWER('SQL Course'),INITCAP('SQL Course')  FROM DUAL; -- ��� �׽�Ʈ�� ���̺��� �̿��Ͽ� ����

-- ���� ���� �Լ�
SELECT SUBSTR('ABCDEFG',3,4), LENGTH('ABCDEFG'), INSTR('ABCDEFG','D') FROM DUAL;
SELECT TRIM('  ��ο�  '),'  ��ο�  ' FROM DUAL; -- ������ �����ش�.

-- ���� �Լ� ����
SELECT department_id, last_name
FROM employees
WHERE lower(last_name) = 'higgins';

SELECT last_name, CONCAT('�������� ',job_id) AS ������
FROM employees
WHERE SUBSTR(job_id, 4, 3) = 'REP';

-- ���ڿ� ���� �� ���� (-1�� ���ڿ��� ���� ��)
 SELECT last_name, SUBSTR(last_name, -1, 1)
 FROM employees;
 
-- ���ڿ� �ٲٱ� 
SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') ������
FROM employees;

-- ���� 1,2
SELECT last_name �̸�, LOWER(last_name), UPPER(last_name), email �̸���, INITCAP(email)
FROM employees;

SELECT job_id ������, SUBSTR(job_id, 1,2) ����2�� FROM employees;

-- ������ �Լ�
-- �ݿø� �Լ� ROUND(����,�ڸ���), �ڸ����� ������ ������ �ݿø�
SELECT ROUND(15.193), ROUND(15.193, 0), ROUND(15.193, 1), ROUND(15.193, 2) FROM DUAL;

-- ������ȣ�� ¦������ �����鸸 ����϶�
SELECT employee_id ¦����°, last_name
FROM employees
WHERE MOD(employee_id, 2) = 0 -- ¦��
ORDER BY employee_id;


--  ��¥�� �Լ� , sysdate�� ���� ��¥�� �ǹ�

-- ���� �ð��� 12�� �̻��̸� �ݿø�
SELECT SYSDATE ���糯¥, ROUND(sysdate, 'DD') ��, ROUND(sysdate, 'MM') ��, ROUND(sysdate, 'YYYY') �⵵
        , ROUND( MONTHS_BETWEEN('2021/10/5', '2021/06/10') , 1 ) ������
FROM DUAL;

SELECT hire_date FROM employees;

-- ��¥�� ���ϱ� ���⸦ �ϸ� => ���� ��¥�� ���ϰų� ������.
SELECT sysdate ���ó���, sysdate + 1 ���� , sysdate - 1 ����
FROM dual;

-- ���� 1, 2
SELECT sysdate, hire_date, MONTHS_BETWEEN(SYSDATE,hire_date) ������
FROM employees where department_id = 100;

SELECT hire_date, ADD_MONTHS(hire_date , 3) ���ϱ�3����, ADD_MONTHS(hire_date , -3) ����3����
FROM employees WHERE employee_id BETWEEN 100 AND 106;

-- ��ȯ�� �Լ�
-- ���� => ���ڷ� ��ȯ
SELECT 
    TO_CHAR( 12345678 , '999,999,999') �޸�����,
    TO_CHAR( 12345678.678 , '999,999,999.99') �޸��Ҽ�������,
    TO_CHAR( 12345678 , '$999,999,999') �޷�����,
    TO_CHAR( 12345678 , 'L999,999,999') ������ȭ
FROM DUAL;

-- ��¥ => ���ڷ� ��ȯ

SELECT 
    TO_CHAR( sysdate , 'YYYY/MM/DD') ��¥ǥ��,
    TO_CHAR( sysdate , 'YYYY/MM/DD HH24:MI:SS') �ð�ǥ��
FROM DUAL;

-- ���� 1,2
SELECT employee_id , TO_CHAR(hire_date, 'YY/MM') �Ի��
FROM employees WHERE department_id = 100;

SELECT last_name �̸� , TO_CHAR( salary, '$99,999.99') ����
FROM employees WHERE salary > 10000 ORDER BY salary DESC;

-- ���ڿ� => ��¥ ��ȯ
SELECT TO_DATE('2011/01/01', 'YYYY/MM/DD')
FROM DUAL;

-- ���ڿ� => ���� ��ȯ
SELECT TO_NUMBER('0123')+100
FROM DUAL;

-- �ΰ� ���� �Լ� (null)

-- NVL( �� , 0 ) => ���� ���� ���̸� 0���� ��ȯ
SELECT last_name �̸�, NVL( manager_id , 0 ) �Ŵ���
FROM employees WHERE last_name = 'King';

-- NVL2( �� , ù��°, �ι�° ) => ���� ���� �ΰ��� �ƴϸ� ù��° , �ƴϸ� �ι�°
SELECT last_name �̸�, NVL2( manager_id , 1 , 0 ) �Ŵ���
FROM employees WHERE last_name = 'King';

-- ���� 1,2
SELECT last_name �̸�, salary ����, NVL(commission_pct, 0) Ŀ�̼�, 
        salary*12 + salary*12*NVL(commission_pct, 0) ����
FROM employees ORDER BY ���� DESC;

SELECT last_name �̸�, salary ����, NVL(commission_pct, 0) Ŀ�̼�, 
        salary*12 + salary*12*NVL(commission_pct, 0) ����,
        NVL2(commission_pct, '����+���ʽ�' ,'���޸�' ) ���������
FROM employees ORDER BY ���� DESC;

-- decode �Լ�
SELECT last_name �̸�, job_id, salary,
    DECODE(job_id, 'IT_PROG',  salary * 1.10,
                   'ST_CLERK', salary * 1.15,
                   'SA_REP',   salary * 1.20,
                               salary) ��������
FROM employees;

--���� 
SELECT last_name �̸�, job_id ����, salary ����,
    DECODE( TRUNC(salary/2000),  0,  0,
                                 1,  0.09,
                                 2,  0.2,
                                 3,  0.3,
                                 4,  0.4,
                                 5,  0.42,
                                 6,  0.44,
                                     0.45 )  ����
FROM employees;

-- CASE �Լ� �񱳰���
SELECT last_name �̸�, job_id, salary,
    CASE  WHEN salary<5000   THEN 'Low'
          WHEN salary<10000  THEN 'Medium'
          WHEN salary<20000  THEN 'Good'
          ELSE                    'Excellent'  
    END "�޿� ����"
FROM employees;

-- CASE ���� 
SELECT last_name �̸�, job_id, salary,
    CASE  WHEN salary>=9000   THEN '�����޿�'
          WHEN salary>=6000   THEN '�����޿�'
          ELSE                     '�����޿�'  
    END  �޿����
FROM employees WHERE job_id = 'IT_PROG';