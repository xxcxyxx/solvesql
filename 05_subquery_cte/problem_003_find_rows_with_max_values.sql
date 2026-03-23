-- 문제: 최대값을 가진 행 찾기
-- 유형: AGGREGATE / SUBQUERY
-- 핵심: x의 최대값 또는 y의 최대값을 가진 행의 id 조회
-- 정렬: id ASC

SELECT
    id
FROM points
WHERE x = (SELECT MAX(x) FROM points)
   OR y = (SELECT MAX(y) FROM points)
ORDER BY id ASC;
