-- 그룹별 조건에 맞는 식당 목록 출력하기
SELECT 
    m.member_name, 
    r.review_text, 
    DATE_FORMAT(r.review_date, '%Y-%m-%d') AS reivew_date
FROM member_profile m
JOIN rest_review r ON m.member_id = r.member_id
WHERE m.member_id = (
    -- 리뷰를 가장 많이 작성한 회원
    SELECT member_id
    FROM rest_review
    GROUP BY member_id
    ORDER BY COUNT(member_id) DESC
    LIMIT 1
)
ORDER BY review_date, review_text


-- 년, 월, 성별 별 상품 구매 회원 수 구하기
SELECT 
    DATE_FORMAT(o.sales_date, '%Y') AS year,
    DATE_FORMAT(o.sales_date, '%m') AS month,
    u.gender AS gender,
    COUNT(DISTINCT o.user_id) AS users -- 동일한 연/월에 중복 구매한 회원 제거
FROM user_info u
JOIN online_sale o ON u.user_id = o.user_id
GROUP BY 1, 2, 3
HAVING gender IS NOT NULL
ORDER BY 1, 2, 3
