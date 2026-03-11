-- 문제: 첫 주문과 마지막 주문
-- 유형: STRING / DATE / AGGREGATE
-- 핵심: 주문 시각의 최솟값과 최댓값에서 날짜만 추출

SELECT
    DATE(MIN(order_purchase_timestamp)) AS first_order_date,
    DATE(MAX(order_purchase_timestamp)) AS last_order_date
FROM olist_orders_dataset;
