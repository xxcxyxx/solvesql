-- 문제: 한국 감독의 영화 찾기
-- 유형: JOIN / WHERE / LIKE
-- 핵심: 한국 국적 아티스트와 연결된 영화 작품 조회
-- 출력: artist, title

SELECT
    ar.name AS artist,
    aw.title
FROM artists ar
JOIN artworks_artists aa
    ON ar.artist_id = aa.artist_id
JOIN artworks aw
    ON aa.artwork_id = aw.artwork_id
WHERE ar.nationality = 'Korean'
  AND aw.classification LIKE 'Film%';
