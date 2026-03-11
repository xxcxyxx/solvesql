-- 문제: 크리스마스 게임 찾기
-- 유형: SELECT / WHERE / LIKE
-- 핵심: 이름에 Christmas 또는 Santa가 포함된 게임 조회

SELECT
    game_id,
    name,
    year
FROM games
WHERE name LIKE '%Christmas%'
   OR name LIKE '%Santa%';
