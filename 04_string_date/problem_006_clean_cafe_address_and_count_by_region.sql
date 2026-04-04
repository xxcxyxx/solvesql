-- 문제: 전국 카페 주소 데이터 정제하기
-- 유형: STRING / GROUP BY / COUNT / SUBSTRING_INDEX
-- 핵심: 주소에서 시도, 시군구를 분리한 뒤 행정구역별 카페 수 집계
-- 정렬: 카페 수 내림차순

SELECT
    SUBSTRING_INDEX(address, ' ', 1) AS sido,
    SUBSTRING_INDEX(SUBSTRING_INDEX(address, ' ', 2), ' ', -1) AS sigungu,
    COUNT(*) AS cnt
FROM cafes
GROUP BY
    SUBSTRING_INDEX(address, ' ', 1),
    SUBSTRING_INDEX(SUBSTRING_INDEX(address, ' ', 2), ' ', -1)
ORDER BY cnt DESC;
