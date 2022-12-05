-- 강원도에 위치한 생산공장 목록 출력하기
SELECT FACTORY_ID, FACTORY_NAME, ADDRESS
FROM FOOD_FACTORY
where address like '강원도%'
order by FACTORY_ID;


-- 경기도에 위치한 식품창고 목록 출력하기
-- mssql이 isnull, mysql은 ifnull 사용
SELECT WAREHOUSE_ID, WAREHOUSE_NAME, ADDRESS,
ifnull(FREEZER_YN, 'N') as FREEZER_YN
FROM FOOD_WAREHOUSE
WHERE ADDRESS like '경기도%'
ORDER BY WAREHOUSE_ID;


-- 나이 정보가 없는 회원 수 구하기
SELECT count(*) as USERS
FROM USER_INFO
WHERE AGE is null;


-- 조건에 맞는 회원수 구하기
SELECT count(*) as USERS
FROM USER_INFO
where AGE >= 20
and AGE <= 29
and JOINED like '2021%';


-- 가장 비싼 상품 구하기
SELECT max(price) as MAX_PRICE
FROM PRODUCT;
