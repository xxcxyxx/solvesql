-- 문제: 우리 플랫폼에 정착한 판매자 2
-- 유형: CTE / GROUP BY / HAVING / COUNT
-- 핵심: 가격이 50달러 이상인 주문만 대상으로 판매자별 주문 건수를 집계하고 100건 이상 판매자만 조회
-- 정렬: orders 내림차순

WITH seller_orders AS (
    SELECT
        seller_id,
        COUNT(DISTINCT order_id) AS orders
    FROM olist_order_items_dataset
    WHERE price >= 50
    GROUP BY seller_id
)

SELECT
    seller_id,
    orders
FROM seller_orders
WHERE orders >= 100
ORDER BY orders DESC;

/*
[Approach]

1. 가격이 50달러 이상인 상품만 필터링한다.
2. seller_id 기준으로 그룹화하여 판매자별 주문 건수를 계산한다.
3. 같은 주문에 여러 상품이 있을 수 있으므로 COUNT(DISTINCT order_id)로 주문 수를 집계한다.
4. CTE에서 만든 중간 결과를 바탕으로 주문 건수가 100건 이상인 판매자만 선택한다.
5. 주문 건수가 많은 순으로 정렬한다.
*/
