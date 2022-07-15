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

-- I have used JOIN to get the desired output. 
-- I join table Instructor and table Subjects and then 
-- Group by instructor where the count of the rows for that instructor 
-- equals number of subjects in the subject table(that are to be offered).

SELECT Instructor
FROM TEACHING join Subjects
on TEACHING.subject=Subjects.subject
GROUP BY Instructor
HAVING COUNT(*) = (SELECT COUNT(*) FROM Subjects)