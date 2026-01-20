-- Create Database
CREATE DATABASE college_db;
USE college_db;

-- Departments Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    gender ENUM('Male','Female','Other'),
    dob DATE,
    department_id INT,
    CONSTRAINT fk_student_department
        FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
        ON DELETE SET NULL
);

-- Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    department_id INT,
    credits INT CHECK (credits > 0),
    CONSTRAINT fk_course_department
        FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
        ON DELETE CASCADE
);

-- Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    CONSTRAINT fk_enroll_student
        FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_enroll_course
        FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
        ON DELETE CASCADE,
    UNIQUE (student_id, course_id)
);

-- Marks Table
CREATE TABLE Marks (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    marks_obtained INT CHECK (marks_obtained BETWEEN 0 AND 100),
    CONSTRAINT fk_marks_student
        FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_marks_course
        FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
        ON DELETE CASCADE,
    UNIQUE (student_id, course_id)
);
INSERT INTO Departments (department_name) VALUES
('Cs'),
('It'),
('c'),
('cpp'),
('python');
INSERT INTO Students (name,email,gender,dob,department_id) VALUES
('Ashish','ashish@gmail.com','Male','2002-01-10',1),
('Neha','neha@gmail.com','Female','2001-05-12',2),
('Om','om@gmail.com','Male','2002-03-15',1),
('Pooja','pooja@gmail.com','Female','2001-07-18',3),
('Amol','amol@gmail.com','Male','2000-11-20',4),
('Sneha','sneha@gmail.com','Female','2002-09-25',2),
('Akram','akram@gmail.com','Male','2001-02-14',1),
('Anita','anita@gmail.com','Female','2000-06-30',5),
('Pavan','pavan@gmail.com','Male','2002-08-08',3),
('Meena','meena@gmail.com','Female','2001-12-01',4);
INSERT INTO Courses (course_name,department_id,credits) VALUES
('DBMS',1,4),
('OS',1,3),
('C',2,3),
('Java',1,4),
('oop1',3,3),
('oop2',4,4),
('cpp',5,3),
('Wt',2,4);
INSERT INTO Enrollments (student_id,course_id,enrollment_date) VALUES
(1,1,'2024-01-01'),
(1,2,'2024-01-02'),
(2,3,'2024-01-03'),
(3,1,'2024-01-04'),
(3,4,'2024-01-05'),
(4,5,'2024-01-06'),
(5,6,'2024-01-07'),
(6,3,'2024-01-08'),
(6,8,'2024-01-09'),
(7,1,'2024-01-10'),
(7,2,'2024-01-11'),
(8,7,'2024-01-12'),
(9,5,'2024-01-13'),
(10,6,'2024-01-14'),
(10,2,'2024-01-15');
INSERT INTO Marks (student_id,course_id,marks_obtained) VALUES
(1,1,85),
(1,2,78),
(2,3,69),
(3,1,88),
(3,4,92),
(4,5,74),
(5,6,81),
(6,3,90),
(6,8,76),
(7,1,65),
(7,2,72),
(8,7,80),
(9,5,67),
(10,6,89),
(10,2,95);
SELECT * FROM Students;
SELECT s.*
FROM Students s
JOIN Departments d ON s.department_id = d.department_id
WHERE d.department_name = 'Cs';
SELECT c.course_name, d.department_name
FROM Courses c
JOIN Departments d ON c.department_id = d.department_id;
SELECT student_id
FROM Enrollments
GROUP BY student_id
HAVING COUNT(course_id) > 1;
SELECT s.name, m.marks_obtained
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
WHERE m.marks_obtained > 75;
SELECT s.name, c.course_name, m.marks_obtained
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
JOIN Courses c ON m.course_id = c.course_id;

SELECT s.name
FROM Students s
LEFT JOIN Marks m ON s.student_id = m.student_id
WHERE m.mark_id IS NULL;
SELECT d.department_name, COUNT(s.student_id) AS student_count
FROM Departments d
LEFT JOIN Students s ON d.department_id = s.department_id
GROUP BY d.department_name;
SELECT c.course_name, AVG(m.marks_obtained) AS average_marks
FROM Courses c
JOIN Marks m ON c.course_id = m.course_id
GROUP BY c.course_name;
