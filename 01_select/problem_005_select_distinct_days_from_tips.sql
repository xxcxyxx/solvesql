-- 문제: 레스토랑의 영업일
-- 유형: SELECT / DISTINCT
-- 핵심: day 컬럼의 중복을 제거하고 day_of_week로 출력

SELECT DISTINCT
    day AS day_of_week
FROM tips;
