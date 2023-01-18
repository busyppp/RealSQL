--재구매가 일어난 상품과 회원 리스트 구하기
SELECT USER_ID, PRODUCT_ID
FROM ONLINE_SALE
group by USER_ID, PRODUCT_ID
having count(*) >= 2
ORDER BY 1, 2 desc;

--진료과별 총 예약 횟수 출력하기
SELECT MCDP_CD, count(distinct(PT_NO)) as 5월예약건수
FROM APPOINTMENT
WHERE year(APNT_YMD) = 2022
and month(APNT_YMD) = 5
group by 1
order by 2, 1;

--성분으로 구분한 아이스크림 총 주문량
SELECT i.INGREDIENT_TYPE, sum(f.TOTAL_ORDER) as TOTAL_ORDER
FROM FIRST_HALF f
join ICECREAM_INFO i
on f.FLAVOR = i.FLAVOR
group by 1
order by 2;

--조건에 맞는 도서와 저자 리스트 출력하기
SELECT b.BOOK_ID, a.AUTHOR_NAME, date_format(b.PUBLISHED_DATE, "%Y-%m-%d") as PUBLISHED_DATE
FROM BOOK b
join AUTHOR a
on b.AUTHOR_ID = a.AUTHOR_ID
where b.category = '경제'
order by 3;
