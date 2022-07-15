-- Queries performed on https://livesql.oracle.com/


CREATE TABLE ENROLLMENT ( 
    SID INTEGER NOT NULL, 
    ClassName CHAR(30) NOT NULL, 
    Grade CHAR,
    PRIMARY KEY (SID, ClassName));

INSERT INTO ENROLLMENT VALUES (123, 'Processing', 'A');
INSERT INTO ENROLLMENT VALUES (123, 'Python', 'B');
INSERT INTO ENROLLMENT VALUES (123, 'Scratch', 'B');
INSERT INTO ENROLLMENT VALUES (662, 'Java', 'B');
INSERT INTO ENROLLMENT VALUES (662, 'Python', 'A');
INSERT INTO ENROLLMENT VALUES (662, 'Javascript', 'A');
INSERT INTO ENROLLMENT VALUES (662, 'Scratch', 'B');
INSERT INTO ENROLLMENT VALUES (345, 'Scratch', 'A');
INSERT INTO ENROLLMENT VALUES (345, 'Javascript', 'B');
INSERT INTO ENROLLMENT VALUES (345, 'Python', 'A');
INSERT INTO ENROLLMENT VALUES (555, 'Python', 'B');
INSERT INTO ENROLLMENT VALUES (555, 'Javascript', 'B');
INSERT INTO ENROLLMENT VALUES (213, 'Javascript', 'A');


-- Query for the desired listing/output using group by and order by. 

SELECT ClassName, COUNT(*) AS Total
FROM ENROLLMENT
GROUP BY ClassName
ORDER BY Total DESC, ClassName;

-- order by total DESC orders in descending order of total count and order by ClassName orders in alphabetical order