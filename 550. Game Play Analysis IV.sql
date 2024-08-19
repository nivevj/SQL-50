# Write your MySQL query statement below
with temp as (
    select player_id, min(event_date) as first_login_date from activity group by player_id
)

select 
    round( sum(datediff(a.event_date,t.first_login_date)=1)/count(distinct a.player_id) ,2 )
    as fraction from activity a join temp t on a.player_id=t.player_id
