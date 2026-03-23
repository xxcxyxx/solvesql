-- 문제: 기증품 비율 계산하기
-- 유형: AGGREGATE / CASE WHEN / ROUND / LOWER
-- 핵심: credit에 'gift'가 포함된 작품 수를 전체 작품 수로 나누어 백분율 계산
-- 조건: 부분 기증품 포함, 대소문자 구분 없이 검색
-- 출력: ratio

SELECT
    ROUND(
        100.0 * COUNT(CASE WHEN LOWER(credit) LIKE '%gift%' THEN 1 END) / COUNT(*),
        3
    ) AS ratio
FROM artworks;
