-- 문제: 두 테이블 결합하기
-- 유형: JOIN
-- 핵심: events와 records를 event_id로 조인하여 골프 종목 참가 선수 ID 조회

SELECT DISTINCT
    r.athlete_id
FROM records AS r
INNER JOIN events AS e
    ON r.event_id = e.id
WHERE e.sport = 'Golf';
