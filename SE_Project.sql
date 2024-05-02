use se_project;

-- select statements
select * from Faculty;
select * from Panel;
select * from PanelMember;
select * from FYPCommittee;
select * from Student;
select * from Supervisor;
select * from Supervises;
select * from GroupHasProject;
select * from FYP;
select * from FYPGroup;
select * from CoSupervisor;
select * from FYPGroupAssignedToPanel;


--SELECT * FROM Student
--WHERE fname LIKE '%J%n%';

-- select * from FYPGroup where Group_Member1='S002' or Group_Member2='S002' or Group_Member3='S002'

--Update FYPGroup set IsAssignedToPanel=1 where Group_ID='G_S025_S026_S026'

--TRUNCATE Table Panel
--delete from Panel where Panel.Panel_ID='PA001'


--Delete from FYP where FYP.Project_ID = 'PR003'
--Delete from GroupHasProject where GroupHasProject.prj_id= 'G_S007_S008_S009'
--Delete from FYPGroup where FYPGroup.Group_ID= 'G_S007_S008_S009'

--Delete from GroupHasProject
--Delete from FYPGroup
--Delete from FYP
--Delete from Supervisor
--Delete from coSupervisor
--Delete from Supervises

--UPDATE Supervisor SET NumProjects = 2 WHERE Supervisor_ID = 'FA001'
 
---- drop statements
--Drop Table Supervisor
--Drop Table coSupervisor
--Drop Table PanelMember
--Drop Table Panel
--Drop Table Supervises
--Drop Table FYPCommittee
--Drop Table Faculty

--Drop Table Student
--Drop Table GroupHasProject
--Drop Table FYPGroup
--Drop table FYP
 
-------------------------------------------------------------
---------------------  Table Creation  ----------------------
-------------------------------------------------------------

CREATE TABLE Student
(
Roll_No VARCHAR(8),
FName VARCHAR(256),
LName VARCHAR(256),
department Varchar(3),
Student_Password VARCHAR(8),

PRIMARY KEY (Roll_No)
);
--ALTER TABLE Student
--ALTER COLUMN Grade CHAR(2) NULL;


---- Queries to test Student
--select Student_Password FROM Student WHERE Roll_No='21i-2470';
--SELECT count(*) FROM Student WHERE Roll_No='21i-2470' and Student_Password='Kainat12'

CREATE TABLE Faculty (
	Faculty_ID VARCHAR(8),
	FName VARCHAR(256),
	LName VARCHAR(256),
	department Varchar(10),
	Faculty_Password VARCHAR(8),
	available int, -- available for panel
	commMember int, 
	sup int,

	PRIMARY KEY (Faculty_ID)
);
---- empty table
--SELECT Faculty_ID, FName, LName, Department FROM Faculty WHERE commMember=0 and sup=0
-- Update Faculty set available=0 where Faculty_ID='FA200'


CREATE TABLE Supervisor (
	Supervisor_ID VARCHAR(8),
	NumProjects INT,

	PRIMARY KEY (Supervisor_ID),
	FOREIGN KEY (Supervisor_ID) REFERENCES Faculty (Faculty_ID)
);
--SELECT count(*) FROM Supervisor 


CREATE TABLE FYP (
	Project_ID VARCHAR(8),
	Title VARCHAR(256),

	PRIMARY KEY (Project_ID)
);


CREATE TABLE FYPGroup (
	Group_ID VARCHAR(40),
	Group_Member1 VARCHAR(8),
	Group_Member2 VARCHAR(8),
	Group_Member3 VARCHAR(8),

	PRIMARY KEY (Group_ID),
	FOREIGN KEY (Group_Member1) REFERENCES Student (Roll_No),
	FOREIGN KEY (Group_Member2) REFERENCES Student (Roll_No),
	FOREIGN KEY (Group_Member3) REFERENCES Student (Roll_No)
);

--ALTER TABLE FYPGroup
--ADD IsAssignedToPanel BIT DEFAULT 0;    --BIT takes 1 bit space, for true/false, 0/1 statements
--UPDATE FYPGroup set IsAssignedToPanel = 0


CREATE TABLE GroupHasProject
(
	grp_id VARCHAR(40),	-- Group ID would be member1ID+member2ID+member3ID
	prj_id VARCHAR(8),

	PRIMARY KEY (grp_id,prj_id),
	FOREIGN KEY (grp_id) REFERENCES FYPGroup (Group_ID),
	FOREIGN KEY (prj_id) REFERENCES FYP (Project_ID)
);


CREATE TABLE Supervises (
	sup_id VARCHAR(8),
	fyp_id VARCHAR(8),
	coSup int,
	-- coSup to check
	-- if coSup == 1 meaning coSup exists
	-- if coSup == 0 meaning no coSup exists
	PRIMARY KEY (sup_id,fyp_id),
	FOREIGN KEY (sup_id) REFERENCES Supervisor (Supervisor_ID),
	FOREIGN KEY (fyp_id) REFERENCES FYP (Project_ID),
);

--Update Supervises set sup_id='FA001' where sup_id='FA002'


CREATE TABLE coSupervisor (
	coSup_id VARCHAR(8),
	fyp_id VARCHAR(8),
	PRIMARY KEY (coSup_id,fyp_id),
	FOREIGN KEY (coSup_id) REFERENCES Supervisor (Supervisor_ID),
	FOREIGN KEY (fyp_id) REFERENCES FYP (Project_ID),
);


CREATE TABLE Panel (
	Panel_ID VARCHAR(20),
	NumMembers INT,
	PRIMARY KEY (Panel_ID)
);


CREATE TABLE PanelMember (
	pnl_id VARCHAR(20),
	PMember_ID VARCHAR(8),

	PRIMARY KEY (pnl_id,PMember_ID),
	FOREIGN KEY (PMember_ID) REFERENCES Faculty (Faculty_ID),
	FOREIGN KEY (pnl_id) REFERENCES Panel (Panel_ID)
);


CREATE TABLE FYPGroupAssignedToPanel (
    Group_ID VARCHAR(40),
    Panel_ID VARCHAR(20),
    PRIMARY KEY (Group_ID, Panel_ID),
    FOREIGN KEY (Group_ID) REFERENCES FYPGroup(Group_ID),
    FOREIGN KEY (Panel_ID) REFERENCES Panel(Panel_ID)
);



-- NO MORE CHANGES HERE
CREATE TABLE FYPCommittee (
	Member_ID VARCHAR(8),
	Member_Name Varchar(255),
	password VARCHAR(8),

	PRIMARY KEY (Member_ID),
	FOREIGN KEY (Member_ID) REFERENCES Faculty (Faculty_ID)
);
-- NO MORE CHANGES HERE











CREATE TABLE Assesment
(
Assesment_ID VARCHAR(8),
Deadline DATE,
Assesment_Marks INT,

PRIMARY KEY (Assesment_ID)
);

CREATE TABLE Review
(
Review_ID VARCHAR(8),
Review_Date DATE,
LeftBy VARCHAR(8),

PRIMARY KEY (Review_ID),
FOREIGN KEY (LeftBY) REFERENCES Faculty (Faculty_ID)
);

--  the table to store the grade for each separate evaluation submission of group. 
--CREATE TABLE presentationGrade (
--	EvaluationID Varchar(8),	-- this is the ID of the assessment the FYP group submits
--    Group_ID VARCHAR(40),
--    marks VARCHAR(3),
--    PRIMARY KEY (Roll_No),
--    FOREIGN KEY (Roll_No) REFERENCES Student(Roll_No)
--);

-----------------------------------------------------------
------------------   Data Insertion  ----------------------
-----------------------------------------------------------

---- Inserting students 
--INSERT INTO Student (Roll_No, FName, LName, department, Student_Password) VALUES
--    ('S001', 'John', 'Doe', 'CS', 'John12'),
--    ('S002', 'Jane', 'Smith', 'MTH', 'Jane12'),
--    ('S003', 'Alice', 'Johnson', 'BIO', 'Alice12'),
--    ('S004', 'Robert', 'Brown', 'PHY', 'Robert12'),
--    ('S005', 'Emily', 'Davis', 'CHE', 'Emily12'),
--    ('S006', 'Michael', 'Wilson', 'HIS', 'Mich12'),
--    ('S007', 'Jessica', 'Garcia', 'LIT', 'Jess12'),
--    ('S008', 'Thomas', 'Lee', 'CS', 'Thomas12'),
--    ('S009', 'Sarah', 'Martinez', 'PSY', 'Sarah12'),
--    ('S010', 'Daniel', 'Taylor', 'ECO', 'Dan12'),
--    ('S011', 'Isabella', 'Anderson', 'PHI', 'Isa12'),
--    ('S012', 'Andrew', 'Moore', 'ENG', 'And12'),
--    ('S013', 'Elizabeth', 'Hernandez', 'MUS', 'Eliza12'),
--    ('S014', 'Jacob', 'Wright', 'MED', 'Jacob12'),
--    ('S015', 'Olivia', 'Thomas', 'NUR', 'Olivia12'),
--    ('S016', 'William', 'King', 'LAW', 'Will12'),
--    ('S017', 'Sophia', 'Green', 'THE', 'Sophia12'),
--    ('S018', 'Alexander', 'Baker', 'PSC', 'Alex12'),
--    ('S019', 'Emma', 'Carter', 'EVS', 'Emma12'),
--    ('S020', 'Ethan', 'Nelson', 'MTH', 'Ethan12'),
--    ('S021', 'Mia', 'Mitchell', 'CHE', 'Mia12'),
--    ('S022', 'Lucas', 'Rodriguez', 'CS', 'Lucas12'),
--    ('S023', 'Henry', 'Lopez', 'PHY', 'Henry12'),
--    ('S024', 'Charlotte', 'Martinez', 'HIS', 'Char12'),
--    ('S025', 'Sebastian', 'Perez', 'LIT', 'Seb12'),
--    ('S026', 'Avery', 'Scott', 'BIO', 'Avery12'),
--    ('S027', 'Chloe', 'Walker', 'CHE', 'Chloe12'),
--    ('S028', 'Gabriel', 'Adams', 'CS', 'Gab12'),
--    ('S029', 'Isabella', 'Sanchez', 'PHY', 'Isa12'),
--    ('S030', 'Jack', 'Gonzalez', 'PSC', 'Jack12'),
--    ('S031', 'Sophia', 'Evans', 'ENG', 'Soph12'),
--    ('S032', 'Liam', 'Bennett', 'PSY', 'Liam12'),
--    ('S033', 'Ava', 'Morgan', 'MED', 'Ava12'),
--    ('S034', 'Noah', 'Clark', 'LAW', 'Noah12'),
--    ('S035', 'Zoe', 'Mitchell', 'ENG', 'Zoe12');





---- Data to insert in Faculty
--INSERT INTO Faculty VALUES ('FA001', 'Aleena', 'Ali', 'CS', 'Aleena12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA002', 'Areeba', 'Sattar', 'AI', 'Areeba12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA003', 'Ali', 'Asad', 'CY', 'Ali12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA004', 'Sarah', 'Johnson', 'ENG', 'Sarah12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA005', 'Michael', 'Williams', 'BIO', 'Mich12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA006', 'Emily', 'Brown', 'MATH', 'Emily12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA007', 'Daniel', 'Miller', 'PHY', 'Dan12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA008', 'Emma', 'Jones', 'CHEM', 'Emma12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA009', 'David', 'Garcia', 'HIST', 'David12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA010', 'Sophia', 'Davis', 'PSY', 'Sophia12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA011', 'John', 'Doe', 'CS', 'John12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA012', 'Jane', 'Smith', 'IT', 'Jane12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA013', 'Ali', 'Asad', 'CY', 'Ali12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA014', 'Liam', 'Harris', 'ENG', 'Liam12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA015', 'Olivia', 'Taylor', 'BIO', 'Olivia12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA016', 'James', 'Johnson', 'AI', 'James12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA017', 'Sophia', 'Brown', 'DS', 'Sophia1', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA018', 'Benjamin', 'Wilson', 'PHY', 'Ben12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA019', 'Emma', 'Jones', 'AI', 'Emma34', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA020', 'Daniel', 'Thomas', 'PSY', 'Daniel1', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA021', 'William', 'Davis', 'AI', 'Will12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA022', 'Charlotte', 'Lewis', 'IT', 'Char123', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA023', 'Ethan', 'Martinez', 'CS', 'Ethan21', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA024', 'Mia', 'Robinson', 'BIO', 'Mia1234', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA025', 'Mason', 'Clark', 'CY', 'Mason12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA026', 'Isabella', 'Walker', 'ENG', 'Isa12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA027', 'Liam', 'Adams', 'AI', 'Liam12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA028', 'Sophia', 'Green', 'CS', 'Soph12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA029', 'Ethan', 'Phillips', 'MATH', 'Ethan12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA030', 'Olivia', 'Nelson', 'CHEM', 'Oliv12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA031', 'Jackson', 'Baker', 'PHY', 'Jack12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA032', 'Ava', 'Lee', 'HIST', 'Ava12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA033', 'William', 'Scott', 'ENG', 'Will12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA034', 'Charlotte', 'Thompson', 'BIO', 'Char12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA035', 'James', 'Moore', 'PSY', 'James12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA036', 'Amelia', 'Garcia', 'CS', 'Amelia12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA037', 'Henry', 'Mitchell', 'AI', 'Henry12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA038', 'Harper', 'Martinez', 'MATH', 'Harper12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA039', 'Elijah', 'Rodriguez', 'PHY', 'Elijah12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA040', 'Emma', 'Harris', 'HIST', 'Emma12', 1, 0, 0);
--INSERT INTO Faculty VALUES ('FA041', 'Benjamin', 'Hughes', 'ENG', 'Benj12', 1, 0, 0);
---- FYP Committee Faculty
--INSERT INTO Faculty VALUES ('FA100', 'Kainat', 'Ali', 'CS', 'Kainat12', 0, 1, 0);
--INSERT INTO Faculty VALUES ('FA200', 'Rabail', 'Nasir', 'CS', 'Rabail12', 0, 1, 0);





--INSERT INTO FYPCommittee (Member_ID, Member_Name, password) VALUES ('FA100', 'Kainat Ali', 'Kainat12');
--INSERT INTO FYPCommittee(Member_ID, Member_Name, password) VALUES ('FA200', 'Rabail Nasir','Rabail12');


--------------------------------------------------------
----------------------- Queries ------------------------
--------------------------------------------------------

select * from Supervises    -- would us main Supervisor
select * from coSupervisor  -- would give us coSup, if any
select * from Supervisor	-- would give us numProject

select * from Supervisor where Supervisor.NumProjects > 6 and Supervisor.Supervisor_ID='FA002'
select fyp_id, coSup from Supervises where sup_id='FA001'