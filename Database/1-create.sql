-- Create Employees

CREATE TABLE Employees (
    Employee_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Em_Prefix VARCHAR(200) NOT NULL,
    Em_FirstName VARCHAR(200) NOT NULL,
    Em_LastName VARCHAR(200) NOT NULL,
    Em_Phone CHAR(10) NOT NULL,
    Em_Email VARCHAR(200)
);

CREATE TABLE Physician (
    Physician_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Physician_Name VARCHAR(200) NOT NULL,
    Physician_Phone CHAR(10) NOT NULL
);

CREATE TABLE Reception (
    Reception_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Re_Prefix VARCHAR(200),
    Re_FirstName VARCHAR(200),
    Re_LastName VARCHAR(200),
    Re_Phone CHAR(10),
    Re_Email VARCHAR(200)
);

CREATE TABLE Member (
    Member_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Card_ID CHAR(13) NOT NULL UNIQUE,
    Me_Prefix VARCHAR(200),
    Me_FirstName VARCHAR(200) NOT NULL,
    Me_LastName VARCHAR(200) NOT NULL,
    Me_BirthDay DATE NOT NULL,
    Me_Religion VARCHAR(200) NOT NULL,
    Me_Ethnicity VARCHAR(200),
    Me_Nationality VARCHAR(200),
    Me_Gender VARCHAR(200) NOT NULL,
    Me_Status VARCHAR(200) ,
    Me_Blood CHAR(2),
    Me_Address VARCHAR(200) NOT NULL,
    Me_SubDistric VARCHAR(200),
    Me_Distric VARCHAR(200),
    Me_Province VARCHAR(200),
    Me_PostalCode CHAR(5),
    Me_Phone CHAR(10) NOT NULL,
    Me_Email VARCHAR(200),
    Me_Drug VARCHAR(200),
    Me_Disease VARCHAR(200)
);

CREATE TABLE PackageLab (
    PackageLab_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    PackageLab_Name VARCHAR(200) NOT NULL,
    PackageLab_Price DECIMAL(65, 30)
);

CREATE TABLE LabTest (
    LabTest_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    LabTest_Name VARCHAR(200) NOT NULL UNIQUE,
    LabTest_Default VARCHAR(200),
    LabTest_Unit VARCHAR(200),
    LabTest_Type VARCHAR(200),
    LabTest_Catagory VARCHAR(200),
    LabTest_Price DECIMAL(65, 30)
);

CREATE TABLE Items (
    Item_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Item_Name VARCHAR(200) NOT NULL,
    Item_Type VARCHAR(200),
    Item_Price DECIMAL(8, 2) NOT NULL,
    Item_Quantity DECIMAL(8, 2) NOT NULL,
    Item_ExpDate DATE,
    Item_DateUp TIMESTAMP
);

CREATE TABLE PackageItem (
    PackageI_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    PackageI_Name VARCHAR(200) NOT NULL,
    PackageI_Type VARCHAR(200)
);


CREATE TABLE Package_Detail (
    PackageI_ID INT NOT NULL,
    Item_ID INT NOT NULL,
    FOREIGN KEY (Item_ID) REFERENCES Items(Item_ID),
    FOREIGN KEY (PackageI_ID) REFERENCES PackageLab(PackageLab_ID)
);

