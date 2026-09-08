-- 문제: 쇼핑몰의 일일 매출액
-- 유형: AGGREGATE / JOIN / GROUP BY
-- 핵심: 2018-01-01 이후 주문의 날짜별 결제 금액 합계 조회
-- 출력: dt, revenue_daily

SELECT
    DATE(o.order_purchase_timestamp) AS dt,
    ROUND(SUM(p.payment_value), 2) AS revenue_daily
FROM olist_orders_dataset o
JOIN olist_order_payments_dataset p
    ON o.order_id = p.order_id
WHERE o.order_purchase_timestamp >= '2018-01-01'
GROUP BY DATE(o.order_purchase_timestamp)
ORDER BY dt;
