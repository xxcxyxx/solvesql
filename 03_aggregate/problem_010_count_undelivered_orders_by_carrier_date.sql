-- 문제: 버뮤다 삼각지대에 들어가버린 택배
-- 유형: AGGREGATE / DATE / GROUP BY / WHERE
-- 핵심: 택배사 도착일은 있지만 고객 배송 완료일은 없는 주문을 날짜별로 집계
-- 조건: 2017년 1월 데이터만 조회
-- 정렬: delivered_carrier_date 오름차순

SELECT
    DATE(order_delivered_carrier_date) AS delivered_carrier_date,
    COUNT(*) AS orders
FROM olist_orders_dataset
WHERE order_delivered_carrier_date IS NOT NULL
  AND order_delivered_customer_date IS NULL
  AND order_delivered_carrier_date >= '2017-01-01'
  AND order_delivered_carrier_date < '2017-02-01'
GROUP BY DATE(order_delivered_carrier_date)
ORDER BY delivered_carrier_date ASC;
