-- 문제: 폐쇄할 따릉이 정류소 찾기 1
-- 유형: SELF JOIN / HAVING / HAVERSINE FORMULA
-- 핵심: 반경 300m 이내에 더 최근 정류소가 5개 이상인 정류소 찾기
-- 정렬: 없음

SELECT
    s1.station_id,
    s1.name
FROM station s1
JOIN station s2
    ON s1.station_id <> s2.station_id
   AND s2.updated_at > s1.updated_at
   AND 2 * 6356 * ASIN(
       SQRT(
           POWER(SIN(RADIANS(s1.lat - s2.lat) / 2), 2) +
           COS(RADIANS(s1.lat)) * COS(RADIANS(s2.lat)) *
           POWER(SIN(RADIANS(s1.lng - s2.lng) / 2), 2)
       )
   ) <= 0.3
GROUP BY
    s1.station_id,
    s1.name
HAVING COUNT(*) >= 5;
