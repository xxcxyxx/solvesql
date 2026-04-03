-- 문제: 장르, 연도별 게임 평론가 점수 구하기
-- 유형: JOIN / CASE WHEN / AVG / ROUND / GROUP BY
-- 핵심: 장르별로 2011~2015년 평론가 점수 평균을 가로 컬럼 형태로 집계
-- 조건: critic_score가 NULL인 게임 제외
-- 정렬: genre 오름차순

SELECT
    ge.name AS genre,
    ROUND(AVG(CASE WHEN g.year = 2011 THEN g.critic_score END), 2) AS score_2011,
    ROUND(AVG(CASE WHEN g.year = 2012 THEN g.critic_score END), 2) AS score_2012,
    ROUND(AVG(CASE WHEN g.year = 2013 THEN g.critic_score END), 2) AS score_2013,
    ROUND(AVG(CASE WHEN g.year = 2014 THEN g.critic_score END), 2) AS score_2014,
    ROUND(AVG(CASE WHEN g.year = 2015 THEN g.critic_score END), 2) AS score_2015
FROM games g
JOIN genres ge
    ON g.genre_id = ge.genre_id
WHERE g.year BETWEEN 2011 AND 2015
  AND g.critic_score IS NOT NULL
GROUP BY ge.name
ORDER BY genre ASC;
