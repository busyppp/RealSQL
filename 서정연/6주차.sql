--이름에 el이 들어가는 동물 찾기
SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE NAME LIKE '%EL%'
AND ANIMAL_TYPE = 'Dog'
order by name;

--동물수 구하기
SELECT count(*) from animal_ins;

--중복 제거하기
SELECT count(distinct(name)) from animal_ins
where name is not null;

--중성화 여부 파악하기
SELECT ANIMAL_ID, NAME,
case when SEX_UPON_INTAKE like '%Neutered%' or SEX_UPON_INTAKE like '%Spayed%' THEN 'O' ELSE 'X' END 중성화 
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;
