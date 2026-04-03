-- 문제: 배송 예정일 예측 성공과 실패
-- 유형: CASE WHEN / GROUP BY / COUNT / DATE
-- 핵심: 구매 날짜별 배송 예정 시각 내 도착/지연 도착 주문 수 집계
-- 조건: 배송 완료 시각과 배송 예정 시각이 모두 있는 주문만 포함
-- 정렬: purchase_date 오름차순

SELECT
    DATE(order_purchase_timestamp) AS purchase_date,
    SUM(
        CASE
            WHEN order_delivered_customer_date <= order_estimated_delivery_date THEN 1
            ELSE 0
        END
    ) AS success,
    SUM(
        CASE
            WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1
            ELSE 0
        END
    ) AS fail
FROM olist_orders_dataset
WHERE order_purchase_timestamp >= '2017-01-01'
  AND order_purchase_timestamp < '2017-02-01'
  AND order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL
GROUP BY DATE(order_purchase_timestamp)
ORDER BY purchase_date ASC;
