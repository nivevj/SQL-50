# Write your MySQL query statement below
select name from Customer where ifnull(referee_id,0) <> 2
# ifnull return 0 if referee_id is equal to null. then the value is compared to not equal with 2
