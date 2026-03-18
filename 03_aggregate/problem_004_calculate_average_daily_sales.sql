-- 문제: 레스토랑의 일일 평균 매출액 계산하기
-- 유형: AGGREGATE / SUBQUERY
-- 핵심: 요일별 매출 합계를 먼저 구한 뒤 일일 평균 매출 계산

SELECT
    ROUND(AVG(sales), 2) AS avg_sales
FROM (
    SELECT
        day,
        SUM(total_bill) AS sales
    FROM tips
    GROUP BY day
) AS daily_sales;
