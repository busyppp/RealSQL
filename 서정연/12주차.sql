-- 즐겨찾기가 가장 많은 식당 정보 출력하기
SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
FROM REST_INFO
WHERE (FOOD_TYPE, FAVORITES) in 
(
SELECT FOOD_TYPE, max(FAVORITES) as FAVORITES
FROM REST_INFO
group by 1
order by 2 desc
)
order by 1 ;

-- 카테고리 별 도서 판매량 집계하기
SELECT B.CATEGORY, sum(BS.SALES) as TOTAL_SALES
FROM BOOK B
JOIN BOOK_SALES BS
on B.BOOK_ID = BS.BOOK_ID
WHERE SUBSTR(BS.SALES_DATE,1,7) = '2022-01'
GROUP BY 1
ORDER BY 1;

-- 대여 횟수가 많은 자동차들의 월별 대여 횟수 구하기
WITH temp_car as (SELECT CAR_ID
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE substr(START_DATE,6,2) in ('08','09','10')
group by 1
having count(*) >=5) 

SELECT month(START_DATE) as MONTH, CAR_ID, count(*) as RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY car
where substr(START_DATE,6,2) in ('08','09','10')
and CAR_ID in (SELECT * FROM temp_car)
group by 1,2
having RECORDS > 0
order by 1, 2 desc;
