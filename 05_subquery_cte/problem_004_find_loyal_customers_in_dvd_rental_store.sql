-- 문제: DVD 대여점 우수 고객 찾기
-- 유형: AGGREGATE / JOIN / GROUP BY / HAVING
-- 핵심: active 고객 중 대여 횟수가 35회 이상인 고객 조회
-- 출력: customer_id

SELECT
    c.customer_id
FROM customer c
JOIN rental r
    ON c.customer_id = r.customer_id
WHERE c.active = 1
GROUP BY c.customer_id
HAVING COUNT(*) >= 35;
