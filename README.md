# 📊 SolveSQL for Data Analysis

SolveSQL 문제를 활용해 데이터 분석 업무에서 필요한 SQL 역량을 체계적으로 훈련하고,  
요구사항을 쿼리로 구조화하는 능력을 정리한 레포지토리입니다.  

단순 문제 풀이 저장이 아니라, 문제를 데이터 조회 / 집계 / 관계 해석 / 분석 로직 관점으로 재구성하여 기록합니다.

---

## 🎯 What this repository proves

이 레포지토리는 다음 역량을 보여주기 위해 만들어졌습니다.

- 비즈니스 요구사항을 SQL 로직으로 변환하는 능력
- 관계형 데이터 구조를 이해하고 JOIN 구조를 설계하는 능력
- 집계 기준을 정의하고 결과를 해석하는 능력
- 문자열, 날짜, 조건 처리 등 전처리 로직을 쿼리로 구현하는 능력
- 분석형 SQL 문제를 단계적으로 분해하고 구조화하는 능력

---

## 🧠 Problem Solving Approach

모든 문제는 아래 과정으로 해결합니다.

1. 데이터가 무엇을 의미하는지 정의
2. 필요한 테이블과 컬럼 식별
3. 조건, 집계, 관계를 분리해서 해석
4. 단계별로 쿼리 구성
5. 다른 문제에도 적용 가능한 패턴으로 정리

정답을 맞추는 것보다 **다른 데이터에서도 재사용 가능한 쿼리 설계 방식**을 만드는 것을 목표로 합니다.

---

## 📁 Repository Structure

문제는 SQL 문법 암기 순서가 아니라,  
실제 데이터 분석 과정에서 자주 사용하는 처리 방식 기준으로 정리했습니다.

```bash
solvesql/
├── 01_select/            # 필요한 데이터 조회
├── 02_join_union/        # 데이터 관계 연결 및 결합
├── 03_aggregate/         # 집계 및 지표 계산
├── 04_string_date/       # 문자열/날짜 전처리
├── 05_subquery_cte/      # 단계별 쿼리 분리 및 재구성
├── 06_window_function/   # 순위, 누적값, 구간별 계산
├── 07_case_if/           # 조건 분기 처리
└── 08_analytics/         # 복합 분석형 문제


🏷 Query Classification System

문제는 난이도가 아니라 사용된 데이터 처리 방식 기준으로 분류합니다.

코드	의미
SEL	기본 조회 및 필터링
JUN	JOIN / UNION 기반 결합
AGG	집계 및 지표 계산
STR	문자열 / 날짜 처리
SUB	Subquery / CTE
WIN	Window Function
CAS	CASE / IF 조건 분기
ANL	분석형 복합 문제

Example

SEL-001 | 기본 조건 조회
JUN-001 | 두 테이블 결합 후 조건 필터링
AGG-001 | 카테고리별 집계
STR-001 | 날짜 포맷 변환
SUB-001 | 서브쿼리 기반 재구성
WIN-001 | 순위 계산
CAS-001 | 조건별 값 분류
ANL-001 | 다단계 분석 문제

→ 문제 번호를 외우기 위한 구조가 아니라,
필요한 쿼리 패턴을 빠르게 찾고 복습하기 위한 구조입니다.

📝 File Documentation Rule

각 문제 파일은 아래 형식으로 정리합니다.

문제명

SQL 유형

핵심 개념

풀이에 필요한 해석 포인트

전체 SQL 코드

한 줄 코멘트

예시:

-- 문제: 대장균의 크기에 따라 분류하기 1
-- 유형: SELECT / CASE WHEN
-- 핵심: 조건에 따라 값 분류
-- 정렬: ID 오름차순

SELECT
    ID,
    CASE
        WHEN SIZE_OF_COLONY <= 100 THEN 'LOW'
        WHEN SIZE_OF_COLONY <= 1000 THEN 'MEDIUM'
        ELSE 'HIGH'
    END AS SIZE
FROM ECOLI_DATA
ORDER BY ID ASC;

-- Comment: Classify ecoli colony size using CASE expression
💡 Why this matters

실무 SQL은 단순 조회가 아니라
데이터 정의 → 관계 해석 → 조건 처리 → 집계 → 검증의 과정에 가깝습니다.

이 레포지토리는 문제 풀이 기록 자체보다,
데이터 분석 업무에서 반복적으로 사용되는 쿼리 설계 패턴을 축적하는 것에 목적이 있습니다.
