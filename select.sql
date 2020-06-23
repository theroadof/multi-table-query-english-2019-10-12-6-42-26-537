# 1.Query the existence of 1 course
select * from course where id = 1;

# 2.Query the presence of both 1 and 2 courses
select * from course where id = 1 or id =2;

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select student.id,student.name,avg(score) as avg_score
from student left join student_course on student.id = student_course.studentId
group by id,name having avg_score >=60;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student left join student_course on student.id = student_course.studentId
where student_course.score is null;

# 5.Query all SQL with grades
select score from student_course;

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select id,name,age,sex 
from student join student_course on student.id = student_course.studentId
where student_course.courseId = 2 and student.id =1;

# 7.Retrieve 1 student score with less than 60 scores in descending order
select * from student join student_course on student.id = student_course.studentId
where student_course.score<60
order by student_course.score desc;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select courseId,name,avg(score) as avg_score
from student_course left join course on student_course.courseId = course.id
group by courseId,name
order by avg_score desc,courseId asc;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select student.name,score
from student,student_course,course
where student.id = student_course.studentId and course.id = student_course.courseId and course.name = 'math' and score<60;
