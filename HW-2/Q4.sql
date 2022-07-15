-- Queries performed on https://livesql.oracle.com/


-- Assuming that each instructor can teach multiple classes and each class can be taught by multiple instructors. 
-- As this relates back to HW-1 where we had to draw an ERD for this same STEM tutoring business. I am
-- using the tables in my ERD, which are 1 bridge table between student and the instructor INS_STUDENT(to get student count from this)
-- and an INSTRUCTOR TABLE.


-- WE WILL GET STUDENT COUNT USING THIS BRIDGE TABLE BETWEEN STUDENT AND INSTRUCTOR
CREATE TABLE INS_STUDENT ( 
    SID INTEGER NOT NULL, 
    IID CHAR(30) NOT NULL,
    PRIMARY KEY (SID, IID));

INSERT INTO INS_STUDENT VALUES (123, 1);
INSERT INTO INS_STUDENT VALUES (123, 2);
INSERT INTO INS_STUDENT VALUES (123, 3);
INSERT INTO INS_STUDENT VALUES (662, 1);
INSERT INTO INS_STUDENT VALUES (662, 2);
INSERT INTO INS_STUDENT VALUES (662, 3);
INSERT INTO INS_STUDENT VALUES (662, 4);
INSERT INTO INS_STUDENT VALUES (345, 2);
INSERT INTO INS_STUDENT VALUES (345, 3);
INSERT INTO INS_STUDENT VALUES (345, 4);
INSERT INTO INS_STUDENT VALUES (555, 3);
INSERT INTO INS_STUDENT VALUES (555, 2);
INSERT INTO INS_STUDENT VALUES (555, 5);
INSERT INTO INS_STUDENT VALUES (213, 1);
INSERT INTO INS_STUDENT VALUES (213, 4);
INSERT INTO INS_STUDENT VALUES (213, 5);
INSERT INTO INS_STUDENT VALUES (211, 2);
INSERT INTO INS_STUDENT VALUES (340, 5);
INSERT INTO INS_STUDENT VALUES (109, 5);


CREATE TABLE INSTRUCTOR ( 
    IID INTEGER NOT NULL, 
    IFName CHAR(10) NOT NULL,
    PRIMARY KEY (IID));

INSERT INTO INSTRUCTOR VALUES (1, 'Aleph');
INSERT INTO INSTRUCTOR VALUES (2, 'Bit');
INSERT INTO INSTRUCTOR VALUES (3, 'CRC');
INSERT INTO INSTRUCTOR VALUES (4, 'Dat');
INSERT INTO INSTRUCTOR VALUES (5, 'Emscr');

-- We add an additional column to calculate bonus for each instructor.(Initially NULL)
ALTER TABLE INSTRUCTOR 
ADD Bonus INTEGER;

-- ASSUMING A $20 PER HOUR SIMILAR RATE FOR EACH INSTRUCTOR(as stated in HW-1)
-- I have used a subquery to get student count from the bridge table.
UPDATE INSTRUCTOR I
SET I.Bonus = 20*(SELECT COUNT(SID)
FROM INS_STUDENT
WHERE I.IID = IID)*0.1;

-- Query to get maximum bonus instructor(s) (As we were asked to give query for maximum bonus paid)
SELECT IID,IFName,BONUS 
FROM INSTRUCTOR
WHERE BONUS=(SELECT MAX(BONUS) FROM INSTRUCTOR);

-- Answer for the query comes out to be instructor Bit with Max Bonus of $10.