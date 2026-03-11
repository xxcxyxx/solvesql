-- 문제: 레스토랑의 대목
-- 유형: SUBQUERY / GROUP BY / HAVING
-- 핵심: 요일별 매출 합계가 1500 이상인 요일의 결제 내역 전체 조회

SELECT *
FROM tips
WHERE day IN (
    SELECT
        day
    FROM tips
    GROUP BY day
    HAVING SUM(total_bill) >= 1500
);
