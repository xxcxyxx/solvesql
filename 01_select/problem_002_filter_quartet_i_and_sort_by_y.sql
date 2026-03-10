-- 문제: 데이터 정렬하기
-- 유형: SELECT / WHERE / ORDER BY
-- 핵심: quartet 값이 I인 데이터만 조회 후 y 기준 오름차순 정렬

SELECT *
FROM points
WHERE quartet = 'I'
ORDER BY y ASC;   
