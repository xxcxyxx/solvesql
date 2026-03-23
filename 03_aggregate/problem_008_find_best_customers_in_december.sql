-- 문제: 12월 우수 고객 찾기
-- 유형: AGGREGATE / GROUP BY / HAVING
-- 핵심: 2020년 12월 주문 매출 합계가 1000달러 이상인 고객 조회
-- 출력: customer_id

SELECT
    customer_id
FROM records
WHERE order_date >= '2020-12-01'
  AND order_date < '2021-01-01'
GROUP BY customer_id
HAVING SUM(sales) >= 1000;
