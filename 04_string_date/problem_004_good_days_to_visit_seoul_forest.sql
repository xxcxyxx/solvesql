-- 문제: 서울숲에 놀러 가기 좋은 날
-- 유형: STRING / DATE / WHERE / ORDER BY
-- 핵심: 2022년 12월 중 pm2_5가 9 이하인 날짜 조회
-- 정렬: good_day ASC

SELECT
    measured_at AS good_day
FROM measurements
WHERE measured_at >= '2022-12-01'
  AND measured_at < '2023-01-01'
  AND pm2_5 <= 9
ORDER BY good_day ASC;
