-- 문제: 많이 주문한 테이블 찾기
-- 유형: SUBQUERY
-- 핵심: 전체 평균 식사 금액보다 큰 total_bill 행만 조회

SELECT *
FROM tips
WHERE total_bill > (
    SELECT AVG(total_bill)
    FROM tips
);
