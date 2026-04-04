-- 문제: 서울숲 요일별 대기오염도 계산하기
-- 유형: DATE / GROUP BY / AVG / ROUND / CASE
-- 핵심: WEEKDAY로 요일별 그룹화 후 대기오염도 평균 계산
-- 정렬: 월요일 ~ 일요일 순

SELECT
    CASE
        WHEN weeknum = 0 THEN '월요일'
        WHEN weeknum = 1 THEN '화요일'
        WHEN weeknum = 2 THEN '수요일'
        WHEN weeknum = 3 THEN '목요일'
        WHEN weeknum = 4 THEN '금요일'
        WHEN weeknum = 5 THEN '토요일'
        WHEN weeknum = 6 THEN '일요일'
    END AS weekday,
    no2,
    o3,
    co,
    so2,
    pm10,
    pm2_5
FROM (
    SELECT 
        WEEKDAY(measured_at) AS weeknum,
        ROUND(AVG(no2), 4) AS no2,
        ROUND(AVG(o3), 4) AS o3,
        ROUND(AVG(co), 4) AS co,
        ROUND(AVG(so2), 4) AS so2,
        ROUND(AVG(pm10), 4) AS pm10,
        ROUND(AVG(pm2_5), 4) AS pm2_5
    FROM measurements
    GROUP BY WEEKDAY(measured_at)
) AS week_data
ORDER BY weeknum;
