-- 문제: A/B 테스트를 위한 버킷 나누기 1
-- 유형: CASE WHEN
-- 핵심: customer_id를 10으로 나눈 나머지에 따라 A/B 그룹 분류

SELECT DISTINCT
    customer_id,
    CASE
        WHEN MOD(customer_id, 10) = 0 THEN 'A'
        ELSE 'B'
    END AS bucket
FROM transactions
ORDER BY customer_id;
