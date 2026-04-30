CREATE DATABASE EDU_PRO;
USE EDU_PRO;

CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) NOT NULL
);

CREATE TABLE courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    teacher_id INT,
    credits INT CHECK (credits > 0),
    tuition_fee DECIMAL(10,2),
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other')
);

CREATE TABLE enrollments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    date DATE,
    score DECIMAL(4,2),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

INSERT INTO teachers (full_name, salary) VALUES
('Nguyen Van A', 1000),
('Tran Thi B', 1200),
('Le Van C', 1500);

INSERT INTO courses (course_name, teacher_id, credits, tuition_fee) VALUES
('IT Basic', 1, 3, 500),
('Advanced IT', 1, 4, 800),
('Database', 2, 3, 600),
('Web Development', 2, 4, 900),
('AI Intro', 3, 5, 1200),
('Soft Skills', NULL, 2, 300);

INSERT INTO students (full_name, date_of_birth, gender) VALUES
('Student 1', '2005-01-01', 'Male'),
('Student 2', '2005-02-02', 'Female'),
('Student 3', '2005-03-03', 'Male'),
('Student 4', '2005-04-04', 'Female'),
('Student 5', '2005-05-05', 'Male'),
('Student 6', '2005-06-06', 'Female'),
('Student 7', '2005-07-07', 'Male'),
('Student 8', '2005-08-08', 'Female'),
('Student 9', '2005-09-09', 'Male'),
('Student 10', '2005-10-10', 'Female');

INSERT INTO enrollments (student_id, course_id, date, score) VALUES
(1,1,'2026-04-01',8.5),
(2,1,'2026-04-01',7.0),
(3,2,'2026-04-02',9.0),
(4,2,'2026-04-02',6.5),
(5,3,'2026-04-03',8.0),
(6,3,'2026-04-03',7.5),
(7,4,'2026-04-04',9.5),
(8,4,'2026-04-04',NULL),
(9,5,'2026-04-05',8.7),
(10,5,'2026-04-05',NULL),
(1,6,'2026-04-06',7.2),
(2,6,'2026-04-06',6.8),
(3,1,'2026-04-07',8.9),
(4,2,'2026-04-07',7.7),
(5,3,'2026-04-07',9.1);

UPDATE teachers
SET salary = salary * 1.1
WHERE id IN (
    SELECT DISTINCT teacher_id
    FROM courses
    WHERE course_name LIKE '%IT%'
);

