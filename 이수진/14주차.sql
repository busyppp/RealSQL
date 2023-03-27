-- 우유와 요거트가 담긴 장바구니
SELECT cart_id
from cart_products
where name in ( 'Yogurt', 'Milk' )
group by cart_id
having count(distinct name) = 2

-- 식품분류별 가장 비싼 식품의 정보 조회하기
