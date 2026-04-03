-- 문제: 지역별 주문의 특징
-- 유형: CASE WHEN / GROUP BY / COUNT DISTINCT / PIVOT
-- 핵심: 지역별 카테고리 주문 수를 order_id 기준으로 중복 없이 집계
-- 정렬: Region 오름차순

SELECT
    region AS Region,
    COUNT(DISTINCT CASE WHEN category = 'Furniture' THEN order_id END) AS `Furniture`,
    COUNT(DISTINCT CASE WHEN category = 'Office Supplies' THEN order_id END) AS `Office Supplies`,
    COUNT(DISTINCT CASE WHEN category = 'Technology' THEN order_id END) AS `Technology`
FROM records
GROUP BY region
ORDER BY Region ASC;
