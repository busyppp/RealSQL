-- 조회수가 가장 많은 중고거래 게시판의 첨부파일 조회하기
SELECT CONCAT('/home/grep/src/', board_id, '/', file_id, file_name, file_ext) AS FILE_PATH
FROM used_goods_file
WHERE board_id = (
    SELECT board_id
    FROM used_goods_board
    ORDER BY views DESC
    LIMIT 1
)
ORDER BY file_id DESC;


-- 대여 기록이 존재하는 자동차 리스트 구하기
SELECT DISTINCT(a.car_id)
FROM car_rental_company_rental_history a
JOIN car_rental_company_car b ON a.car_id = b.car_id
WHERE MONTH(a.start_date) = 10 AND b.car_type = '세단'
ORDER BY car_id DESC;
