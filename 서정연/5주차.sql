--최솟값 구하기
SELECT min(DATETIME) 시간 from animal_ins;

--고양이와 개는 몇 마리 있을까
SELECT ANIMAL_TYPE, count(*)
FROM ANIMAL_INS 
GROUP BY ANIMAL_TYPE
ORDER BY ANIMAL_TYPE;

--동명 동물 수 찾기
SELECT NAME, COUNT(NAME) AS COUNT
FROM ANIMAL_INS
WHERE NAME IS NOT NULL
GROUP BY NAME 
HAVING COUNT(NAME) >= 2
ORDER BY NAME;

--루시와 엘라 찾기
SELECT ANIMAL_ID, NAME, SEX_UPON_INTAKE
FROM ANIMAL_INS
WHERE NAME IN ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty')
ORDER BY ANIMAL_ID;
