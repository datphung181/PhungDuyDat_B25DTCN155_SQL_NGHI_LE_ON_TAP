USE EDU_PRO;

SELECT * FROM students
WHERE date_of_birth > (
    SELECT date_of_birth
    FROM students
    WHERE id = 'SV001'
);

SELECT s.id AS student_id, s.full_name, e.score
FROM enrollments e
JOIN students s ON e.student_id = s.id
JOIN courses c ON e.course_id = c.id
WHERE c.course_name = 'Database' -- do data cua em ko co mon hoc do nen em thay ten mon khac vao a
AND e.score = (
    SELECT MAX(e2.score)
    FROM enrollments e2
    JOIN courses c2 ON e2.course_id = c2.id
    WHERE c2.course_name = 'Database'
);

SELECT s.* FROM students s
LEFT JOIN enrollments e ON s.id = e.student_id
WHERE e.id IS NULL;

DELETE FROM enrollments
WHERE course_id = (
    SELECT id FROM courses WHERE course_name = 'AI Intro'
);
DELETE FROM courses
WHERE course_name = 'AI Intro';	