-- 조건에 부합하는 중고거래 댓글 조회하기
SELECT B.title,
    B.board_id,
    R.reply_id,
    R.writer_id,
    R.contents,
    DATE_FORMAT(R.created_date, '%Y-%m-%d')
FROM used_goods_board B
JOIN used_goods_reply R
ON B.board_id = R.board_id
WHERE DATE_FORMAT(B.created_date, '%Y-%m') = '2022-10'
ORDER BY R.created_date, B.title


-- 특정 옵션이 포함된 자동차 리스트 구하기
SELECT car_id,
    car_type,
    daily_fee,
    options
FROM car_rental_company_car
WHERE FIND_IN_SET('네비게이션', options) > 0
ORDER BY car_id desc


-- 자동차 대여 기록에서 장기/단기 대여 구분하기
SELECT history_id,
    car_id,
    DATE_FORMAT(start_date, '%Y-%m-%d') AS start_date,
    DATE_FORMAT(end_date, '%Y-%m-%d') AS end_date,
    CASE 
        WHEN DATEDIFF(end_date, start_date) >= 29
        THEN '장기 대여'
        ELSE '단기 대여'
    END AS RENT_TYPE
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE DATE_FORMAT(start_date, '%Y-%m') = '2022-09'
ORDER BY history_id desc;


-- 평균 일일 대여 요금 구하기
SELECT ROUND(AVG(DAILY_FEE)) AS AVERAGE_FEE
FROM car_rental_company_car
WHERE car_type = 'SUV';


-- 조건에 맞는 도서 리스트 출력하기
SELECT BOOK_ID, DATE_FORMAT(PUBLISHED_DATE, '%Y-%m-%d') as PUBLISHED_DATE
FROM BOOK
WHERE CATEGORY = '인문'
    AND SUBSTR(PUBLISHED_DATE, 1, 4) = '2021'
ORDER BY PUBLISHED_DATE;
