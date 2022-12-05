12세 이하인 여자 환자 목록 출력하기
SELECT PT_NAME, PT_NO, GEND_CD, AGE,
CASE WHEN TLNO IS NULL THEN 'NONE' ELSE TLNO END TLNO FROM patient WHERE gend_cd='W'and age <= 12
ORDER BY age DESC, PT_NAME ASC

흉부외과 또는 일반외과 의사 목록 출력하기
SELECT DR_NAME, DR_ID, MCDP_CD, DATE_FORMAT(HIRE_YMD, '%Y-%m-%d') AS HIRE_YMD FROM DOCTOR
WHERE MCDP_CD = 'CS' OR mcdp_cd='GS'
ORDER BY HIRE_YMD DESC, DR_NAME ASC;

인기있는 아이스크림
SELECT FLAVOR FROM first_half
ORDER BY total_order DESC, shipment_id ASC

과일로 만든 아이스크림 고르기
SELECT f.FLAVOR FROM first_half f, icecream_info i
WHERE f.FLAVOR = i.FLAVOR AND total_order>3000 AND ingredient_type='fruit_based'
ORDER BY total_order DESC

