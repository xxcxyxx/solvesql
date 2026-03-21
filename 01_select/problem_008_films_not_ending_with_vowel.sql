-- 문제: 제목이 모음으로 끝나지 않는 영화
-- 유형: SELECT / WHERE / 문자열 함수
-- 핵심: R, NC-17 등급 중 제목 마지막 글자가 모음이 아닌 영화 조회
-- 출력: title만 출력

SELECT
    title
FROM film
WHERE rating IN ('R', 'NC-17')
  AND UPPER(RIGHT(title, 1)) NOT IN ('A', 'E', 'I', 'O', 'U');
