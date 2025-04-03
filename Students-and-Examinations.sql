-- Write your PostgreSQL query statement below
select s.student_id,
       s.student_name ,
       s1.subject_name,
       COUNT(e.student_id) AS attended_exams
from students s 
cross join subjects s1
left join examinations e on 
s1.subject_name = e.subject_name and 
s.student_id = e.student_id
group by 1,2,3  
order by 1,3 ;
