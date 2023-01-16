--없어진 기록 찾기
SELECT b.ANIMAL_ID, b.NAME
from ANIMAL_INS as a
right join ANIMAL_OUTS as b
on a.ANIMAL_ID = b.ANIMAL_ID
where a.animal_id is null;

--있었는데요 없었습니다
SELECT b.ANIMAL_ID, b.NAME
from ANIMAL_INS a
right join ANIMAL_OUTS b
on a.animal_id = b.animal_id
where a.datetime > b.datetime
order by a.datetime;

--오랜 기간 보호한 동물(1)
SELECT a.NAME, a.DATETIME
from ANIMAL_INS a
left join ANIMAL_OUTS b
on a.ANIMAL_ID=b.ANIMAL_ID
where b.datetime is null
order by a.DATETIME
LIMIT 3;
