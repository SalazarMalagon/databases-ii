CREATE TABLE, IF NOT EXISTS test_school.student (
    code INT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
);

CREATE TABLE, IF NOT EXISTS test_school.course (
    code INT PRIMARY KEY,
    name VARCHAR(40) NOT NULL UNIQUE,
    credits INT DEFAULT 1 NOT NULL,
);

CREATE TABLE, IF NOT EXISTS test_school.grade (
    id SERIAL PRIMARY KEY,
    value DECIMAL DEFAULT 0.0,
    course_fk INT,
    student_fk INT,
    FOREIGN KEY (course_fk) REFERENCES course(code),
    FOREIGN KEY (student_fk) REFERENCES student(code),
);

INSERT INTO test_school.student (code, name) VALUES (233, 'Pepita');
INSERT INTO test_school.student (code, name) VALUES (345, 'Pepito');
INSERT INTO test_school.student (code, name) VALUES (987, 'Susanita');

SELECT * FROM test_school.student;

INSERT INTO test_school.course (code, name, credits) VALUES (2, 'Base de Datos', 3);
INSERT INTO test_school.course (code, name, credits) VALUES (1, 'Ciencias de la Computación', 1);
INSERT INTO test_school.course (code, name, credits) VALUES (4, 'Inteligencia Artificial', 4);

SELECT * FROM test_school.course;

INSERT INTO test_school.grade (value, student_fk, course_fk) VALUES (3.5, 233, 1);
INSERT INTO test_school.grade (value, student_fk, course_fk) VALUES (4.5, 233, 4);
INSERT INTO test_school.grade (value, student_fk, course_fk) VALUES (3.5, 345, 2);
INSERT INTO test_school.grade (value, student_fk, course_fk) VALUES (3.0, 987, 4);
INSERT INTO test_school.grade (value, student_fk, course_fk) VALUES (3.0, 987, 1);

SELECT * FROM test_school.grade;

-- All students with their coureses
SELECT student.code, student.name, 
        course.name, grade.value
FROM student
JOIN grade 
    ON grade.student_fk = student.code
JOIN course 
    ON grade.course_fk = course.code

--Average per student
SELECT student.code, student.name, 
        grade.value 
        AVG(grade.value) AS grade_average
FROM student
JOIN grade 
    ON grade.student_fk = student.code
GROUP BY student.code
ORDER BY grade_average DESC;

--HAVING AVG(grade.value) > 3.0


--Average per Course
SELECT course.code, course.name, 
        ROUND(AVG(grade.value), 1) AS grade_average
        MIN(grade.value) AS grade_min,
        MAX(grade.value) AS grade_max    
FROM course
JOIN grade 
    ON grade.course_fk = course.code
GROUP BY course.code
ORDER BY grade_average DESC;