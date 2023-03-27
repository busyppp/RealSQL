-- 5월 식품들의 총매출 조회하기
select fo.product_id, fp.product_name, sum(fo.amount) * fp.price total_sales from food_order fo
join food_product fp on fo.product_id = fp.product_id
where year(fo.produce_date) = 2022 and month(fo.produce_date) = 5
group by product_id
order by total_sales desc, fo.product_id asc;

-- 서울에 위치한 식당 목록 출력하기
select ri.rest_id, ri.rest_name, ri.food_type, ri.favorites, ri.address, round(avg(rr.review_score), 2) as score
from rest_info ri
join rest_review rr on ri.rest_id = rr.rest_id
where ri.address like '서울%'
group by rest_id
order by score desc, ri.favorites desc;
