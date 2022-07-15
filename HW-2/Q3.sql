-- Queries performed on https://livesql.oracle.com/

-- Also considered the case where a project has only step 0


CREATE TABLE PROJECT( 
    PID CHAR(5) NOT NULL, 
    Step INTEGER NOT NULL, 
    Status CHAR NOT NULL,
    PRIMARY KEY (PID,Step));

INSERT INTO PROJECT VALUES ('P100',0,'C');
INSERT INTO PROJECT VALUES ('P100',1,'W');
INSERT INTO PROJECT VALUES ('P100',2,'W');
INSERT INTO PROJECT VALUES ('P201',0,'C');
INSERT INTO PROJECT VALUES ('P201',1,'C');
INSERT INTO PROJECT VALUES ('P333',0,'W');
INSERT INTO PROJECT VALUES ('P333',1,'W');
INSERT INTO PROJECT VALUES ('P333',2,'W');
INSERT INTO PROJECT VALUES ('P333',3,'W');
-- INSERT INTO PROJECT VALUES ('P101',0,'C');
-- INSERT INTO PROJECT VALUES ('P102',0,'W');

-- One step project Case: Last insert is the case where their is a project with only Step 0 available and it is completed. 
-- Uncomment the last two insert operations and run the query below to see that it will also be included in our desired output.


SELECT DISTINCT PID
FROM PROJECT
WHERE (Step = 0 AND Status = 'C' AND PID IN (SELECT PID FROM PROJECT WHERE Step=1 and Status='W')) -- To include the regular case
OR (Step = 0 AND Status = 'C' AND PID NOT IN (SELECT PID FROM PROJECT WHERE Step=1)); 
-- To include the one step project case