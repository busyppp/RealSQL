-- 5월 식품들의 총매출 조회하기
SELECT 
    p.product_id AS PRODUCT_ID, 
    p.product_name AS PRODUCT_NAME, 
    SUM(p.price * o.amount) AS TOTAL_SALES
FROM food_product p
JOIN food_order o ON p.product_id = o.product_id
WHERE DATE_FORMAT(o.produce_date, '%Y-%m') = '2022-05'
GROUP BY p.product_id, p.product_name
ORDER BY TOTAL_SALES DESC, PRODUCT_ID ASC;


-- 서울에 위치한 식당 목록  출력하기
SELECT 
    info.rest_id, 
    info.rest_name, 
    info.food_type, 
    info.favorites,
    info.address, ROUND(AVG(review.review_score), 2) AS score
FROM rest_info info
JOIN rest_review review ON info.rest_id = review.rest_id
WHERE info.address LIKE '서울%'
GROUP BY info.rest_id
ORDER BY score DESC, favorites DESC
