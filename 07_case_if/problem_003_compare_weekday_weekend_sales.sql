-- 문제: 레스토랑의 주중, 주말 매출액 비교하기
-- 유형: CASE WHEN / GROUP BY / SUM / ORDER BY
-- 핵심: 요일 값을 주중·주말로 분류한 뒤 매출 합계 집계
-- 정렬: sales 내림차순

SELECT
    week,
    SUM(total_bill) AS sales
FROM (
    SELECT
        total_bill,
        CASE
            WHEN day IN ('Sat', 'Sun') THEN 'weekend'
            ELSE 'weekday'
        END AS week
    FROM tips
) t
GROUP BY week
ORDER BY sales DESC;
