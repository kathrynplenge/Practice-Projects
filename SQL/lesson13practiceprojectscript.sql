-- School ranking analysis -- 


-- create students table --
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS marksheet;

CREATE TABLE students (
    s_id          INT          NOT NULL,
    s_fname       VARCHAR(50)  NOT NULL,
    s_lname       VARCHAR(50)  NOT NULL,
    student_class INT          NOT NULL,
    age           INT          NOT NULL,
    PRIMARY KEY (s_id)
);

-- create table --

CREATE TABLE marksheet (
    score   INT,
    year    INT,
    ranking INT,
    class   INT,
    s_id    INT
);

-- insert values --

INSERT INTO students (s_id, s_fname, s_lname, student_class, age) VALUES
    (1,  'krishna', 'gee',     10, 18),
    (2,  'Stephen', 'Christ',  10, 17),
    (3,  'Kailash', 'kumar',   10, 18),
    (4,  'ashish',  'jain',    10, 16),
    (5,  'khusbu',  'jain',    10, 17),
    (6,  'madhan',  'lal',     10, 16),
    (7,  'saurab',  'kothari', 10, 15),
    (8,  'vinesh',  'roy',     10, 14),
    (9,  'rishika', 'r',       10, 15),
    (10, 'sara',    'rayan',   10, 16),
    (11, 'rosy',    'kumar',   10, 16);

INSERT INTO marksheet (score, year, ranking, class, s_id) VALUES
    (989, 2014, 1,  10, 1),
    (454, 2014, 10, 10, 2),
    (880, 2014, 4,  10, 3),
    (870, 2014, 5,  10, 4),
    (720, 2014, 7,  10, 5),
    (670, 2014, 8,  10, 6),
    (900, 2014, 3,  10, 7),
    (540, 2014, 9,  10, 8),
    (801, 2014, 6,  10, 9),
    (420, 2014, 11, 10, 10),
    (970, 2014, 2,  10, 11),
    (720, 2014, 12, 10, 12);

-- student ID and first name of students aged >= 16 whose last name is Kumar --

SELECT s_id, s_fname
FROM students
WHERE age >= 16
  AND LOWER(s_lname) = 'kumar';   


-- marksheet details where score is between 800 and 1000 --

SELECT *
FROM marksheet
WHERE score BETWEEN 800 AND 1000;

-- increase score by 5 and show it in a new column --

SELECT *, score + 5 AS new_score
FROM marksheet;

-- marksheet in descending order of score --

SELECT *
FROM marksheet
ORDER BY score DESC;


-- details of every student whose first name starts with 'a' --

SELECT *
FROM students
WHERE s_fname LIKE 'a%';






