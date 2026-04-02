-- 문제: 레스토랑의 일일 매출
-- 유형: GROUP BY / SUM / HAVING / ORDER BY
-- 핵심: 요일별 매출 합계를 구하고 1000달러 미만 제외
-- 정렬: revenue_daily 내림차순

SELECT
    day,
    SUM(total_bill) AS revenue_daily
FROM tips
GROUP BY day
HAVING SUM(total_bill) >= 1000
ORDER BY revenue_daily DESC;
