-- 문제: 최고의 근무일을 찾아라
-- 유형: AGGREGATE / GROUP BY / ORDER BY
-- 핵심: 요일별 팁 총액 집계 후 가장 큰 요일 1개 조회

SELECT
    day,
    ROUND(SUM(tip), 2) AS tip_daily
FROM tips
GROUP BY day
ORDER BY tip_daily DESC
LIMIT 1;
