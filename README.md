
# Navy Fleet Management System

## Description

This project implements a Navy Fleet Management System, encompassing critical entities such as sailors, ships, missions, equipment, and training. The system models the relationships between these entities to provide a comprehensive representation of the Navy's operational framework.

## 1. ER Model

The ER Diagram visually represents the entities and relationships within the Navy Fleet Management System.

## 2. Relational Model Conversion

The ER Model is transformed into a relational database schema, with the following key aspects:

*   **Strong Entities:** Each strong entity (Sailors, Ships, Missions, Trainings, Equipments, MedicalRecords) is represented by a table with its attributes as columns and a primary key.

*   **Weak Entities:** Weak entities (e.g., MaintenanceLog) incorporate the primary key of their related strong entity as a foreign key.

*   **Relationships:** Relationships are handled as follows:
    *   1:N Relationships:  The primary key from the "one" side is added as a foreign key to the table on the "many" side.
    *   M:N Relationships:  A new table is created with combined primary keys from both entities involved in the relationship.

## Resulting Tables and Relationships

The database consists of the following tables:

*   **Sailors:** (SailorID, Name, Address, Rank, DateOfJoining, ShipID)
*   **Ships:** (ShipID, ShipName, ShipType, Homeport)
*   **Missions:** (MissionID, MissionName, StartDate, EndDate, ShipID)
*   **Trainings:** (TrainingID, TrainingName, Duration, Location)
*   **Equipments:** (EquipmentID, EquipmentName, EquipmentType, ShipID)
*   **MaintenanceLog:** (LogID, EquipmentID, MaintenanceDate, MaintenanceDescription, TechnicianName)
*   **SailorTraining:** (SailorID, TrainingID)
*   **TrainingMission:** (TrainingID, MissionID)
*   **MedicalRecords:** (MedicalRecordID, SailorID, BloodType, LastCheckupDate, MedicalConditions)
*   **SailorSkill:** (SailorID, Skill)

**Key Relationships:**

*   Sailors are assigned to Ships (1:N relationship).
*   Ships undertake Missions (1:N relationship).
*   Equipments are carried by Ships (1:N relationship).
*   Sailors participate in Trainings (M:N relationship - SailorTraining).
*   Trainings are associated with Missions (M:N relationship - TrainingMission).
*   Sailors have MedicalRecords (1:1 relationship).
*   Sailors possess Skills (1:N relationship).
