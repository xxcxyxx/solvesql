-- 문제: 매출이 높은 배우 찾기
-- 유형: JOIN / AGGREGATE / GROUP BY / ORDER BY
-- 핵심: 배우 출연작의 실제 결제 금액(payment.amount) 합계를 계산해 상위 5명 조회
-- 정렬: total_revenue DESC

SELECT
    a.first_name,
    a.last_name,
    ROUND(SUM(p.amount), 2) AS total_revenue
FROM actor a
JOIN film_actor fa
    ON a.actor_id = fa.actor_id
JOIN inventory i
    ON fa.film_id = i.film_id
JOIN rental r
    ON i.inventory_id = r.inventory_id
JOIN payment p
    ON r.rental_id = p.rental_id
GROUP BY
    a.actor_id,
    a.first_name,
    a.last_name
ORDER BY total_revenue DESC
LIMIT 5;
