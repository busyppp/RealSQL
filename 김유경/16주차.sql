-- 그룹별 조건에 맞는 식당 목록 출력하기
select mp.member_name as MEMBER_NAME, rr.review_text as REVIEW_TEXT, DATE_FORMAT(rr.review_date, '%Y-%m-%d') as REVIEW_DATE 
from rest_review as rr 
join member_profile mp on rr.member_id = mp.member_id
where mp.member_id = (
    select member_id from rest_review 
    group by member_id 
    order by count(*) desc limit 1)
order by REVIEW_DATE asc, REVIEW_TEXT;

-- 년, 월, 성별 별 상품 구매 회원 수 구하기
SELECT YEAR(sales_date) as YEAR, MONTH(sales_date) as month, gender, count(distinct ui.user_id) as USERS
from ONLINE_SALE os
join USER_INFO ui on ui.user_id = os.user_id
where gender is not null
group by YEAR(sales_date), MONTH(sales_date), GENDER
order by YEAR(sales_date), MONTH(sales_date), GENDER;
