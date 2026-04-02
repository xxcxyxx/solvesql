-- 문제: A/B 테스트를 위한 버킷 나누기 2
-- 유형: CASE WHEN / GROUP BY / AVG / ROUND / MOD
-- 핵심: 사용자별 주문 집계 후 A/B 버킷으로 나누어 평균 비교
-- 조건: 반품된 주문 제외
-- 정렬: 없음

SELECT
    bucket,
    COUNT(*) AS user_count,
    ROUND(AVG(order_count), 2) AS avg_orders,
    ROUND(AVG(revenue), 2) AS avg_revenue
FROM (
    SELECT
        customer_id,
        CASE
            WHEN customer_id % 10 = 0 THEN 'A'
            ELSE 'B'
        END AS bucket,
        COUNT(*) AS order_count,
        SUM(total_price) AS revenue
    FROM transactions
    WHERE is_returned = FALSE
    GROUP BY customer_id
) t
GROUP BY bucket
ORDER BY bucket ASC;
