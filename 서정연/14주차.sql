-- 우유와 요거트가 담긴 장바구니
select a.CART_ID
from 
(
SELECT *
FROM CART_PRODUCTS
WHERE NAME IN ('Milk', 'Yogurt')
group by 2, 3 
ORDER BY 2
    ) a
group by 1 
HAVING COUNT(NAME)=2
ORDER BY 1;

-- 식품분류별 가장 비싼 식품의 정보 조회하기
SELECT a.CATEGORY, a.PRICE, a.PRODUCT_NAME 
FROM
(SELECT * ,
rank() over (partition by CATEGORY order by PRICE desc) as ITEM_RANK
FROM FOOD_PRODUCT
WHERE CATEGORY in ('국', '과자', '김치', '식용유')
) a
WHERE ITEM_RANK = 1
ORDER BY PRICE DESC;
