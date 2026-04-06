-- 문제: 할부는 몇 개월로 해드릴까요
-- 유형: AGGREGATE / GROUP BY / COUNT DISTINCT / MIN / MAX / AVG
-- 핵심: 신용카드 결제 데이터를 할부 개월 수별로 나누어 주문 수와 결제 금액 통계 집계
-- 조건: payment_type = 'credit_card'
-- 정렬: payment_installments 오름차순

SELECT
    payment_installments,
    COUNT(DISTINCT order_id) AS order_count,
    MIN(payment_value) AS min_value,
    MAX(payment_value) AS max_value,
    AVG(payment_value) AS avg_value
FROM olist_order_payments_dataset
WHERE payment_type = 'credit_card'
GROUP BY payment_installments
ORDER BY payment_installments ASC;
