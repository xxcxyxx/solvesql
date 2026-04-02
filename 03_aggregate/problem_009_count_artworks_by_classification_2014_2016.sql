-- 문제: 3년간 들어온 소장품 집계하기
-- 유형: GROUP BY / CASE WHEN / SUM / YEAR
-- 핵심: classification별 2014~2016 연도 조건 집계
-- 조건: acquisition_date가 NULL이면 2013년 이전 소장으로 간주
-- 정렬: classification 오름차순

SELECT
    classification,
    SUM(CASE WHEN YEAR(acquisition_date) = 2014 THEN 1 ELSE 0 END) AS `2014`,
    SUM(CASE WHEN YEAR(acquisition_date) = 2015 THEN 1 ELSE 0 END) AS `2015`,
    SUM(CASE WHEN YEAR(acquisition_date) = 2016 THEN 1 ELSE 0 END) AS `2016`
FROM artworks
WHERE acquisition_date IS NULL
   OR YEAR(acquisition_date) <= 2016
GROUP BY classification
ORDER BY classification ASC;
