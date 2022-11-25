-- 동물의 아이디와 이름
SELECT ANIMAL_ID, NAME from ANIMAL_INS
order by ANIMAL_ID;



-- 여러 기준으로 정렬하기

SELECT ANIMAL_ID, name, datetime from animal_ins
order by name asc, DATETIME desc;



-- 상위 n개 레코드
SELECT name from animal_ins
order by datetime
limit 1;



-- 이름이 있는 동물의 아이디
SELECT ANIMAL_ID from ANIMAL_INS
where NAME is not null
order by ANIMAL_ID;



-- 최댓값 구하기
SELECT max(DATETIME) 시간 from animal_ins;
