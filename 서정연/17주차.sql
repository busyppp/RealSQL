-- 오프라인/온라인 판매 데이터 통합하기

SELECT date_format(n.SALES_DATE, '%Y-%m-%d') as SALES_DATE, n.PRODUCT_ID, n.USER_ID, sum(n.SALES_AMOUNT) as SALES_AMOUNT
FROM (SELECT * FROM ONLINE_SALE
union all
SELECT OFFLINE_SALE_ID as ONLINE_SALE_ID, null, PRODUCT_ID, SALES_AMOUNT, SALES_DATE
FROM OFFLINE_SALE) as n
where date_format(n.SALES_DATE, '%Y-%m') = '2022-03'
group by 1,2,3
order by 1,2,3;

 

-- 취소되지 않은 진료 예약 조회하기

SELECT a.APNT_NO, p.PT_NAME, p.PT_NO, d.MCDP_CD, d.DR_NAME, a.APNT_YMD
FROM APPOINTMENT as a
join PATIENT as p
on a.PT_NO = p.PT_NO
join DOCTOR as d
on a.MDDR_ID = d.DR_ID
where date_format(a.APNT_YMD, '%Y-%m-%d') = '2022-04-13'
and d.MCDP_CD = 'CS'
and a.APNT_CNCL_YN = 'N'
order by 6;
