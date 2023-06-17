-- 자동차 대여 기록 별 대여 금액 구하기
SELECT 
    temp.history_id AS HISTORY_ID, 
    ROUND((DATEDIFF(end_date, start_date) + 1) * (daily_fee * (100 - COALESCE(discount_rate, 0))) / 100, 0) AS FEE
FROM (
    SELECT 
        history_id, 
        start_date, 
        end_date, 
        daily_fee,
        CASE 
            WHEN DATEDIFF(end_date, start_date) + 1 >= 90 THEN '90일 이상'
            WHEN DATEDIFF(end_date, start_date) + 1 >= 30 THEN '30일 이상'
            WHEN DATEDIFF(end_date, start_date) + 1 >= 7 THEN '7일 이상'
        END AS duration
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY hist
    JOIN CAR_RENTAL_COMPANY_CAR car ON hist.car_id = car.car_id
    WHERE car.car_type = '트럭'
) as temp
JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN p ON temp.duration = p.duration_type
WHERE p.car_type = '트럭'
ORDER BY FEE DESC, HISTORY_ID DESC;


-- 특정 기간동안 대여 가능한 자동차들의 대여비용 구하기
SELECT 
    car_id, 
    car_type, 
    fee
FROM (
    SELECT 
        c.car_id, 
        c.car_type,
        FLOOR(daily_fee * 30 * (SELECT (100 - discount_rate) * 0.01
                                FROM car_rental_company_discount_plan
                                where car_type = c.car_type AND duration_type='30일 이상')
    ) AS fee
    FROM car_rental_company_car AS c
    WHERE car_type IN ('세단', 'SUV')
    AND car_id NOT IN ( SELECT car_id
                        FROM car_rental_company_rental_history
                        WHERE start_date <= '2022-11-30 00:00:00'
                            AND end_date >= '2022-11-01 00:00:00'
                        GROUP BY car_id)
) AS t
WHERE fee >= 500000 AND fee < 2000000
ORDER BY fee DESC, car_type ASC, car_id DESC;
