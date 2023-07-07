-- 주문량이 많은 아이스크림들 조회하기
-- SUM(7월 총 주문량, 상반기 총 주문량) 상위 3개의 맛
SELECT F.FLAVOR
FROM FIRST_HALF AS F
JOIN (SELECT SUM(TOTAL_ORDER) AS TOTAL, FLAVOR 
      FROM JULY
      GROUP BY FLAVOR) AS J
  ON F.FLAVOR = J.FLAVOR
ORDER BY (F.TOTAL_ORDER + J.TOTAL) DESC
LIMIT 3;

-- 저자 별 카테고리 별 매출액 집계하기
-- 2022년 1월 도서 판매 데이터를 기준
-- "저자 별", "카테고리 별" 매출액(TOTAL_SALES = 판매량 * 판매가)
-- 저자 ID(AUTHOR_ID), 저자명(AUTHOR_NAME), 카테고리(CATEGORY), 매출액(SALES)
-- 저자 ID를 오름차순, 카테고리를 내림차순 정렬

SELECT A.AUTHOR_ID, A.AUTHOR_NAME, B.CATEGORY, SUM(BS.SALES*B.PRICE) AS TOTAL_SALES 
FROM BOOK AS B
JOIN (SELECT SUM(SALES) AS SALES, BOOK_ID
      FROM BOOK_SALES
      WHERE SALES_DATE LIKE '2022-01%'
      GROUP BY BOOK_ID) AS BS
  ON B.BOOK_ID = BS.BOOK_ID
JOIN AUTHOR AS A
  ON A.AUTHOR_ID = B.AUTHOR_ID
GROUP BY A.AUTHOR_ID, B.CATEGORY
ORDER BY A.AUTHOR_ID, B.CATEGORY DESC;
