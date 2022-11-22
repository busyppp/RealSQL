-- 모든 레코드 조회하기
SELECT * from ANIMAL_INS
order by ANIMAL_ID;

-- 역순 정렬하기
SELECT name, datetime from ANIMAL_INS
order by animal_id desc;

-- 아픈 동물 찾기
SELECT animal_id, name from animal_ins
where INTAKE_CONDITION = 'Sick'
order by ANIMAL_ID;

-- 어린 동물 찾기
SELECT ANIMAL_ID, name from ANIMAL_INS
where INTAKE_CONDITION != 'Aged'
order by ANIMAL_ID;

-- 이름이 없는 동물의 아이디
SELECT ANIMAL_ID FROM ANIMAL_INS
WHERE NAME is null
ORDER BY ANIMAL_ID;
