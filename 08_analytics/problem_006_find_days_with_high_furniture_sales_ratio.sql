-- 문제: 가구 판매의 비중이 높았던 날 찾기
-- 유형: CASE WHEN / COUNT DISTINCT / GROUP BY / HAVING / ROUND
-- 핵심: 일별 전체 주문 수와 Furniture 주문 수를 비교해 비율이 높은 날 추출
-- 조건: 일별 주문 수 10건 이상, Furniture 비율 40% 이상
-- 정렬: furniture_pct 내림차순, order_date 오름차순

SELECT
    order_date,
    COUNT(DISTINCT CASE WHEN category = 'Furniture' THEN order_id END) AS furniture,
    ROUND(
        COUNT(DISTINCT CASE WHEN category = 'Furniture' THEN order_id END) * 100.0
        / COUNT(DISTINCT order_id),
        2
    ) AS furniture_pct
FROM records
GROUP BY order_date
HAVING COUNT(DISTINCT order_id) >= 10
   AND COUNT(DISTINCT CASE WHEN category = 'Furniture' THEN order_id END) * 100.0
       / COUNT(DISTINCT order_id) >= 40
ORDER BY furniture_pct DESC, order_date ASC;
