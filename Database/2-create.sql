-- Create AuthPhysician table
CREATE TABLE AuthPhysician (
    AuthPh_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Physician_ID INT NOT NULL UNIQUE,
    AuPh_Username VARCHAR(50) NOT NULL UNIQUE,
    AuPh_Password VARCHAR(50) NOT NULL UNIQUE,
    FOREIGN KEY (Physician_ID) REFERENCES Physician(Physician_ID)
);

-- Create AuthEmployees table
CREATE TABLE AuthEmployees (
    AuthEm_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Employee_ID INT NOT NULL UNIQUE,
    AuEm_Username VARCHAR(50) NOT NULL UNIQUE,
    AuEm_Password VARCHAR(50) NOT NULL,
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);

-- Create AuthReception table
CREATE TABLE AuthReception (
    AuthRe_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Reception_ID INT NOT NULL UNIQUE,
    AuRe_Username VARCHAR(200) NOT NULL UNIQUE,
    AuRe_Password VARCHAR(200) NOT NULL,
    FOREIGN KEY (Reception_ID) REFERENCES Reception(Reception_ID)
);

-- Create AuthMember table
CREATE TABLE AuthMember (
    AuthMe_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Member_ID INT NOT NULL,
    AuMe_Username VARCHAR(200) NOT NULL UNIQUE,
    AuMe_Password VARCHAR(200) NOT NULL UNIQUE,
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID)
);

CREATE TABLE OrderLab (
    OrderLab_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Physician_ID INT NOT NULL,
    Card_ID CHAR(13) NOT NULL,
    Physician_Name VARCHAR(200) NOT NULL,
    Emergency_Case BOOLEAN,
    OrderDate TIMESTAMP NOT NULL,
    OrderLabStatus VARCHAR(25) NOT NULL,
    FOREIGN KEY (Physician_ID) REFERENCES Physician(Physician_ID)
);

-- Create Appointment table
CREATE TABLE Appointment (
    App_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    OrderLab_ID INT NOT NULL,
    Member_ID INT NOT NULL,
    App_AppointDate DATE,
    App_AppointTime TIME,
    App_AcceptDate TIMESTAMP,
    FOREIGN KEY (OrderLab_ID) REFERENCES OrderLab(OrderLab_ID),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID)
);

-- Create Accept_Appointment table
CREATE TABLE Accept_Appointment (
    Acp_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    App_ID INT NOT NULL,
    Acp_Status VARCHAR(200),
    Acp_AcceptDate TIMESTAMP,
    FOREIGN KEY (App_ID) REFERENCES Appointment(App_ID)
);

-- Create QRCodeSample table
CREATE TABLE QRCodeSample (
    QRCode_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Acp_ID INT,
    QRCode_image VARCHAR(200),
    QRCode_Date TIMESTAMP,
    FOREIGN KEY (Acp_ID) REFERENCES Accept_Appointment(Acp_ID)
);


-- Create SelectedItems
CREATE TABLE SelectedItems (
    SelectedItems_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    QRCode_ID INT NOT NULL,
    Item_ID INT NOT NULL,
    SelectedItems_amount DECIMAL(65,30),
    SelectedItems_Date TIMESTAMP NOT NULL,
    FOREIGN KEY (QRCode_ID) REFERENCES QRCodeSample(QRCode_ID),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);

CREATE TABLE RecordLab (
    RecordLab_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Acp_ID INT NOT NULL,
    CBC VARCHAR(200),
    Hematocrit DECIMAL(65, 30),
    ESR DECIMAL(65, 30),
    PT_INR DECIMAL(65, 30),
    aPTT DECIMAL(65, 30),
    TT DECIMAL(65, 30),
    ABO_gr CHAR(2),
    Rh_gr VARCHAR(200),
    Urine_Analysis BOOLEAN,
    Pregnancy_Test VARCHAR(200),
    Stool_Exam BOOLEAN,
    Occult_Blood BOOLEAN,
    Wet_Smear BOOLEAN,
    RPR VARCHAR(200),
    TPHA VARCHAR(200),
    HIV_Ag_Ab VARCHAR(200),
    HBsAg VARCHAR(200),
    Anti_HBs VARCHAR(200),
    Anti_HCV VARCHAR(200),
    Anti_HBc_Total VARCHAR(200),
    Anti_HBc_IgM VARCHAR(200),
    Anti_HAV_IgM VARCHAR(200),
    HBeAg VARCHAR(200),
    Melioid_titer VARCHAR(200),
    CA_125 DECIMAL(65, 30),
    Ca_15_3 DECIMAL(65, 30),
    CA_19_9 DECIMAL(65, 30),
    AFP DECIMAL(65, 30),
    CEA DECIMAL(65, 30),
    PSA DECIMAL(65, 30),
    B_HCG VARCHAR(200),
    Free_T4 DECIMAL(65, 30),
    Free_T3 DECIMAL(65, 30),
    TSH DECIMAL(65, 30),
    Cortisol DECIMAL(65, 30),
    Blood_Sugar DECIMAL(65, 30),
    BUN DECIMAL(65, 30),
    Creatinine DECIMAL(65, 30),
    GFR DECIMAL(65, 30),
    Uric_acid DECIMAL(65, 30),
    Electrolyte_Na_Cl_K_CO2 DECIMAL(65, 30),
    HbAlC DECIMAL(65, 30),
    Calcium DECIMAL(65, 30),
    Phosphorus DECIMAL(65, 30),
    Magnesium DECIMAL(65, 30),
    Serum_Iron DECIMAL(65, 30),
    TIBC DECIMAL(65, 30),
    Ferritin DECIMAL(65, 30),
    GGT DECIMAL(65, 30),
    Cholesterol_LFT DECIMAL(65, 30),
    Total_protein DECIMAL(65, 30),
    Albumin DECIMAL(65, 30),
    Direct_bilirubin DECIMAL(65, 30),
    Total_bilirubin DECIMAL(65, 30),
    AST_SGOT DECIMAL(65, 30),
    ALT_SGPT DECIMAL(65, 30),
    Alkaline_Phosphatase DECIMAL(65, 30),
    Cholesterol_Lupid_Profile DECIMAL(65, 30),
    Triglyceride DECIMAL(65, 30),
    HDL_Cholesterol DECIMAL(65, 30),
    LDL_Cholesterol DECIMAL(65, 30),
    LDL_Direct DECIMAL(65, 30),
    Creatinine_24_hrs DECIMAL(65, 30),
    Protein_24_hrs DECIMAL(65, 30),
    Creatinine_random DECIMAL(65, 30),
    Protein_random DECIMAL(65, 30),
    Microalbumin DECIMAL(65, 30),
    Urine_Na_K_Cl DECIMAL(65, 30),
    AFB_stain VARCHAR(200),
    Gram_stain VARCHAR(200),
    Hemo_I VARCHAR(200),
    Hemo_II VARCHAR(200),
    Sputum VARCHAR(200),
    PUS VARCHAR(200),
    Urine VARCHAR(200),
    RSC DECIMAL(65, 30),
    Fluid VARCHAR(200),
    CSF VARCHAR(200),
    LDH DECIMAL(65, 30),
    CPK DECIMAL(65, 30),
    Amylase_Urine DECIMAL(65, 30),
    Amylase_Serum DECIMAL(65, 30),
    ADA_Urine VARCHAR(200),
    ADA_Serum DECIMAL(65, 30),
    Osmolarity_Urine DECIMAL(65, 30),
    Osmolarity_Serum DECIMAL(65, 30),
    Ketone VARCHAR(200),
    Lipase DECIMAL(65, 30),
    Transferin DECIMAL(65, 30),
    Parathyroid DECIMAL(65, 30),
    L_Lactate DECIMAL(65, 30),
    Troponin_I DECIMAL(65, 30),
    Prolactin DECIMAL(65, 30),
    LH DECIMAL(65, 30),
    FSH DECIMAL(65, 30),
    Estradiol_E2 DECIMAL(65, 30),
    Insulin DECIMAL(65, 30),
    Testosterone DECIMAL(65, 30),
    Thyroglobulin DECIMAL(65, 30),
    Anti_Thyroglobulin VARCHAR(200),
    Microsomal_Ab DECIMAL(65, 30),
    Phenobarbital DECIMAL(65, 30),
    PhenyItoin_Dilantin DECIMAL(65, 30),
    Digoxin DECIMAL(65, 30),
    Valproic_Depakin DECIMAL(65, 30),
    Carbamazepine DECIMAL(65, 30),
    Vancomycin DECIMAL(65, 30),
    NT_ProBNP DECIMAL(65, 30),
    Chromosome_Study VARCHAR(200),
    Aldosterone DECIMAL(65, 30),
    Renin DECIMAL(65, 30),
    Anti_Smooth_Muscle VARCHAR(200),
    C_peptide DECIMAL(65, 30),
    JAK2_gene_Mutation VARCHAR(200),
    HLA_B_5801 VARCHAR(200),
    TSH_Recceptor_Ab VARCHAR(200),
    ANA_Profile VARCHAR(200),
    Vitamin_B12 DECIMAL(65, 30),
    Folate DECIMAL(65, 30),
    Urine_VMA DECIMAL(65, 30),
    Chikungunya_IgG_IgM VARCHAR(200),
    Rheumatoid_factor DECIMAL(65, 30),
    C_Reactive_Protein DECIMAL(65, 30),
    ASO DECIMAL(65, 30),
    ANA_ANF_FANA VARCHAR(200),
    Anti_ds_DNA VARCHAR(200),
    Anti_Smith VARCHAR(200),
    Beta_1_C_C3c DECIMAL(65, 30),
    C4_Complement DECIMAL(65, 30),
    Crypto_Ag VARCHAR(200),
    Dengue_Ag_Ab VARCHAR(200),
    Scrub_typhus VARCHAR(200),
    Vitamin_D DECIMAL(65, 30),
    HBV_Viral_load VARCHAR(200),
    HCV_Viral_load VARCHAR(200),
    HSV_PCR VARCHAR(200),
    CMV_PCR VARCHAR(200),
    TB_PCR VARCHAR(200),
    Anti_CCP DECIMAL(65, 30),
    Anti_Car_IgG_IgM VARCHAR(200),
    Beta2_IgG_IgM VARCHAR(200),
    VDRL_CSF VARCHAR(200),
    D_dimer DECIMAL(65, 30),
    Lupus_anticoagulant VARCHAR(200),
    LE_cell VARCHAR(200),
    Fetal_cell VARCHAR(200),
    OF_Test VARCHAR(200),
    DCIP VARCHAR(200),
    G_6_PD VARCHAR(200),
    Reticulocyte DECIMAL(65, 30),
    Inclusion_body VARCHAR(200),
    Heinz_body VARCHAR(200),
    Hb_Typing VARCHAR(200),
    Anti_Cardiolipin_IgA VARCHAR(200),
    Beta2Glycoprotein_IgA VARCHAR(200),
    Anti_HAV_Total VARCHAR(200),
    Anti_HAB_IgG VARCHAR(200),
    Anti_HBe VARCHAR(200),
    Anti_thrombin_III FLOAT(1),
    Protein_C DECIMAL(65, 30),
    Protein_S DECIMAL(65, 30),
    Anti_DNaseB DECIMAL(65, 30),
    TB_culture VARCHAR(200),
    RecordLab_Date TIMESTAMP,
    FOREIGN KEY (Acp_ID) REFERENCES Accept_Appointment(Acp_ID)
);

CREATE TABLE Billing (
    BillID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Acp_ID INT NOT NULL,
    SelectedItems_ID INT NOT NULL,
    Item_Name VARCHAR(200),
    Item_Price DECIMAL(8, 2) NOT NULL,
    Bill_Channel VARCHAR(200),
    Bill_Evidence VARCHAR(200) NOT NULL,
    Bill_Price DECIMAL(8, 2) NOT NULL,
    Bill_Cost DECIMAL(8, 2) NOT NULL,
    Bill_Status VARCHAR(200) NOT NULL,
    Bill_Date TIMESTAMP,
    FOREIGN KEY (Acp_ID) REFERENCES Accept_Appointment(Acp_ID),
    FOREIGN KEY (SelectedItems_ID) REFERENCES SelectedItems(SelectedItems_ID)
);

CREATE TABLE Summary (
    Payment_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Bill_ID INT NOT NULL,
    Pay_OutCome DECIMAL(8, 2) NOT NULL,
    Pay_InCome DECIMAL(8, 2),
    Pay_NetBalance DECIMAL(8, 2),
    FOREIGN KEY (Bill_ID) REFERENCES Billing(BillID)
);

-- Create LabAccept table
CREATE TABLE LabAccept (
    LabAccept_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    RecordLab_ID INT NOT NULL,
    LabAccept_Descrip VARCHAR(200),
    Employee_ID INT NOT NULL,
    Employee_Name VARCHAR(200) NOT NULL,
    LabAccept_Date TIMESTAMP NOT NULL,
    FOREIGN KEY (RecordLab_ID) REFERENCES RecordLab(RecordLab_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);

-- Create ReportLab table
CREATE TABLE ReportLab (
    ReportLab_ID INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    LabAccept_ID INT NOT NULL,
    ReportLab_Descrip VARCHAR(200),
    Employee_ID INT NOT NULL,
    Employee_Name VARCHAR(200) NOT NULL,
    ReportLab_Date TIMESTAMP NOT NULL,
    FOREIGN KEY (LabAccept_ID) REFERENCES LabAccept(LabAccept_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);
