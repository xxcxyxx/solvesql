-- 문제: 우리 플랫폼에 정착한 판매자 1
-- 유형: AGGREGATE / GROUP BY / HAVING
-- 핵심: 판매자별 주문 건수를 집계하고 100건 이상인 판매자만 조회

SELECT
    seller_id,
    COUNT(DISTINCT order_id) AS orders
FROM olist_order_items_dataset
GROUP BY seller_id
HAVING COUNT(DISTINCT order_id) >= 100;
