-- 조건에 부합하는 중고거래 상태 조회하기
SELECT board_id,
    writer_id,
    title,
    price,
    CASE
        WHEN status = 'SALE' THEN '판매중'
        WHEN status = 'RESERVED' THEN '예약중'
        WHEN status = 'DONE' THEN '거래완료'
    END AS status
FROM used_goods_board
WHERE created_date = '2022-10-05'
ORDER BY board_id desc;


-- 자동차 평균 대여 기간 구하기
SELECT 
    car_id, 
    ROUND(AVG(DATEDIFF(end_date, start_date) + 1), 1) AS average_duration
FROM car_rental_company_rental_history
GROUP BY car_id
HAVING average_duration >= 7
ORDER BY average_duration desc, car_id desc;


-- 자동차 종류 별 특정 옵션이 포함된 자동차 수 구하기
SELECT car_type, 
    count(*) AS cars
FROM car_rental_company_car
WHERE  options LIKE '%열선시트%' 
    OR options LIKE '%통풍시트%' 
    OR options LIKE '%가죽시트%'
GROUP BY car_type
ORDER BY car_type ASC;
