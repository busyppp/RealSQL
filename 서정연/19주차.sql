-- 자동차 대여 기록 별 대여 금액 구하기
SELECT HISTORY_ID,
cast(CASE WHEN du < 7 THEN DAILY_FEE*du
                 WHEN du < 30 THEN (DAILY_FEE-(DAILY_FEE*0.05))*du
                 WHEN du < 90 THEN (DAILY_FEE-(DAILY_FEE*0.08))*du 
                 ELSE (DAILY_FEE-(DAILY_FEE*0.15))*du END as SIGNED INT) as FEE
FROM 
(SELECT c.CAR_ID, c.CAR_TYPE, c.DAILY_FEE, 
h.HISTORY_ID, h.START_DATE, h.END_DATE,
datediff(h.END_DATE, h.START_DATE) + 1 as du
FROM CAR_RENTAL_COMPANY_CAR as c 
JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY as h
on c.CAR_ID = h.CAR_ID
# p 테이블은 % 비율만 알아내고 굳이 JOIN을 하지 않아도 됨
# JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN  as p
# on c.CAR_TYPE = p.CAR_TYPE
WHERE c.CAR_TYPE = '트럭'
GROUP BY h.HISTORY_ID) as car
ORDER BY 2 DESC, 1 DESC;

--특정 기간동안 대여 가능한 자동차들의 대여비용 구하기
-- 예정헤헤
