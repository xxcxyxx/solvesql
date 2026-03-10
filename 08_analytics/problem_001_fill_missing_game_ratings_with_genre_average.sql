-- 문제: 게임 평점 예측하기 1
-- 유형: ANALYTICS / CTE / COALESCE
-- 핵심: 같은 장르의 평균 평점과 평균 평가 수로 누락값 보완

WITH cte_avg AS (
    SELECT
        genre_id,
        ROUND(AVG(critic_score), 3) AS critic_score_avg,
        CEIL(AVG(critic_count)) AS critic_count_avg,
        ROUND(AVG(user_score), 3) AS user_score_avg,
        CEIL(AVG(user_count)) AS user_count_avg
    FROM games
    WHERE
        critic_score IS NOT NULL
        OR critic_count IS NOT NULL
        OR user_score IS NOT NULL
        OR user_count IS NOT NULL
    GROUP BY genre_id
)

SELECT
    games.game_id,
    games.name,
    COALESCE(games.critic_score, cte_avg.critic_score_avg) AS critic_score,
    COALESCE(games.critic_count, cte_avg.critic_count_avg) AS critic_count,
    COALESCE(games.user_score, cte_avg.user_score_avg) AS user_score,
    COALESCE(games.user_count, cte_avg.user_count_avg) AS user_count
FROM games
INNER JOIN cte_avg
    ON games.genre_id = cte_avg.genre_id
WHERE games.year >= 2015
  AND (
      games.critic_score IS NULL
      OR games.critic_count IS NULL
      OR games.user_score IS NULL
      OR games.user_count IS NULL
  );
