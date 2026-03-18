-- 문제: 레스토랑의 요일별 VIP
-- 유형: WINDOW FUNCTION / ROW_NUMBER
-- 핵심: 요일별 total_bill이 가장 큰 결제 내역 1건씩 조회

WITH ranked_tips AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY day
            ORDER BY total_bill DESC
        ) AS rn
    FROM tips
)

SELECT
    total_bill,
    tip,
    sex,
    smoker,
    day,
    time,
    size
FROM ranked_tips
WHERE rn = 1;
