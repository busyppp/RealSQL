-- 즐겨찾기가 가장 많은 식당 정보 출력하기
SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES FROM REST_INFO
WHERE (FOOD_TYPE, FAVORITES) IN (
    SELECT FOOD_TYPE, MAX(FAVORITES) FROM REST_INFO
    GROUP BY FOOD_TYPE
)
ORDER BY FOOD_TYPE DESC;

-- 카테고리 별 도서 판매량 집계하기
SELECT CATEGORY, SUM(SALES) AS TOTAL_SALES FROM BOOK B
JOIN BOOK_SALES S 
    ON B.BOOK_ID = S.BOOK_ID 
WHERE DATE_FORMAT(SALES_DATE, '%Y-%m') = '2022-01'
GROUP BY CATEGORY
ORDER BY CATEGORY ASC;

-- 대여 횟수가 많은 자동차들의 월별 대여 횟수 구하기
SELECT MONTH(START_DATE) AS MONTH, CAR_ID, COUNT(*) AS RECORDS FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE CAR_ID IN (
    SELECT CAR_ID FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE BETWEEN "2022-08-01" AND "2022-10-31"
    GROUP BY CAR_ID HAVING COUNT(*) >= 5 
        AND START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
)
GROUP BY MONTH, CAR_ID HAVING COUNT(*) > 0
ORDER BY MONTH ASC, CAR_ID DESC;
