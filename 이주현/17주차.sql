-- 오프라인/온라인 판매 데이터 통합하기
(
SELECT DATE_FORMAT(sales_date, '%Y-%m-%d') AS sales_date, 
    product_id, 
    user_id, 
    sales_amount
FROM online_sale
WHERE sales_date LIKE '2022-03%'
UNION ALL
SELECT DATE_FORMAT(sales_date, '%Y-%m-%d') AS sales_date, 
	  product_id, 
    NULL AS user_id, 
    sales_amount
FROM offline_sale
WHERE sales_date LIKE '2022-03%'
)
ORDER BY sales_date, product_id, user_id;


-- 취소되지 않은 진료 예약 조회하기
SELECT a.apnt_no,
	  p.pt_name,
    p.pt_no,
    d.mcdp_cd,
    d.dr_name,
    a.apnt_ymd
FROM appointment a
JOIN patient p ON a.pt_no = p.pt_no
JOIN doctor d ON a.mddr_id = d.dr_id
WHERE a.apnt_ymd LIKE '2022-04-13%'
	AND a.mcdp_cd = 'CS'
  -- AND a.apnt_cncl_ymd IS NULL
	AND a.apnt_cncl_yn = 'N'
ORDER BY a.apnt_ymd
