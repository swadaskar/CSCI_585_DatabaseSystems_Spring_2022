-- Queries performed on https://livesql.oracle.com/

-- I have used the check constraint for the first issue and a trigger for the second issue

CREATE TABLE ProjectRoomBookings
(roomNum INTEGER NOT NULL,
startTime INTEGER NOT NULL,
endTime INTEGER NOT NULL,
groupName CHAR(10) NOT NULL,
PRIMARY KEY (roomNum, startTime),
-- Start time and end time constraints
CONSTRAINT check_startTime_hours CHECK (startTime>=7 AND startTime<=17),
CONSTRAINT check_endTime_hours CHECK (endTime>=8 AND endTime<=18),
-- Case 1: maintain that endtime is after starttime
CONSTRAINT check_endTime_After_startTime CHECK (startTime<endTime));



-- Case 2: Following trigger checks if room is occupied at that slot at each insert operation
CREATE OR REPLACE TRIGGER is_room_available
BEFORE INSERT OR UPDATE ON ProjectRoomBookings
FOR EACH ROW
DECLARE
room_bookings NUMBER;
BEGIN
SELECT COUNT(*) INTO room_bookings
FROM ProjectRoomBookings
WHERE :NEW.roomNum=roomNum AND :NEW.startTime<endTime AND :NEW.endTime>startTime;
IF room_bookings!=0
THEN
  RAISE_APPLICATION_ERROR(-20990, 'Room unavailable during this slot');
END IF;
END;
/


INSERT INTO ProjectRoomBookings VALUES (101, 10, 12, 'A');
INSERT INTO ProjectRoomBookings VALUES (101, 13, 15, 'B');
INSERT INTO ProjectRoomBookings VALUES (101, 7, 6, 'B');
INSERT INTO ProjectRoomBookings VALUES (101, 11, 15, 'B');
INSERT INTO ProjectRoomBookings VALUES (101, 10, 13, 'C');
INSERT INTO ProjectRoomBookings VALUES (201, 7, 10, 'E');
INSERT INTO ProjectRoomBookings VALUES (201, 10, 12, 'E');

SELECT * FROM ProjectRoomBookings;