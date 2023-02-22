-- 보호소에서 중성화한 동물
-- 1.
SELECT 
    ins.animal_id AS ANIMAL_ID, 
    ins.animal_type AS ANIMAL_TYPE,
    ins.name AS NAME
FROM ANIMAL_INS ins
JOIN ANIMAL_OUTS outs ON ins.animal_id = outs.animal_id
WHERE SUBSTRING_INDEX(ins.SEX_UPON_INTAKE, ' ', 1) = 'Intact'
    AND (
        SUBSTRING_INDEX(outs.SEX_UPON_OUTCOME, ' ', 1) = 'Spayed' 
        OR 
        SUBSTRING_INDEX(outs.SEX_UPON_OUTCOME, ' ', 1) = 'Neutered' 
    )
ORDER BY ins.animal_id;

-- 2.
SELECT 
    ins.animal_id AS ANIMAL_ID, 
    ins.animal_type AS ANIMAL_TYPE,
    ins.name AS NAME
FROM ANIMAL_INS ins
JOIN ANIMAL_OUTS outs ON ins.animal_id = outs.animal_id
WHERE SUBSTRING_INDEX(ins.SEX_UPON_INTAKE, ' ', 1) = 'Intact'
    AND SUBSTRING_INDEX(ins.SEX_UPON_INTAKE, ' ', 1) <> SUBSTRING_INDEX(outs.SEX_UPON_OUTCOME, ' ', 1)
ORDER BY ins.animal_id;


-- 입양 시각 구하기(2)
-- 1.
WITH RECURSIVE hours (HOUR) AS
(
    SELECT 0
    UNION ALL
    SELECT HOUR + 1 FROM hours WHERE HOUR < 23
)

SELECT hours.HOUR, COUNT(a.ANIMAL_ID) AS COUNT
FROM hours
LEFT JOIN ANIMAL_OUTS a
ON hours.HOUR = HOUR(a.datetime)
GROUP BY HOUR
ORDER BY HOUR


-- 2.
SET @HOUR = -1;
SELECT (@HOUR := @HOUR +1) AS HOUR,
    (SELECT COUNT(HOUR(DATETIME)) 
    FROM ANIMAL_OUTS 
    WHERE HOUR(DATETIME)=@HOUR) AS COUNT 
    FROM ANIMAL_OUTS
WHERE @HOUR < 23;
