-- 문제: 펭귄 조사하기
-- 유형: SELECT / DISTINCT / ORDER BY
-- 핵심: 서식지별 펭귄 종을 중복 없이 조회
-- 정렬: island 오름차순, 같은 island 내 species 오름차순

SELECT DISTINCT
    species,
    island
FROM penguins
ORDER BY island ASC, species ASC;
