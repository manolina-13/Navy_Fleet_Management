# Navy Fleet Management System

## Description

This project implements a **Navy Fleet Management System**, managing critical entities such as sailors, ships, missions, equipment, and training. The system models relationships between these entities to provide a realistic representation of the Navy's operational framework. It supports queries related to sailors’ skills, mission assignments, training participation, medical records, and equipment maintenance.

---

## ER Model

The ER Diagram visually represents entities and their relationships, including:

* Sailors, Ships, Missions, Trainings, Equipments, MedicalRecords
* Weak entities like MaintenanceLog
* M:N relationships via junction tables (SailorTraining, TrainingMission)

---

## Relational Model Conversion

* **Strong Entities:** Tables have primary keys representing unique records (e.g., Sailors, Ships).  
* **Weak Entities:** Include foreign keys referencing related strong entities (e.g., MaintenanceLog references Equipments).  
* **Relationships:**  
  * **1:N Relationships:** Foreign key added on the "many" side (e.g., Sailors → Ships).  
  * **M:N Relationships:** New junction table created (e.g., SailorTraining, TrainingMission).

---

## Tables Overview

| Table | Columns |
|-------|---------|
| **Sailors** | SailorID, Name, Address, Rank, DateOfJoining, ShipID |
| **Ships** | ShipID, ShipName, ShipType, HomePort |
| **Missions** | MissionID, MissionName, StartDate, EndDate, ShipID |
| **Trainings** | TrainingID, TrainingName, Duration, Location |
| **Equipments** | EquipmentID, EquipmentName, EquipmentType, ShipID |
| **MaintenanceLog** | LogID, EquipmentID, MaintenanceDate, MaintenanceDescription, TechnicianName |
| **SailorTraining** | SailorID, TrainingID |
| **TrainingMission** | TrainingID, MissionID |
| **MedicalRecords** | MedicalRecordID, SailorID, BloodType, LastCheckupDate, MedicalConditions |
| **SailorSkill** | SailorID, Skill |

**Key Relationships:**

* Sailors are assigned to Ships (1:N)  
* Ships undertake Missions (1:N)  
* Equipments belong to Ships (1:N)  
* Sailors attend Trainings (M:N via SailorTraining)  
* Trainings linked to Missions (M:N via TrainingMission)  
* Sailors have MedicalRecords (1:1)  
* Sailors possess Skills (1:N)

---

## Example SQL Queries

**1. Retrieve Name and Rank of each Sailor**
```sql
SELECT Name, Rank FROM Sailors;
```
**2. Retrieve the name and type of ships that are stationed at the "Pearl Harbor" home port.

```sql
SELECT ShipName, ShipType
FROM Ships
WHERE HomePort = 'Pearl Harbor';
```
**3.Retrieve the names of sailors who share at least one skill with the sailor having `SailorID = 1`.

```sql
SELECT DISTINCT s2.Name
FROM SailorSkill ss1
JOIN SailorSkill ss2 
    ON ss1.Skill = ss2.Skill 
    AND ss1.SailorID <> ss2.SailorID
JOIN Sailors s2 
    ON ss2.SailorID = s2.SailorID
WHERE ss1.SailorID = 1;
