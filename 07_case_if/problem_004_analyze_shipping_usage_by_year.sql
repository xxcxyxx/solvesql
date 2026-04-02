-- 문제: 연도별 배송 업체 이용 내역 분석하기
-- 유형: CASE WHEN / GROUP BY / SUM / YEAR
-- 핵심: 온라인 주문의 배송 옵션별 이용 건수 집계 + 반품 건수는 standard에 추가 합산
-- 정렬: year 오름차순

SELECT
    YEAR(purchased_at) AS year,
    SUM(
        CASE
            WHEN shipping_method = 'Standard' THEN 1
            ELSE 0
        END
    ) + SUM(
        CASE
            WHEN is_returned = TRUE THEN 1
            ELSE 0
        END
    ) AS standard,
    SUM(
        CASE
            WHEN shipping_method = 'Express' THEN 1
            ELSE 0
        END
    ) AS express,
    SUM(
        CASE
            WHEN shipping_method = 'Overnight' THEN 1
            ELSE 0
        END
    ) AS overnight
FROM transactions
WHERE is_online_order = TRUE
GROUP BY YEAR(purchased_at)
ORDER BY year ASC;
