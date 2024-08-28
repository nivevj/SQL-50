# Write your MySQL query statement below
select b.employee_id, b.name, count(a.employee_id) as reports_count, round(avg(a.age)) as average_age from employees a join employees b on a.reports_to=b.employee_id group by employee_id order by employee_id
