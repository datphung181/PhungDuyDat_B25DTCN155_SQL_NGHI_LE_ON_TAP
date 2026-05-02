USE EDU_PRO;

SELECT t.full_name AS teacher_name, COUNT(c.id) AS total_courses
FROM teachers t
LEFT JOIN courses c ON t.id = c.teacher_id
GROUP BY t.id, t.full_name;


SELECT c.course_name, AVG(e.score) AS avg_score
FROM courses c
JOIN enrollments e ON c.id = e.course_id
WHERE e.score IS NOT NULL
GROUP BY c.id, c.course_name
HAVING AVG(e.score) < 5.0;


SELECT c.course_name, COUNT(e.id) * c.tuition_fee AS total_revenue
FROM courses c
LEFT JOIN enrollments e ON c.id = e.course_id
GROUP BY c.id, c.course_name, c.tuition_fee;


SELECT s.full_name, COUNT(e.course_id) AS total_courses
FROM students s
JOIN enrollments e ON s.id = e.student_id
GROUP BY s.id, s.full_name
HAVING COUNT(e.course_id) >= 3;
