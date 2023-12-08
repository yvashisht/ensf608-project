DROP DATABASE IF EXISTS final_project;
CREATE DATABASE final_project;
USE final_project;

-- Creating the Venues table
CREATE TABLE Venues (
    Venue_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Capacity INT,
    Street_Address VARCHAR(255),
    City VARCHAR(255),
    Province_State VARCHAR(255),
    Transit_Access CHAR(1),
    CHECK (Transit_Access IN ('Y', 'N'))
);


-- Creating the Shows table
CREATE TABLE Shows (
    Show_Name VARCHAR(255),
    Performance_Year INT,
    Sponsor VARCHAR(255),
    Producer VARCHAR(255),
    PRIMARY KEY (Show_Name, Performance_Year)
);

-- Creating the Performers table
CREATE TABLE Performers (
    Performer_ID INT PRIMARY KEY,
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
    Citizenship VARCHAR(255),
    Birthdate DATE,
    Understudy_Performer_ID INT,
    Show_Name VARCHAR(255),
    Show_Year INT,
    Type VARCHAR(50),
    CHECK (Type IN ('Musician', 'Aerialist', 'Entertainer')),
	FOREIGN KEY (Show_Name, Show_Year) REFERENCES Shows(Show_Name, Performance_Year) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Understudy_Performer_ID) REFERENCES Performers(Performer_ID) ON DELETE SET NULL ON UPDATE CASCADE
);


-- Creating the Performer Diet table
CREATE TABLE Performer_Diet (
    Performer_ID INT,
    Diet VARCHAR(255),
    PRIMARY KEY (Performer_ID),
    FOREIGN KEY (Performer_ID) REFERENCES Performers(Performer_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Creating the Performer Medications table
CREATE TABLE Performer_Medications (
    Performer_ID INT,
    Medications VARCHAR(255),
    PRIMARY KEY (Performer_ID),
    FOREIGN KEY (Performer_ID) REFERENCES Performers(Performer_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Creating the Performer Aerialist table
CREATE TABLE Performer_Aerialist (
    Performer_ID INT,
    Sport VARCHAR(255),
    Equipment VARCHAR(255),
    PRIMARY KEY (Performer_ID),
    FOREIGN KEY (Performer_ID) REFERENCES Performers(Performer_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Creating the Performer Entertainer table
CREATE TABLE Performer_Entertainer (
    Performer_ID INT,
    Main_Act VARCHAR(255),
    PRIMARY KEY (Performer_ID),
    FOREIGN KEY (Performer_ID) REFERENCES Performers(Performer_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Creating the Performer Musician table
CREATE TABLE Performer_Musician (
    Instrument_ID INT PRIMARY KEY AUTO_INCREMENT,
    Performer_ID INT,
    Instrument VARCHAR(255),
	FOREIGN KEY (Performer_ID) REFERENCES Performers(Performer_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Creating the Emergency Contact table
CREATE TABLE Emergency_Contact (
    Performer_ID INT,
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
    Phone_Number VARCHAR(20),
    Relationship VARCHAR(255),
    PRIMARY KEY (Performer_ID),
    FOREIGN KEY (Performer_ID) REFERENCES Performers(Performer_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Creating the Held At table to link Shows and Venues
CREATE TABLE Held_At (
    Show_Name VARCHAR(255),
    Show_Year INT,
    Venue_ID INT,
    Date DATE,
    Location VARCHAR(255),
    PRIMARY KEY (Show_Name, Show_Year, Venue_ID),
    FOREIGN KEY (Show_Name, Show_Year) REFERENCES Shows(Show_Name, Performance_Year) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Venue_ID) REFERENCES Venues(Venue_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Inserting data into Venues
INSERT INTO Venues (Venue_ID, Name, Capacity, Street_Address, City, Province_State, Transit_Access)
VALUES
(1, 'Grand Theater', 2000, '123 Main St', 'Montreal', 'Quebec', 'Y'),
(2, 'Open Air', 5000, '234 Park Ave', 'Vancouver', 'British Columbia', 'N');

-- Inserting data into Shows
INSERT INTO Shows (Show_Name, Performance_Year, Sponsor, Producer)
VALUES
('Alegria', 2023, 'Global Bank', 'John Doe'),
('Kooza', 2023, 'Tech Corp', 'Jane Smith'),
('Corteo', 2023, 'Fashionista', 'Alice Johnson');

-- Inserting data into Performers
INSERT INTO Performers (Performer_ID, First_Name, Last_Name, Citizenship, Birthdate, Understudy_Performer_ID, Show_Name, Show_Year, Type)
VALUES
(1, 'Emily', 'Davis', 'Canadian', '1985-04-12', NULL, 'Alegria', 2023, 'Aerialist'),
(2, 'Luke', 'Taylor', 'American', '1990-07-23', NULL, 'Kooza', 2023, 'Musician'),
(3, 'Sophie', 'Martinez', 'French', '1992-03-01', 1, 'Corteo', 2023, 'Entertainer');

-- Inserting data into Performer_Diet
INSERT INTO Performer_Diet (Performer_ID, Diet)
VALUES
(1, 'Vegan'),
(2, 'High Protein'),
(3, 'Vegetarian');

-- Inserting data into Performer_Medications
INSERT INTO Performer_Medications (Performer_ID, Medications)
VALUES
(1, 'None'),
(2, 'Ibuprofen'),
(3, 'Albuterol');

-- Inserting data into Performer_Aerialist
INSERT INTO Performer_Aerialist (Performer_ID, Sport, Equipment)
VALUES
(1, 'Trapeze', 'Harness');

-- Inserting data into Performer_Entertainer
INSERT INTO Performer_Entertainer (Performer_ID, Main_Act)
VALUES
(3, 'Clowning');

-- Inserting data into Performer_Musician
INSERT INTO Performer_Musician (Performer_ID, Instrument)
VALUES
(2, 'Guitar'),
(2, 'Piano');

-- Inserting data into Emergency_Contact
INSERT INTO Emergency_Contact (Performer_ID, First_Name, Last_Name, Phone_Number, Relationship)
VALUES
(1, 'James', 'Davis', '555-1234', 'Brother'),
(2, 'Mia', 'Taylor', '555-5678', 'Sister'),
(3, 'Gabriel', 'Martinez', '555-9101', 'Father');

-- Inserting data into Held_At
INSERT INTO Held_At (Show_Name, Show_Year, Venue_ID, Date, Location)
VALUES
('Alegria', 2023, 1, '2023-06-15', 'Main Stage'),
('Kooza', 2023, 2, '2023-07-20', 'Outdoor Arena'),
('Corteo', 2023, 1, '2023-08-10', 'Main Stage');









