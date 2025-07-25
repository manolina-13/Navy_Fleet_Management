Consider the following database of Navy Fleet Management System. Create the following tables.

    Sailors (SailorID, Name, Address, Rank, DateOfJoining)
    Ships (ShipID, ShipName, ShipType, HomePort)
    Missions (MissionID, MissionName, StartDate, EndDate, ShipID)
    Trainings (TrainingID, TrainingName, Duration, Location)
    Equipments (EquipmentID, EquipmentName, EquipmentType, ShipID)
    MedicalRecords (MedicalRecordID, BloodType, LastCheckupDate, MedicalConditions, SailorID)
    SailorTraining (SailorID, TrainingID)
    TrainingMission (TrainingID, MissionID)
    SailorSkill (SailorID, Skill)
    MaintenanceLog (LogID, MaintenanceDate, MaintenanceDescription, TechnicianName, EquipmentID)

QUERIES:
1)Retrieve the Name and Rank of each sailor from the Sailors table.

2)Write a query to display ShipName and ShipType for ships stationed in a specified HomePort, such as "Pearl Harbor."

3)List the names of sailors (Name from Sailors) who have entries in the SailorTraining table, showing that they participated in at least one training program.

4)For a specified sailor (by SailorID), find other sailors who have the same skill(s) listed in the SailorSkill table.

5)Write a query that joins Equipments and MaintenanceLog to show each piece of equipment (EquipmentName) assigned to a ship (ShipName), along with its maintenance date (MaintenanceDate) and description (MaintenanceDescription).

6) List the names of sailors who have attended training programs associated with a specified mission. Use joins between SailorTraining, TrainingMission, and Missions to filter by MissionName.

7) Write a query to find the sailor with the earliest DateOfJoining for each ship. Display the ship’s name, sailor’s name, and years of service.

8) Retrieve names of sailors from Sailors who have entries in MedicalRecords (indicating they have a medical condition) and are also associated with high-risk missions in Missions (e.g., where the mission name contains "High Risk" or a similar term).

9) Display the sailor’s Name, Rank, years of service, and count of training programs attended. Include only sailors with at least 5 years of service. This query should use DateOfJoining to calculate years of service and count entries in SailorTraining.

10)Write a query to find the equipment in the MaintenanceLog with the highest number of maintenance entries. Display the equipment name, the number of maintenance instances, and its associated ship.

 USE TUTORIAL;

-- Table: Sailors
CREATE TABLE Sailors (
    SailorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    `Rank` VARCHAR(50),
    ShipID INT,
    DateOfJoining DATE,
    FOREIGN KEY (ShipID) REFERENCES Ships(ShipID)
);
INSERT INTO Sailors (SailorID, Name, Address, `Rank`,ShipID,DateOfJoining) VALUES
(1, 'Arjun Patel', '123 Seaside Blvd, Mumbai', 'Captain',1,'2015-06-15'),
(2, 'Priya Singh', '456 Ocean Ave, Delhi', 'Lieutenant',1, '2017-09-01'),
(3, 'Ravi Kumar', '789 Bay St, Bangalore', 'Commander',2,'2013-04-22'),
(4, 'Meera Sharma', '321 Harbor Rd, Chennai', 'Lieutenant',2, '2019-12-05'),
(5, 'Vikram Deshmukh', '654 Dockside Dr, Pune', 'Ensign',5, '2020-11-20');
SELECT * FROM Sailors;
+----------+-----------------+--------------------------+------------+--------+---------------+
| SailorID | Name            | Address                  | Rank       | ShipID | DateOfJoining |
+----------+-----------------+--------------------------+------------+--------+---------------+
|        1 | Arjun Patel     | 123 Seaside Blvd, Mumbai | Captain    |      1 | 2015-06-15    |
|        2 | Priya Singh     | 456 Ocean Ave, Delhi     | Lieutenant |      1 | 2017-09-01    |
|        3 | Ravi Kumar      | 789 Bay St, Bangalore    | Commander  |      2 | 2013-04-22    |
|        4 | Meera Sharma    | 321 Harbor Rd, Chennai   | Lieutenant |      2 | 2019-12-05    |
|        5 | Vikram Deshmukh | 654 Dockside Dr, Pune    | Ensign     |      5 | 2020-11-20    |
+----------+-----------------+--------------------------+------------+--------+---------------+
-- Table: Ships
CREATE TABLE Ships (
    ShipID INT PRIMARY KEY,
    ShipName VARCHAR(100),
    ShipType VARCHAR(50),
    HomePort VARCHAR(100)
);
INSERT INTO Ships (ShipID, ShipName, ShipType, HomePort) VALUES
(1, 'USS Enterprise', 'Aircraft Carrier', 'Pearl Harbor'),
(2, 'HMS Victory', 'Frigate', 'Portsmouth'),
(3, 'USS Nimitz', 'Aircraft Carrier', 'San Diego'),
(4, 'RMS Titanic', 'Ocean Liner', 'Southampton'),
(5, 'HMS Queen Elizabeth', 'Aircraft Carrier', 'Portsmouth');
SELECT * FROM Ships;
+--------+---------------------+------------------+--------------+
| ShipID | ShipName            | ShipType         | HomePort     |
+--------+---------------------+------------------+--------------+
|      1 | USS Enterprise      | Aircraft Carrier | Pearl Harbor |
|      2 | HMS Victory         | Frigate          | Portsmouth   |
|      3 | USS Nimitz          | Aircraft Carrier | San Diego    |
|      4 | RMS Titanic         | Ocean Liner      | Southampton  |
|      5 | HMS Queen Elizabeth | Aircraft Carrier | Portsmouth   |
+--------+---------------------+------------------+--------------+

-- Table: Missions
CREATE TABLE Missions (
    MissionID INT PRIMARY KEY,
    MissionName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    ShipID INT,
    FOREIGN KEY (ShipID) REFERENCES Ships(ShipID)
);
INSERT INTO Missions (MissionID, MissionName, StartDate, EndDate, ShipID) VALUES
(1, 'High Risk Recon', '2023-06-01', '2023-06-30', 1),
(2, 'Peacekeeping Mission', '2023-03-15', '2023-04-01', 2),
(3, 'High Risk Operation', '2023-08-10', '2023-08-25', 3),
(4, 'Rescue Operation', '2023-10-05', '2023-10-20', 4),
(5, 'Training Exercise', '2024-01-01', '2024-01-15', 5);
SELECT * FROM Missions;
+-----------+----------------------+------------+------------+--------+
| MissionID | MissionName          | StartDate  | EndDate    | ShipID |
+-----------+----------------------+------------+------------+--------+
|         1 | High Risk Recon      | 2023-06-01 | 2023-06-30 |      1 |
|         2 | Peacekeeping Mission | 2023-03-15 | 2023-04-01 |      2 |
|         3 | High Risk Operation  | 2023-08-10 | 2023-08-25 |      3 |
|         4 | Rescue Operation     | 2023-10-05 | 2023-10-20 |      4 |
|         5 | Training Exercise    | 2024-01-01 | 2024-01-15 |      5 |
+-----------+----------------------+------------+------------+--------+

-- Table: Trainings
CREATE TABLE Trainings (
    TrainingID INT PRIMARY KEY,
    TrainingName VARCHAR(100),
    Duration INT, -- Duration in days
    Location VARCHAR(100)
);
INSERT INTO Trainings (TrainingID, TrainingName, Duration, Location) VALUES
(1, 'Advanced Combat Training', 30, 'Pearl Harbor'),
(2, 'Navigation and Strategy', 45, 'San Diego'),
(3, 'Survival Skills', 15, 'Portsmouth'),
(4, 'Leadership and Management', 20, 'Southampton'),
(5, 'First Aid and Medical Training', 10, 'San Diego');
SELECT * FROM Trainings;
+------------+--------------------------------+----------+--------------+
| TrainingID | TrainingName                   | Duration | Location     |
+------------+--------------------------------+----------+--------------+
|          1 | Advanced Combat Training       |       30 | Pearl Harbor |
|          2 | Navigation and Strategy        |       45 | San Diego    |
|          3 | Survival Skills                |       15 | Portsmouth   |
|          4 | Leadership and Management      |       20 | Southampton  |
|          5 | First Aid and Medical Training |       10 | San Diego    |
+------------+--------------------------------+----------+--------------+

-- Table: Equipments
CREATE TABLE Equipments (
    EquipmentID INT PRIMARY KEY,
    EquipmentName VARCHAR(100),
    EquipmentType VARCHAR(50),
    ShipID INT,
    FOREIGN KEY (ShipID) REFERENCES Ships(ShipID)
);
INSERT INTO Equipments (EquipmentID, EquipmentName, EquipmentType, ShipID) VALUES
(1, 'Radar System', 'Electronic', 1),
(2, 'Fire Extinguisher', 'Safety', 2),
(3, 'Sonar', 'Electronic', 3),
(4, 'Lifeboat', 'Safety', 4),
(5, 'Satellite Communication', 'Communication', 5);
 SELECT * FROM Equipments;
+-------------+-------------------------+---------------+--------+
| EquipmentID | EquipmentName           | EquipmentType | ShipID |
+-------------+-------------------------+---------------+--------+
|           1 | Radar System            | Electronic    |      1 |
|           2 | Fire Extinguisher       | Safety        |      2 |
|           3 | Sonar                   | Electronic    |      3 |
|           4 | Lifeboat                | Safety        |      4 |
|           5 | Satellite Communication | Communication |      5 |
+-------------+-------------------------+---------------+--------+

-- Table: MedicalRecords
CREATE TABLE MedicalRecords (
    MedicalRecordID INT PRIMARY KEY,
    BloodType VARCHAR(5),
    LastCheckupDate DATE,
    MedicalConditions TEXT,
    SailorID INT,
    FOREIGN KEY (SailorID) REFERENCES Sailors(SailorID)
);
INSERT INTO MedicalRecords (MedicalRecordID, BloodType, LastCheckupDate, MedicalConditions, SailorID) VALUES
(1, 'O+', '2023-06-15', 'Asthma', 1),
(2, 'A-', '2023-07-01', 'Healthy', 2),
(3, 'B+', '2023-08-10', 'Diabetes', 3),
(4, 'AB-', '2023-09-05', 'High Blood Pressure', 4),
(5, 'O-', '2023-11-01', 'Healthy', 5);
SELECT * FROM MedicalRecords;
+-----------------+-----------+-----------------+---------------------+----------+
| MedicalRecordID | BloodType | LastCheckupDate | MedicalConditions   | SailorID |
+-----------------+-----------+-----------------+---------------------+----------+
|               1 | O+        | 2023-06-15      | Asthma              |        1 |
|               2 | A-        | 2023-07-01      | Healthy             |        2 |
|               3 | B+        | 2023-08-10      | Diabetes            |        3 |
|               4 | AB-       | 2023-09-05      | High Blood Pressure |        4 |
|               5 | O-        | 2023-11-01      | Healthy             |        5 |
+-----------------+-----------+-----------------+---------------------+----------+

-- Table: SailorTraining (many-to-many relationship between Sailors and Trainings)
CREATE TABLE SailorTraining (
    SailorID INT,
    TrainingID INT,
    PRIMARY KEY (SailorID, TrainingID),
    FOREIGN KEY (SailorID) REFERENCES Sailors(SailorID),
    FOREIGN KEY (TrainingID) REFERENCES Trainings(TrainingID)
);
INSERT INTO SailorTraining (SailorID, TrainingID) VALUES
(1, 1),
(1, 2),
(3, 3),
(4, 4),
(1, 5),
(3, 5),
(4, 5),
(5, 4);
SELECT * FROM SailorTraining;
+----------+------------+
| SailorID | TrainingID |
+----------+------------+
|        1 |          1 |
|        1 |          2 |
|        3 |          3 |
|        4 |          4 |
|        5 |          4 |
|        1 |          5 |
|        3 |          5 |
|        4 |          5 |
+----------+------------+

-- Table: TrainingMission (many-to-many relationship between Trainings and Missions)
CREATE TABLE TrainingMission (
    TrainingID INT,
    MissionID INT,
    PRIMARY KEY (TrainingID, MissionID),
    FOREIGN KEY (TrainingID) REFERENCES Trainings(TrainingID),
    FOREIGN KEY (MissionID) REFERENCES Missions(MissionID)
);
INSERT INTO TrainingMission (TrainingID, MissionID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
SELECT * FROM TrainingMission;
+------------+-----------+
| TrainingID | MissionID |
+------------+-----------+
|          1 |         1 |
|          2 |         2 |
|          3 |         3 |
|          4 |         4 |
|          5 |         5 |
+------------+-----------+

-- Table: SailorSkill
CREATE TABLE SailorSkill (
    SailorID INT,
    Skill VARCHAR(100),
    PRIMARY KEY (SailorID, Skill),
    FOREIGN KEY (SailorID) REFERENCES Sailors(SailorID)
);
INSERT INTO SailorSkill (SailorID, Skill) VALUES
(1, 'Navigation'),
(2, 'Combat'),
(3, 'Strategy'),
(4, 'Leadership'),
(5, 'Medical'),
(3, 'Medical'),
(2, 'Medical'),
(5, 'Navigation'),
(2, 'Strategy');
 SELECT * FROM SailorSkill;
+----------+------------+
| SailorID | Skill      |
+----------+------------+
|        1 | Navigation |
|        2 | Combat     |
|        2 | Medical    |
|        2 | Strategy   |
|        3 | Medical    |
|        3 | Strategy   |
|        4 | Leadership |
|        5 | Medical    |
|        5 | Navigation |
+----------+------------+

-- Table: MaintenanceLog
CREATE TABLE MaintenanceLog (
    LogID INT PRIMARY KEY,
    MaintenanceDate DATE,
    MaintenanceDescription TEXT,
    TechnicianName VARCHAR(100),
    EquipmentID INT,
    FOREIGN KEY (EquipmentID) REFERENCES Equipments(EquipmentID)
);
INSERT INTO MaintenanceLog (LogID, MaintenanceDate, MaintenanceDescription, TechnicianName, EquipmentID) VALUES
(1, '2023-05-15', 'Replaced Radar Unit', 'Anil Kapoor', 1),
(2, '2023-06-20', 'Calibrated Sonar System', 'Deepak Verma', 2),
(3, '2023-07-10', 'Serviced Lifeboat', 'Sandeep Reddy', 3),
(4, '2023-08-25', 'Updated Satellite Communication', 'Rajesh Iyer', 4),
(5, '2023-09-10', 'Fixed Fire Extinguisher', 'Karan Mehta', 5);
SELECT * FROM MaintenanceLog;
+-------+-----------------+---------------------------------+----------------+-------------+
| LogID | MaintenanceDate | MaintenanceDescription          | TechnicianName | EquipmentID |
+-------+-----------------+---------------------------------+----------------+-------------+
|     1 | 2023-05-15      | Replaced Radar Unit             | Anil Kapoor    |           1 |
|     2 | 2023-06-20      | Calibrated Sonar System         | Deepak Verma   |           2 |
|     3 | 2023-07-10      | Serviced Lifeboat               | Sandeep Reddy  |           3 |
|     4 | 2023-08-25      | Updated Satellite Communication | Rajesh Iyer    |           4 |
|     5 | 2023-09-10      | Fixed Fire Extinguisher         | Karan Mehta    |           5 |
+-------+-----------------+---------------------------------+----------------+-------------+

-- QUERY 1
--Retrieve the Name and Rank of each sailor from the Sailors table.
SELECT NAME,`RANK` FROM Sailors;
+-----------------+------------+
| NAME            | RANK       |
+-----------------+------------+
| Arjun Patel     | Captain    |
| Priya Singh     | Lieutenant |
| Ravi Kumar      | Commander  |
| Meera Sharma    | Lieutenant |
| Vikram Deshmukh | Ensign     |
+-----------------+------------+

-- QUERY 2
--Write a query to display ShipName and ShipType for ships stationed in a specified HomePort, such as "Pearl Harbor."
SELECT ShipID,ShipName, ShipType,HomePort FROM Ships Where HomePort="Pearl Harbor";
+--------+----------------+------------------+--------------+
| ShipID | ShipName       | ShipType         | HomePort     |
+--------+----------------+------------------+--------------+
|      1 | USS Enterprise | Aircraft Carrier | Pearl Harbor |
+--------+----------------+------------------+--------------+

-- QUERY 3
--List the names of sailors (Name from Sailors) who have entries in the SailorTraining table, showing that they participated in at least one training program.
SELECT s.SailorID,t.TrainingID,s.Name , t.TrainingName
FROM Sailors s , Trainings t ,SailorTraining st WHERE s.SailorID = st.SailorID
AND t.TrainingID=st.TrainingID;
+----------+------------+-----------------+--------------------------------+
| SailorID | TrainingID | Name            | TrainingName                   |
+----------+------------+-----------------+--------------------------------+
|        1 |          1 | Arjun Patel     | Advanced Combat Training       |
|        1 |          2 | Arjun Patel     | Navigation and Strategy        |
|        1 |          5 | Arjun Patel     | First Aid and Medical Training |
|        3 |          3 | Ravi Kumar      | Survival Skills                |
|        3 |          5 | Ravi Kumar      | First Aid and Medical Training |
|        4 |          4 | Meera Sharma    | Leadership and Management      |
|        4 |          5 | Meera Sharma    | First Aid and Medical Training |
|        5 |          4 | Vikram Deshmukh | Leadership and Management      |
+----------+------------+-----------------+--------------------------------+

-- QUERY 4
--For a specified sailor (by SailorID), find other sailors who have the same skill(s) listed in the SailorSkill table.
SELECT DISTINCT s2.SailorID, s2.Name
FROM SailorSkill ss1
INNER JOIN SailorSkill ss2 ON ss1.Skill = ss2.Skill AND ss1.SailorID <> ss2.SailorID
INNER JOIN Sailors s2 ON ss2.SailorID = s2.SailorID
WHERE ss1.SailorID = 1;
+----------+-----------------+
| SailorID | Name            |
+----------+-----------------+
|        5 | Vikram Deshmukh |
+----------+-----------------+

SELECT DISTINCT 
    s2.SailorID, 
    s2.Name, 
    CASE 
        WHEN s2.SailorID = ss1.SailorID THEN 'Specified Sailor' 
        ELSE 'Other Sailor with Same Skill'
    END AS Specified_Sailor
FROM SailorSkill ss1
INNER JOIN SailorSkill ss2 ON ss1.Skill = ss2.Skill
INNER JOIN Sailors s2 ON ss2.SailorID = s2.SailorID
WHERE ss1.SailorID = 1;
+----------+-----------------+------------------------------+
| SailorID | Name            | Specified_Sailor             |
+----------+-----------------+------------------------------+
|        1 | Arjun Patel     | Specified Sailor             |
|        5 | Vikram Deshmukh | Other Sailor with Same Skill |
+----------+-----------------+------------------------------+

-- QUERY 5
--Write a query that joins Equipments and MaintenanceLog to show each piece of equipment (EquipmentName) assigned to a ship (ShipName), along with its maintenance date (MaintenanceDate) and description (MaintenanceDescription).
SELECT E.EquipmentID,E.EquipmentName,S3.ShipID,S3.ShipName,M.MaintenanceDate,M.MaintenanceDescription FROM Equipments E, Ships S3 , MaintenanceLog M WHERE E.EquipmentID=M.EquipmentID AND E.ShipID=S3.ShipID;
+-------------+-------------------------+--------+---------------------+-----------------+---------------------------------+
| EquipmentID | EquipmentName           | ShipID | ShipName            | MaintenanceDate | MaintenanceDescription          |
+-------------+-------------------------+--------+---------------------+-----------------+---------------------------------+
|           1 | Radar System            |      1 | USS Enterprise      | 2023-05-15      | Replaced Radar Unit             |
|           2 | Fire Extinguisher       |      2 | HMS Victory         | 2023-06-20      | Calibrated Sonar System         |
|           3 | Sonar                   |      3 | USS Nimitz          | 2023-07-10      | Serviced Lifeboat               |
|           4 | Lifeboat                |      4 | RMS Titanic         | 2023-08-25      | Updated Satellite Communication |
|           5 | Satellite Communication |      5 | HMS Queen Elizabeth | 2023-09-10      | Fixed Fire Extinguisher         |
+-------------+-------------------------+--------+---------------------+-----------------+---------------------------------+

-- QUERY 6
--List the names of sailors who have attended training programs associated with a specified mission. Use joins between SailorTraining, TrainingMission, and Missions to filter by MissionName.
SELECT S.SailorID,S.NAME, M.MissionID,M.MissionName FROM Sailors S, Missions M, SailorTraining st, TrainingMission tm WHERE st.SailorID=S.SailorID
 AND St.TrainingID=tm.TrainingID AND tm.MissionID=M.MissionID AND M.MissionID=5;
+----------+--------------+-----------+-------------------+
| SailorID | NAME         | MissionID | MissionName       |
+----------+--------------+-----------+-------------------+
|        1 | Arjun Patel  |         5 | Training Exercise |
|        3 | Ravi Kumar   |         5 | Training Exercise |
|        4 | Meera Sharma |         5 | Training Exercise |
+----------+--------------+-----------+-------------------+

-- QUERY 7
--Write a query to find the sailor with the earliest DateOfJoining for each ship. Display the ship’s name, sailor’s name, and years of service.
SELECT 
    sh.ShipID,
    sh.ShipName, 
    s.Name AS SailorName, 
    s.SailorID,
    TIMESTAMPDIFF(YEAR, s.DateOfJoining, CURDATE()) AS YearsOfService
FROM Sailors s
INNER JOIN Ships sh ON s.ShipID = sh.ShipID
WHERE s.DateOfJoining = (
    SELECT MIN(s1.DateOfJoining)
    FROM Sailors s1
    WHERE s1.ShipID = s.ShipID
);
+--------+---------------------+-----------------+----------+----------------+
| ShipID | ShipName            | SailorName      | SailorID | YearsOfService |
+--------+---------------------+-----------------+----------+----------------+
|      1 | USS Enterprise      | Arjun Patel     |        1 |              9 |
|      2 | HMS Victory         | Ravi Kumar      |        3 |             11 |
|      5 | HMS Queen Elizabeth | Vikram Deshmukh |        5 |              4 |
+--------+---------------------+-----------------+----------+----------------+

-- QUERY 8
--Retrieve names of sailors from Sailors who have entries in MedicalRecords (indicating they have a medical condition) and are also associated with high-risk missions in Missions (e.g., where the mission name contains "High Risk" or a similar term).
SELECT DISTINCT s.Name AS SailorName,
m.MissionName 
FROM Sailors s
INNER JOIN MedicalRecords mr ON s.SailorID = mr.SailorID
INNER JOIN Missions m ON s.ShipID = m.ShipID
WHERE m.MissionName LIKE '%High Risk%';
+-------------+-----------------+
| SailorName  | MissionName     |
+-------------+-----------------+
| Arjun Patel | High Risk Recon |
| Priya Singh | High Risk Recon |
+-------------+-----------------+

-- QUERY 9
-- Display the sailor’s Name, Rank, years of service, and count of training programs attended. Include only sailors with at
-- least 5 years of service. This query should use DateOfJoining to calculate years of service and count entries in SailorTraining.
SELECT 
    s.Name AS SailorName, 
    s.Rank, 
    TIMESTAMPDIFF(YEAR, s.DateOfJoining, CURDATE()) AS YearsOfService, 
    COUNT(st.TrainingID) AS TrainingCount
FROM Sailors s
LEFT JOIN SailorTraining st ON s.SailorID = st.SailorID
WHERE TIMESTAMPDIFF(YEAR, s.DateOfJoining, CURDATE()) >= 5
GROUP BY s.SailorID, s.Name, s.Rank, s.DateOfJoining;
+-------------+------------+----------------+---------------+
| SailorName  | Rank       | YearsOfService | TrainingCount |
+-------------+------------+----------------+---------------+
| Arjun Patel | Captain    |              9 |             3 |
| Priya Singh | Lieutenant |              7 |             0 |
| Ravi Kumar  | Commander  |             11 |             2 |
+-------------+------------+----------------+---------------+

-- QUERY 10
--Write a query to find the equipment in the MaintenanceLog with the highest number of 
--maintenance entries. Display the equipment name, the number of maintenance instances, and its associated ship.
SELECT 
    e.EquipmentName, 
    COUNT(ml.LogID) AS MaintenanceCount, 
    sh.ShipName
FROM MaintenanceLog ml
INNER JOIN Equipments e ON ml.EquipmentID = e.EquipmentID
INNER JOIN Ships sh ON e.ShipID = sh.ShipID
GROUP BY e.EquipmentID, e.EquipmentName, sh.ShipName
ORDER BY MaintenanceCount DESC
LIMIT 1;
+---------------+------------------+----------------+
| EquipmentName | MaintenanceCount | ShipName       |
+---------------+------------------+----------------+
| Radar System  |                1 | USS Enterprise |
+---------------+------------------+----------------+