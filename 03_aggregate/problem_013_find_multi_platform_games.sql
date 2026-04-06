-- 문제: 멀티 플랫폼 게임 찾기
-- 유형: JOIN / AGGREGATE / CASE / GROUP BY / HAVING / COUNT DISTINCT
-- 핵심: 2012년 이후 출시된 게임 중 서로 다른 메이저 플랫폼 계열에 2개 이상 출시된 게임 찾기
-- 조건: Sony / Nintendo / Microsoft 계열 플랫폼만 대상
-- 정렬: name 오름차순

SELECT
    g.name
FROM games g
JOIN platforms p
    ON g.platform_id = p.platform_id
WHERE g.year > 2013
  AND p.name IN ('PS3', 'PS4', 'PSP', 'PSV',
                 'Wii', 'WiiU', 'DS', '3DS',
                 'X360', 'XONE')
GROUP BY g.name
HAVING COUNT(DISTINCT CASE
            WHEN p.name IN ('PS3', 'PS4', 'PSP', 'PSV') THEN 'Sony'
            WHEN p.name IN ('Wii', 'WiiU', 'DS', '3DS') THEN 'Nintendo'
            WHEN p.name IN ('X360', 'XONE') THEN 'Microsoft'
       END) >= 2
ORDER BY g.name ASC;
