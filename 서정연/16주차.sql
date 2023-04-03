-- 그룹별 조건에 맞는 식당 목록 출력하기

SELECT m.MEMBER_NAME, r.REVIEW_TEXT, date_format(r.REVIEW_DATE, '%Y-%m-%d') as REVIEW_DATE
FROM MEMBER_PROFILE m
join REST_REVIEW r
on m.MEMBER_ID = r.MEMBER_ID
WHERE m.MEMBER_ID = 
(SELECT MEMBER_ID
FROM REST_REVIEW
group by 1
order by count(*) desc
limit 1
)
ORDER BY 3, 2;

 

-- 년, 월, 성별 별 상품 구매 회원 수 구하기

SELECT year(o.SALES_DATE) as YEAR, month(o.SALES_DATE) as MONTH, u.GENDER, count(distinct o.USER_ID) as USERS
FROM ONLINE_SALE as o
join USER_INFO u
on o.USER_ID = u.USER_ID
group by 1,2,3
having u.GENDER is not null
order by 1,2,3;
