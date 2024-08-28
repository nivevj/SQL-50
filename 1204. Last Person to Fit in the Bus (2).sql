# Write your MySQL query statement below
select person_name from (select person_name, weight, turn, sum(weight) over (order by turn) as total_weight from queue) as query where total_weight<=1000 order by turn desc limit 1
