-- 문제: 연도별 순매출 구하기
-- 유형: GROUP BY / SUM / WHERE / DATE FUNCTION
-- 핵심: 반품 제외 후 (주문금액 - 할인금액) 연도별 합계 계산
-- 정렬: year 오름차순

SELECT
    EXTRACT(YEAR FROM purchased_at) AS year,
    SUM(total_price - discount_amount) AS net_sales
FROM transactions
WHERE is_returned = FALSE
GROUP BY EXTRACT(YEAR FROM purchased_at)
ORDER BY year ASC;
