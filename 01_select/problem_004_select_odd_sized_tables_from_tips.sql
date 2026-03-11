-- 문제: 몇 분이서 오셨어요?
-- 유형: SELECT / WHERE
-- 핵심: size가 홀수인 테이블만 조회

SELECT *
FROM tips
WHERE MOD(size, 2) = 1;
