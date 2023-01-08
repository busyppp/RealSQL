-- 3월에 태어난 여성 회원 목록 출력하기
SELECT
    MEMBER_ID,
    MEMBER_NAME,
    GENDER,
    DATE_FORMAT(DATE_OF_BIRTH, '%Y-%m-%d') AS DATE_OF_BIRTH
FROM MEMBER_PROFILE
WHERE DATE_FORMAT(DATE_OF_BIRTH, '%m') = '03'
    AND GENDER = 'W'
    AND TLNO IS NOT NULL
ORDER BY MEMBER_ID;


-- 카테고리 별 상품 개수 구하기
SELECT SUBSTR(PRODUCT_CODE, 1, 2) AS CATEGORY
    , COUNT(*) AS PRODUCTS
FROM PRODUCT
GROUP BY CATEGORY
ORDER BY CATEGORY


-- 가격대 별 상품 개수 구하기
SELECT TRUNCATE(price, -4) AS price_group
    , COUNT(*) AS products
FROM product
GROUP BY price_group
ORDER BY price_group;


-- 상품 별 오프라인 매출 구하기
SELECT p.product_code AS product_code
    , SUM(p.price * o.sales_amount) AS sales
FROM product p
JOIN offline_sale o ON p.product_id = o.product_id
GROUP BY p.product_code
ORDER BY sales DESC, product_code ASC;
