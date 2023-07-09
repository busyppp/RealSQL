-- 조건에 맞는 사용자 정보 조회하기
SELECT 
    writer_id as user_id,
    nickname,
    CONCAT(city, " ", street_address1, " ", street_address2) AS 전체주소,
    CONCAT(SUBSTRING(tlno, 1, 3), '-', SUBSTRING(tlno, 4, 4), '-', SUBSTRING(tlno, 8)) AS 전화번호
FROM used_goods_board b
JOIN used_goods_user u ON b.writer_id = u.user_id
GROUP BY writer_id
HAVING COUNT(*) >= 3
ORDER BY user_id DESC;


-- 자동차 대여 기록에서 대여중 / 대여 가능 여부 구분하기
SELECT car_id,
    CASE 
        WHEN CAR_ID IN (SELECT CAR_ID
                        FROM car_rental_company_Rental_history
                        WHERE '2022-10-16' BETWEEN start_date AND end_date) THEN '대여중'
        ELSE '대여 가능'
    END 'availabilty'
FROM car_rental_company_Rental_history
GROUP BY car_id
ORDER BY car_id DESC;


-- 조건에 맞는 사용자와 총 거래금액 조회하기
SELECT 
    writer_id, 
    nickname,
    SUM(PRICE) AS total_sales
FROM used_goods_board b
JOIN used_goods_user u ON b.writer_id = u.user_id
WHERE status = 'DONE'
GROUP BY writer_id
HAVING total_sales >= 700000
ORDER BY total_sales;
