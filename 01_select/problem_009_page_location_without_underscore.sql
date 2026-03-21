-- 문제: 언더스코어(_)가 포함되지 않은 데이터 찾기
-- 유형: SELECT / DISTINCT / LIKE / ESCAPE
-- 핵심: '_'는 와일드카드라서 ESCAPE 처리 필요
-- 정렬: page_location 오름차순

SELECT DISTINCT
    page_location
FROM ga
WHERE page_location NOT LIKE '%\_%' ESCAPE '\'
ORDER BY page_location ASC;
