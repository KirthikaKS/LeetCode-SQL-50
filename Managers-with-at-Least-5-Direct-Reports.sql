# Write your MySQL query statement below
-- Write your PostgreSQL query statement below


select name
from employee
where id IN (select a.id
from employee a join employee b 
on a.id = b.managerId 
group by a.id
having count(b.managerId) >= 5);