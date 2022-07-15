-- Queries performed on https://livesql.oracle.com/

-- Created a Teaching and a Subjects table(for the subjects that need to be checked)

CREATE TABLE TEACHING(
    Instructor CHAR(13) NOT NULL,
    Subject CHAR(15) NOT NULL,
    PRIMARY KEY (Instructor, Subject));  

INSERT INTO TEACHING VALUES ('Aleph', 'Scratch');        
INSERT INTO TEACHING VALUES ('Aleph', 'Java');         
INSERT INTO TEACHING VALUES ('Aleph', 'Processing');       
INSERT INTO TEACHING VALUES ('Bit', 'Python');
INSERT INTO TEACHING VALUES ('Bit', 'Javascript');
INSERT INTO TEACHING VALUES ('Bit', 'Java');
INSERT INTO TEACHING VALUES ('CRC', 'Python');
INSERT INTO TEACHING VALUES ('CRC', 'Javascript');
INSERT INTO TEACHING VALUES ('Dat', 'Scratch');
INSERT INTO TEACHING VALUES ('Dat', 'Python');
INSERT INTO TEACHING VALUES ('Dat', 'Javascript');
INSERT INTO TEACHING VALUES ('Emscr', 'Scratch');
INSERT INTO TEACHING VALUES ('Emscr', 'Processing');
INSERT INTO TEACHING VALUES ('Emscr', 'Javascript');
INSERT INTO TEACHING VALUES ('Emscr', 'Python');

-- I have only used one table and used multiple subqueries 
-- with IN keyword to check if the instructor teaches those three languages.

SELECT DISTINCT Instructor
FROM TEACHING
WHERE Instructor IN (SELECT Instructor FROM TEACHING WHERE Subject='Python')
AND Instructor IN (SELECT Instructor FROM TEACHING WHERE Subject='Javascript')
AND Instructor IN (SELECT Instructor FROM TEACHING WHERE Subject='Scratch');