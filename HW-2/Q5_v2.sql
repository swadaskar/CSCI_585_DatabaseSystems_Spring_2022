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

CREATE TABLE Subjects(
    Subject Char(15) NOT NULL,
    PRIMARY KEY(Subject));

INSERT INTO Subjects VALUES ('Javascript'); 
INSERT INTO Subjects VALUES ('Scratch'); 
INSERT INTO Subjects VALUES ('Python'); 

-- I have used subquery in this version to get the desired output.
-- I check in table Instructor if the instructor teaches subjects IN the subjects table 
-- (This gives us entries of instructor and subjects which are in the subjects table)
-- and then I Group by instructor where the count of the rows for that instructor 
-- equals number of subjects in the subject table(that are to be offered).
-- This gives us only the instructors who teach those three subjects.

SELECT T.Instructor
FROM TEACHING T
WHERE T.Subject IN (SELECT subject FROM Subjects)
GROUP BY T.Instructor
HAVING COUNT(*) = (SELECT COUNT(*) FROM Subjects);