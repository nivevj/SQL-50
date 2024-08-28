# Write your MySQL query statement below
-- with cnt as (
--     select num, lead(num,1) over () as num1, lead(num,2) over () as num2 from logs
-- )
-- select distinct num as ConsecutiveNums from cnt where num=num1 and num=num2
select distinct a.num as ConsecutiveNums from logs a join logs b on a.id+1=b.id join logs c on a.id+2=c.id where a.num=b.num and a.num=c.num
