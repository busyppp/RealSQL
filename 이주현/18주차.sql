-- 주문량이 많은 아이스크림들 조회하기
SELECT a.flavor
FROM first_Half a
JOIN (
    SELECT flavor, SUM(total_order) AS total_order
    FROM july
    GROUP BY flavor
) b ON a.flavor = b.flavor
ORDER BY (a.total_order + b.total_order) DESC
LIMIT 3;



-- 저자 별 카테고리 별 매출액 집계하기
SELECT a.author_id,
    a.author_name,
    b.category,
    SUM(sales * price) AS total_sales
FROM book b
JOIN author a ON b.author_id = a.author_id
JOIN book_sales bs ON b.book_id = bs.book_id
WHERE sales_date LIKE '2022-01%'
GROUP BY a.author_name, b.category
ORDER BY b.author_id ASC, b.category DESC;
