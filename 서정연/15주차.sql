-- 5월 식품들의 총매출 조회하기
SELECT a.PRODUCT_ID, a.PRODUCT_NAME, sum(a.PRICE * b.amount) as TOTAL_SALES
FROM FOOD_PRODUCT a
join FOOD_ORDER b
on a.PRODUCT_ID = b.PRODUCT_ID
where date_format(b.PRODUCE_DATE, '%Y-%m') = '2022-05'
group by 1
order by 3 desc, 1;


-- 서울에 위치한 식당 목록 출력하기
SELECT a.REST_ID, a.REST_NAME, a.FOOD_TYPE, a.FAVORITES, a.ADDRESS, round(avg(b.REVIEW_SCORE),2) as SCORE
FROM REST_INFO a
join REST_REVIEW b
on a.REST_ID = b.REST_ID
where substr(a.ADDRESS, 1,2) = '서울'
group by 1
order by 6 desc, 4 desc;
