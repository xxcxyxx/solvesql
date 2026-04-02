-- 문제: 스탬프를 찍어드려요
-- 유형: CASE WHEN / GROUP BY / COUNT
-- 핵심: 결제 금액에 따라 스탬프 개수를 분류한 뒤 영수증 수 집계
-- 정렬: stamp 오름차순

SELECT
    stamp,
    COUNT(*) AS count_bill
FROM (
    SELECT
        CASE
            WHEN total_bill >= 25 THEN 2
            WHEN total_bill >= 15 THEN 1
            ELSE 0
        END AS stamp
    FROM tips
) t
GROUP BY stamp
ORDER BY stamp ASC;
