-- reference website:-https://www.freecodecamp.org/news/window-functions-in-sql/

DROP TABLE IF EXISTS student_score;

CREATE TABLE student_score (
  student_id SERIAL PRIMARY KEY,
  student_name VARCHAR(30),
  dep_name VARCHAR(40),
  score INT
);

INSERT INTO student_score VALUES (11, 'Ibrahim', 'Computer Science', 80);
INSERT INTO student_score VALUES (7, 'Taiwo', 'Microbiology', 76);
INSERT INTO student_score VALUES (9, 'Nurain', 'Biochemistry', 80);
INSERT INTO student_score VALUES (8, 'Joel', 'Computer Science', 90);
INSERT INTO student_score VALUES (10, 'Mustapha', 'Industrial Chemistry', 78);
INSERT INTO student_score VALUES (5, 'Muritadoh', 'Biochemistry', 85);
INSERT INTO student_score VALUES (2, 'Yusuf', 'Biochemistry', 70);
INSERT INTO student_score VALUES (3, 'Habeebah', 'Microbiology', 80);
INSERT INTO student_score VALUES (1, 'Tomiwa', 'Microbiology', 65);
INSERT INTO student_score VALUES (4, 'Gbadebo', 'Computer Science', 80);
INSERT INTO student_score VALUES (12, 'Tolu', 'Computer Science', 67);

use student_score;

select * from student_score;

SELECT 
    *,
    MAX(score) OVER() AS maximum_score,
    MIN(score) OVER() AS minimum_score

FROM student_score;

SELECT *,
    (SELECT MAX(score) FROM student_score) AS maximum_score,
    (SELECT MIN(score) FROM student_score) AS minimum_score
FROM student_score;

SELECT 
    *,
    MAX(score)OVER(PARTITION BY dep_name) AS dep_maximum_score,
    ROUND(AVG(score)OVER(PARTITION BY dep_name), 2) AS dep_average_score
FROM student_score;


SELECT
    *,
    ROW_NUMBER() OVER(ORDER BY student_name) AS name_serial_number
FROM student_score;

SELECT
    *,
    RANK()OVER(PARTITION BY dep_name ORDER BY score DESC) as dep_name_rank 
FROM student_score;


SELECT
    *,
    DENSE_RANK()OVER(PARTITION BY dep_name ORDER BY score DESC) as dep_name_rank
FROM student_score;


SELECT
    *,
    LAG(score) OVER(PARTITION BY dep_name ORDER BY score)    
FROM student_score;


SELECT
    *,
    SUM(score)OVER(ORDER BY student_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cummulative_sum
FROM student_score;

SELECT
    *,
    SUM(score)OVER(ORDER BY student_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cummulative_sum
FROM student_score

