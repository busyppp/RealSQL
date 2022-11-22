-- 모든 레코드 조회하기
SELECT ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE from animal_INS
group by 1, 2, 4, 5, 6

-- 역순 정렬하기
SELECT NAME, DATETIME from ANIMAL_INS
order by animal_id desc

-- 아픈 동물 찾기
SELECT ANIMAL_ID , NAME from ANIMAL_INS
where intake_condition='Sick'
order by ANIMAL_ID ASC

-- 어린 동물 찾기
SELECT ANIMAL_ID, NAME from animal_ins
where not intake_condition='Aged'
order by animal_id asc

-- 이름이 없는 동물의 아이디
SELECT ANIMAL_ID FROM ANIMAL_INS
WHERE NAME IS NULL
ORDER BY ANIMAL_ID ASC