# Write your MySQL query statement below
select a.person_name from queue a join queue b on a.turn >= b.turn group by a.turn having sum(b.weight) <= 1000 order by sum(b.weight) desc limit 1 

/*

Alice gets on first (turn 1). "1" is not greater than any other turn and equal to itself so this creates a scenario where only Alice gets on the bus.

Marie gets on second. "2" is greater than 1 and equal to itself. Alice and Mary get on the bus.

John Cena gets on third. "3" is greater than 1 and 2 and equal to itself. John, Mary, and Alice get on the bus and so on.

Try the below, it was magic for helping me understand this:

select
*
from
Queue q1 JOIN Queue q2 ON q1.turn >=
q2.turn
order by
q1.turn, q2.turn

See that parttern in q2.turn?

1
12
123
1234
12345
123456

This represents all the different boarding group scenarios!

That alone wouldn't be enough though. What's REALLY NEAT is that each of those is "grouped" by q1.turn - the highest rank, or more intuitively, the last person on the bus in that scenario.

1 - Alice's group
12 - Mary's group
123 - John Cena's group
and so on

This allows you to "group by q1.turn" and sum the q2.weights so you can determine if they are 1000 or less lbs.

Then you order it by DESC and LIMIT 1 because you want the single (LIMIT 1) boarding group with the most weight under 1000 (DESC = highest first)

*/
