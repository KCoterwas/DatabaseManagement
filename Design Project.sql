--Kim Coterwas
--Sunnyside Daycare Database Project
--Pablo Rivas

--Create Tables (People)
CREATE TABLE People(​
Pid CHAR(3) NOT NULL UNIQUE,​
FirstName TEXT NOT NULL,​
LastName TEXT NOT NULL,​
DateOfBirth DATE NOT NULL,​
StreetAdress TEXT NOT NULL,​
PRIMARY KEY (pid)​
);​

--Create Tables (Children)
CREATE TABLE Children( ​
cid CHAR(3) NOT NULL UNIQUE, ​
gid CHAR(3) NOT NULL REFERENCES Guardians(gid), ​
Age INTEGER NOT NULL, ​
heightInches INTEGER NOT NULL, ​
weightLbs NUMERIC(4,1) NOT NULL, ​
hairColor TEXT DEFAULT 'None', ​
Gender TEXT NOT NULL, ​
Allergies TEXT DEFAULT 'None', ​
PRIMARY KEY(cid) ​
); ​

--Create Tables (JobRoles)
CREATE TABLE JobRoles ( ​
  jid CHAR(3) NOT NULL UNIQUE, ​
  Title TEXT NOT NULL,​
  salaryUSD NUMERIC(6,2), ​
PRIMARY KEY(jid) ​
); ​

--Create Tables (Staff)
CREATE TABLE Staff (​
 sid CHAR(3) NOT NULL UNIQUE,​
 jid CHAR(3) NOT NULL REFERENCES JobRoles(jid),​
 aid CHAR(3) REFERENCES Activities(aid),
 dateEmployed DATE NOT NULL,​
 dateUnemployed DATE,​
PRIMARY KEY(sid)​
);

--Create Tables (Hours)
CREATE TABLE Hours (​
  Pid CHAR(3) NOT NULL UNIQUE REFERENCES People(pid),​
  lengthOfStay INTEGER,​
  PickupTime TIME,​
  PRIMARY KEY(hid)​
);

--Create Tables (Activities)
CREATE TABLE Activities (​
 aid CHAR(3) NOT NULL UNIQUE,​
 Subject TEXT,​
 Skill TEXT,​
PRIMARY KEY(aid)​
);

--Create Tables (Guardians)
CREATE TABLE Guardians (​
  gid CHAR(3) NOT NULL UNIQUE,​
  phoneNumber TEXT,​
PRIMARY KEY(gid)​
);

--Insert Statements (People)
INSERT INTO People (pid, firstname, lastname,DateOfBirth, streetAddress)
VALUES (101, 'Samuel', 'Hampton', '1972-12-12', '958 Viginia Avenue');

INSERT INTO People (pid, firstname, lastname,DateOfBirth, streetAddress)
VALUES (102, 'Juliana', 'Paternoster', '1970-11-27', '219 4th Street');

INSERT INTO People (pid, firstname, lastname,DateOfBirth, streetAddress)
VALUES (103, 'Diane', 'York', '1972-10-29', '733 Winding Way');

INSERT INTO People (pid, firstname, lastname,DateOfBirth, streetAddress)
VALUES (104, 'Amanda', 'Mingo', '1989-7-27', '29 Charles Street ');

INSERT INTO People (pid, firstname, lastname,DateOfBirth, streetAddress)
VALUES (105, 'Erica', 'Bunker', '1985-9-4', '898 Main Street');

INSERT INTO People (pid, firstname, lastname,DateOfBirth, streetAddress)
VALUES (106, 'Peyton', 'Randall', '1972-2-3', '506 Vine Street');

INSERT INTO People (pid, firstname, lastname,DateOfBirth, streetAddress)
VALUES (567, 'Lauryn', 'Scarsi', '2014-3-18', '252 George Street ');

INSERT INTO People (pid, firstname, lastname,DateOfBirth, streetAddress)
VALUES (568, 'Bridgette', 'Brennan', '2008-1-1', '583 Maple Lane');

INSERT INTO People (pid, firstname, lastname,DateOfBirth, streetAddress)
VALUES (569, 'Conor', 'Brennan', '2010-9-15', '583 Maple Lane');

INSERT INTO People (pid, firstname, lastname,DateOfBirth, streetAddress)
VALUES (570, 'Irene', 'Vann', '2005-7-23', '493 James Street');

INSERT INTO People (pid, firstname, lastname,DateOfBirth, streetAddress)
VALUES (571, 'Walt', 'Amoretto', '2005-5-25', '591 Cedar Court');

INSERT INTO People (pid, firstname, lastname,DateOfBirth, streetAddress)
VALUES (572, 'Evan', 'Shaw', '2012-11-10', '143 Woodland Avenue');

INSERT INTO People (pid, firstname, lastname,DateOfBirth, streetAddress)
VALUES (573, 'Alexandrea', 'Shaw', '2007-6-26', '143 Woodland Avenue');

INSERT INTO People (pid, firstname, lastname,DateOfBirth, streetAddress)
VALUES (222, 'Macey', 'Brennan', '1954-8-20', '583 Maple Lane');

INSERT INTO People (pid, firstname, lastname,DateOfBirth, streetAddress)
VALUES (223, 'Piper', 'Scarsi', '1960-3-26', '252 George Street ');

INSERT INTO People (pid, firstname, lastname,DateOfBirth, streetAddress)
VALUES (224, 'Isaac', 'Amoretto', '1960-5-4', '591 Cedar Court');

INSERT INTO People (pid, firstname, lastname,DateOfBirth, streetAddress)
VALUES (225, 'Sabrina', 'Vann', '1961-2-8', '493 James Street');

INSERT INTO People (pid, firstname, lastname,DateOfBirth, streetAddress)
VALUES (226, 'Paul', 'Shaw', '1986-11-17', '143 Woodland Avenue');

--Insert Statements (Children)
INSERT INTO Children (cid, gid, age, heightInches, weightLbs, hairColor, gender)
VALUES (567, 223, 2, 31, 28.9, 'Brown', 'Female');

INSERT INTO Children (cid, gid, age, heightInches, weightLbs, hairColor, gender)
VALUES (568, 222, 8, 45, 55.8, 'Blonde', 'Female');

INSERT INTO Children (cid, gid, age, heightInches, weightLbs, hairColor, gender, allergies)
VALUES (569, 222, 5, 40, 41.8, 'Brown', 'Male', 'Nuts');

INSERT INTO Children (cid, gid, age, heightInches, weightLbs, hairColor, gender, allergies)
VALUES (570, 225, 11, 52, 78.3, 'Black', 'Female', 'Nuts');

INSERT INTO Children (cid, gid, age, heightInches, weightLbs, hairColor, gender)
VALUES (571, 224, 11, 55, 77, 'Black', 'Male');

INSERT INTO Children (cid, gid, age, heightInches, weightLbs, hairColor, gender)
VALUES (572, 226, 4, 37, 36, 'Red', 'Male');

INSERT INTO Children (cid, gid, age, heightInches, weightLbs, hairColor, gender, allergies)
VALUES (573, 226, 9, 49, 62.4, 'Brown', 'Female', 'Lactose Intolerant');

--Insert Statements (JobRoles)
INSERT INTO JobRoles (jid, title, salaryusd)
VALUES (734, 'Manager', 30000);

INSERT INTO JobRoles (jid, title, salaryusd)
VALUES (735, 'Caretaker', 23000);

INSERT INTO JobRoles (jid, title, salaryusd)
VALUES (736, 'Janitor', 15000);

--Insert Statements (Staff)
INSERT INTO Staff (sid, jid, dateEmployed)
VALUES (101, 734, '2005-10-29');

INSERT INTO Staff (sid, jid, dateEmployed, dateUnemployed)
VALUES (102, 736, '2009-2-4');

INSERT INTO Staff (sid, jid, dateEmployed)
VALUES (103, 736, '2013-7-12');

INSERT INTO Staff (sid, jid, aid, dateEmployed, dateUnemployed)
VALUES (104, 735, 455, '2008-6-13');

INSERT INTO Staff (sid, jid, aid, dateEmployed)
VALUES (105, 735, 457, '2009-3-14');

INSERT INTO Staff (sid, jid, aid, dateEmployed)
VALUES (106, 735, 456, '2016-4-17');

--Insert Statements (Hours)
INSERT INTO Hours (pid, lengthOfStay, pickuptime​)
VALUES (567, 8, '4:30');

INSERT INTO Hours (pid, lengthOfStay, pickuptime​)
VALUES (568, 7, '5:00');

INSERT INTO Hours (pid, lengthOfStay, pickuptime​)
VALUES (569, 7, '5:00');

INSERT INTO Hours (pid, lengthOfStay, pickuptime​)
VALUES (570, 5, '2:30');

INSERT INTO Hours (pid, lengthOfStay, pickuptime​)
VALUES (571, 6, '3:00');

INSERT INTO Hours (pid, lengthOfStay, pickuptime​)
VALUES (572, 7, '4:00');

INSERT INTO Hours (pid, lengthOfStay, pickuptime​)
VALUES (573, 7, '4:00');

--Insert Statements (Activities)
INSERT INTO Activities (aid, subject, skill)
VALUES (455, 'Math', 'Critical Thinking');

INSERT INTO Activities (aid, subject, skill)
VALUES (456, 'English', 'Writing');

INSERT INTO Activities (aid, subject, skill)
VALUES (457, 'Science', 'Analysis');

--Insert Statements (Guardians)
INSERT INTO Guardians (gid, phoneNumber)
VALUES (222, '1234567890');

INSERT INTO Guardians (gid, phoneNumber)
VALUES (223, '0987654321');

INSERT INTO Guardians (gid, phoneNumber)
VALUES (224, '5678901234');

INSERT INTO Guardians (gid, phoneNumber)
VALUES (225, '8901234567');

INSERT INTO Guardians (gid, phoneNumber)
VALUES (226, '3456789012');

--Views (ChildrenInfo)
CREATE OR REPLACE VIEW ChildrenInfo​
SELECT p.firstname AS ChildFName, p.lastname AS ChildLName, h.lengthofstay AS billedHours, h.pickuptime​
FROM People p​
RIGHT OUTER JOIN Children c ON p.pid = c.cid​
RIGHT OUTER JOIN Hours h ON p.pid = h.pid​

--Views (StaffJobs)
CREATE OR REPLACE VIEW StaffJobs AS​
SELECT firstname, lastname, title, salaryUSD​
FROM JobRoles ​
INNER JOIN staff ON JobRoles.jid = staff.jid​
INNER JOIN people on people.pid = staff.sid;​


--Reports (Children 8 and Under)
(SELECT x.number / y.number
FROM
(
SELECT (CAST(count(cid) AS NUMERIC(5,2))) as number
FROM Children
WHERE Age <= 8
)  x
JOIN
(
SELECT (CAST(count(cid) AS NUMERIC(5,2))) as Number
FROM Children
) y ON 1=1) 

--Reports (Staff that are Caretakers)
(SELECT x.number / y.number
FROM
(
SELECT (CAST(count(sid) AS NUMERIC(5,2))) as number
FROM Staff
WHERE jid = '735'
)  x
JOIN
(
SELECT (CAST(count(sid) AS NUMERIC(5,2))) as Number
FROM Staff
) y ON 1=1) 

--Stored Procedures (addStaff)
CREATE OR REPLACE FUNCTION addStaff(CHAR(3), CHAR(3), CHAR(3), DATE, DATE) RETURNS refcursor AS
$$
DECLARE
 vsid            CHAR(3)      :=$1;
 vjid            CHAR(3)      :=$2;
 vaid            CHAR(3)      :=$3;
 vdateEmployed   DATE         :=$4;
 vdateUnemployed DATE         :=$5;
 resultset       REFCURSOR    :=NULL;
BEGIN
 INSERT INTO Staff(sid, jid, aid, dateEmployed, dateUnemployed)
 VALUES (vsid, vjid, vaid, vdateEmployed, vdateUnemployed);

 RETURN resultset;
END;
$$
LANGUAGE plpgsql;

SELECT addStaff(107,735,457,'2007-2-30','2013-8-19', 'results'); ​
FETCH ALL FROM results;

--Stored Procedures (getChildrenByAge)
CREATE OR REPLACE FUNCTION getChildrenByAge(Int, REFCURSOR) RETURNS refcursor AS
$$
DECLARE
 ChildAge       Int      :=$1;
 resultset       REFCURSOR    :=2;
BEGIN
 open resultset FOR
   SELECT count(age)
   FROM children
   WHERE age IN (ChildAge);
 RETURN resultset;
END;
$$
LANGUAGE plpgsql;

SELECT getChildrenByAge(2, 'results');
FETCH ALL FROM results;

--Trigger (changePay)
CREATE TRIGGER changePay
AFTER UPDATE ON JobRoles
FOR EACH ROW EXECUTE PROCEDURE addStaff();