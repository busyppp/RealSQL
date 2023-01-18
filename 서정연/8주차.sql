--3월에 태어난 여성 회원 목록 출력하기
SELECT MEMBER_ID, MEMBER_NAME, GENDER, date_format(DATE_OF_BIRTH, '%Y-%m-%d') as DATE_OF_BIRTH
FROM MEMBER_PROFILE
WHERE month(DATE_OF_BIRTH) = 3
and TLNO is not null
and GENDER = 'W'
order by 1;

--카테고리 별 상품 개수 구하기
SELECT substr(PRODUCT_CODE,1,2) as CATEGORY,count(*) as PRODUCTS
FROM PRODUCT
group by 1
order by 1;

--가격대 별 상품 개수 구하기
SELECT FLOOR(PRICE/10000) * 10000 as PRICE_GROUP, count(*)
FROM PRODUCT
group by PRICE_GROUP
order by 1;

--상품 별 오프라인 매출 구하기
SELECT p.PRODUCT_CODE as PRODUCT_CODE, sum(p.PRICE * o.SALES_AMOUNT) as SALES
FROM PRODUCT p
join OFFLINE_SALE o
on p.PRODUCT_ID = o.PRODUCT_ID
group by PRODUCT_CODE
order by SALES desc, PRODUCT_CODE;
