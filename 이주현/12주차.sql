-- 즐겨찾기가 가장 많은 식당 정보 출력하기
SELECT FOOD_TYPE
    , REST_ID
    , REST_NAME
    , FAVORITES
FROM REST_INFO
WHERE (FOOD_TYPE, FAVORITES) IN (
    SELECT FOOD_TYPE, MAX(FAVORITES)
    FROM REST_INFO
    GROUP BY FOOD_TYPE
)
ORDER BY FOOD_TYPE DESC


-- 카테고리 별 도서 판매량 집계하기
SELECT b.CATEGORY, SUM(bs.SALES) AS TOTAL_SALES
FROM BOOK b
JOIN BOOK_SALES bs ON b.BOOK_ID = bs.BOOK_ID
WHERE DATE_FORMAT(BS.SALES_DATE, '%Y%m') = '202201'
GROUP BY b.CATEGORY
ORDER BY b.CATEGORY


-- 대여 횟수가 많은 자동차들의 월별 대여 횟수 구하기
SELECT MONTH(a.start_date) AS month
    , a.car_id
    , COUNT(*) AS records
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY a
INNER JOIN (
    -- 2022.08 ~ 2022.10 총 대여 횟수 5회 이상인 자동차
    SELECT car_id
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE MONTH(start_date) BETWEEN "8" AND "10"
    GROUP BY car_id
    HAVING COUNT(*) >= 5
) b ON a.car_id = b.car_id
WHERE MONTH(a.start_date) BETWEEN "8" AND "10"
GROUP BY month, a.car_id
HAVING COUNT(*) > 0
ORDER BY month ASC, a.car_id DESC;
