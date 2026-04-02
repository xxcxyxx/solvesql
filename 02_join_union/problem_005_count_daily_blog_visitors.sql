-- 문제: 일별 블로그 방문자 수 집계
-- 유형: WHERE / GROUP BY / COUNT DISTINCT / ORDER BY
-- 핵심: 기간 내 일자별 고유 방문자 수 집계
-- 정렬: dt 오름차순

SELECT
    event_date_kst AS dt,
    COUNT(DISTINCT user_pseudo_id) AS users
FROM ga
WHERE event_date_kst BETWEEN '2021-08-02' AND '2021-08-09'
GROUP BY event_date_kst
ORDER BY dt ASC;
