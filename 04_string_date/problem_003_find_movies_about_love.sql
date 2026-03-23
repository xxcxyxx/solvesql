-- 문제: 사랑에 대한 영화 찾기
-- 유형: STRING / LIKE / ORDER BY
-- 핵심: 제목에 'Love' 또는 'love'가 포함된 영화 조회
-- 정렬: rotten_tomatoes DESC, year DESC

SELECT
    title,
    year,
    rotten_tomatoes
FROM movies
WHERE title LIKE '%Love%'
   OR title LIKE '%love%'
ORDER BY rotten_tomatoes DESC, year DESC;
