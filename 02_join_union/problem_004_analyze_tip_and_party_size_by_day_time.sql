-- 문제: 레스토랑 웨이터의 팁 분석
-- 유형: GROUP BY / AVG / ROUND / ORDER BY
-- 핵심: 요일과 시간대별 평균 팁, 평균 일행 수 계산
-- 정렬: day 오름차순, time 오름차순

SELECT
    day,
    time,
    ROUND(AVG(tip), 2) AS avg_tip,
    ROUND(AVG(size), 2) AS avg_size
FROM tips
GROUP BY day, time
ORDER BY day ASC, time ASC;
