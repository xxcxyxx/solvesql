-- 문제: 초기 사용자의 친구 관계 찾기
-- 유형: SELECT / WINDOW FUNCTION / ORDER BY
-- 핵심: 두 사용자 ID 합이 가장 작은 친구 관계 중 상위 0.1% 추출
-- 정렬: id_sum 오름차순

/*
[Approach]

1. WITH 절에서 친구 관계별로 두 사용자 ID의 합(id_sum)을 계산한다.
2. ROW_NUMBER()를 사용해 id_sum이 작은 순서대로 순위를 매긴다.
3. COUNT(*) OVER()를 사용해 전체 친구 관계 수를 함께 구한다.
4. 메인 쿼리에서 순위가 전체의 상위 0.1%에 해당하는 관계만 필터링한다.
5. 최종 결과를 id_sum 오름차순으로 출력한다.
*/

WITH ranked_edges AS (
    SELECT
        user_a_id,
        user_b_id,
        user_a_id + user_b_id AS id_sum,
        ROW_NUMBER() OVER (ORDER BY user_a_id + user_b_id ASC) AS rn,
        COUNT(*) OVER () AS total_cnt
    FROM edges
)

SELECT
    user_a_id,
    user_b_id,
    id_sum
FROM ranked_edges
WHERE rn <= total_cnt * 0.001
ORDER BY id_sum ASC;
