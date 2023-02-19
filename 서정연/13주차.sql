-- 보호소에서 중성화한 동물

SELECT OUTS.ANIMAL_ID, OUTS.ANIMAL_TYPE, OUTS.NAME
FROM ANIMAL_INS INS
LEFT JOIN ANIMAL_OUTS OUTS
ON INS.ANIMAL_ID = OUTS.ANIMAL_ID
WHERE INS.SEX_UPON_INTAKE NOT IN ('Spayed Female', 'Neutered Male')
AND OUTS.SEX_UPON_OUTCOME IN ('Spayed Female', 'Neutered Male');

-- 입양 시각 구하기(2)
WITH RECURSIVE hour AS ( 
    SELECT 0 AS h
    UNION ALL
    SELECT h+1 FROM hour WHERE h < 23
)

SELECT hour.h as HOUR, count(hour(a.DATETIME)) as COUNT
FROM hour 
LEFT JOIN ANIMAL_OUTS as a
ON hour.h = hour(a.DATETIME)
group by 1
order by 1;
