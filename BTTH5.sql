USE EDU_PRO;

SELECT c.course_name, t.full_name AS teacher_name
FROM courses c
LEFT JOIN teachers t 
ON c.teacher_id = t.id;

SELECT * FROM students
WHERE date_of_birth BETWEEN '2005-01-01' AND '2005-12-31';


SELECT s.id AS student_id, s.full_name, e.score
FROM enrollments e
JOIN students s ON e.student_id = s.id
JOIN courses c ON e.course_id = c.id
WHERE c.course_name = 'Web Development'
ORDER BY e.score DESC;

SELECT s.full_name AS student_name, c.course_name, t.full_name AS teacher_name
FROM enrollments e
JOIN students s ON e.student_id = s.id
JOIN courses c ON e.course_id = c.id
LEFT JOIN teachers t ON c.teacher_id = t.id;

