-- 문제: 지자체별 따릉이 정류소 개수 세기
-- 유형: GROUP BY / COUNT / ORDER BY
-- 핵심: 소속 지자체별 정류소 수 집계
-- 정렬: num_stations 오름차순

SELECT
    local,
    COUNT(*) AS num_stations
FROM station
GROUP BY local
ORDER BY num_stations ASC;
