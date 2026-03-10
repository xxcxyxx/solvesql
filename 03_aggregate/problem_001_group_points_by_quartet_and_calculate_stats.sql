-- 문제: 데이터 그룹으로 묶기
-- 유형: AGGREGATE / GROUP BY
-- 핵심: quartet 기준 그룹화 후 평균과 표본 분산 계산

SELECT
    quartet,
    ROUND(AVG(x), 2) AS x_mean,
    ROUND(VAR_SAMP(x), 2) AS x_var,
    ROUND(AVG(y), 2) AS y_mean,
    ROUND(VAR_SAMP(y), 2) AS y_var
FROM points
GROUP BY quartet;
