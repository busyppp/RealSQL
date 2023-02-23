-- 우유와 요거트가 담긴 장바구니
SELECT a.cart_id AS cart_id
FROM CART_PRODUCTS a
JOIN CART_PRODUCTS b ON a.cart_id = b.cart_id
WHERE a.name = 'Milk'
  AND  b.name = 'Yogurt'
ORDER BY a.cart_id;


-- 식품분류별 가장 비싼 식품의 정보 조회하기
SELECT category, price AS max_price, product_name
FROM FOOD_PRODUCT
WHERE (category, price) IN (
    SELECT category, MAX(price)
    FROM FOOD_PRODUCT
    WHERE category IN ('과자', '국', '김치', '식용유')
    GROUP BY category
)
ORDER BY max_price DESC;
