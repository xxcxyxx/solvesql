-- 문제: 게임을 10개 이상 발매한 게임 배급사 찾기
-- 유형: JOIN / GROUP BY / HAVING
-- 핵심: 배급사별 게임 수를 집계한 뒤 10개 이상인 회사 조회
-- 출력: name

SELECT
    c.name
FROM games g
JOIN companies c
    ON g.publisher_id = c.company_id
GROUP BY c.name
HAVING COUNT(*) >= 10;
