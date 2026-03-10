-- 문제: 최근 올림픽이 개최된 도시
-- 유형: STRING / DATE
-- 핵심: 2000년 이후 개최 도시를 조회하고 도시명 앞 3글자를 대문자로 변환

SELECT
    year,
    UPPER(SUBSTR(city, 1, 3)) AS city
FROM games
WHERE year >= 2000
ORDER BY year DESC;
