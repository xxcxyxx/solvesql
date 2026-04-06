-- 문제: 점검이 필요한 자전거 찾기
-- 유형: AGGREGATE / GROUP BY / HAVING / WHERE
-- 핵심: 2021년 1월 자전거별 총 주행거리를 합산해 50km 이상인 자전거 ID 추출
-- 조건: rent_at이 2021-01 기간에 해당
-- 정렬: 없음

SELECT
    bike_id
FROM rental_history
WHERE rent_at >= '2021-01-01'
  AND rent_at < '2021-02-01'
GROUP BY bike_id
HAVING SUM(distance) >= 50000;
