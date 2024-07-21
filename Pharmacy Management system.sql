CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    sex VARCHAR(10),
    contact VARCHAR(15),
    address VARCHAR(255),
    insurance_info VARCHAR(255)
);

CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialty VARCHAR(100)
);

CREATE TABLE Seen (
    patient_id INT,
    doctor_id INT,
    PRIMARY KEY (patient_id, doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

CREATE TABLE Prescription (
    prescription_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    drug_id INT,
    date DATE,
    quantity INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (drug_id) REFERENCES Drug(drug_id)
);

CREATE TABLE Drug_Manufacturer (
    manufacturer_id INT PRIMARY KEY,
    name VARCHAR(100),
    company_id INT,
    address VARCHAR(255)
);

CREATE TABLE Drug (
    drug_id INT PRIMARY KEY,
    trade_name VARCHAR(100),
    manufacturer_id INT,
    FOREIGN KEY (manufacturer_id) REFERENCES Drug_Manufacturer(manufacturer_id)
);

CREATE TABLE Make (
    manufacturer_id INT,
    drug_id INT,
    PRIMARY KEY (manufacturer_id, drug_id),
    FOREIGN KEY (manufacturer_id) REFERENCES Drug_Manufacturer(manufacturer_id),
    FOREIGN KEY (drug_id) REFERENCES Drug(drug_id)
);

CREATE TABLE Pharmacy (
    pharmacy_id INT PRIMARY KEY,
    name VARCHAR(100),
    fax VARCHAR(15),
    address VARCHAR(255)
);

CREATE TABLE Sell (
    pharmacy_id INT,
    drug_id INT,
    price DECIMAL(10, 2),
    PRIMARY KEY (pharmacy_id, drug_id),
    FOREIGN KEY (pharmacy_id) REFERENCES Pharmacy(pharmacy_id),
    FOREIGN KEY (drug_id) REFERENCES Drug(drug_id)
);

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    pharmacy_id INT,
    FOREIGN KEY (pharmacy_id) REFERENCES Pharmacy(pharmacy_id)
);

CREATE TABLE Work (
    employee_id INT,
    pharmacy_id INT,
    shift_start TIME,
    shift_end TIME,
    PRIMARY KEY (employee_id, pharmacy_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (pharmacy_id) REFERENCES Pharmacy(pharmacy_id)
);

CREATE TABLE Contract (
    manufacturer_id INT,
    pharmacy_id INT,
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (manufacturer_id, pharmacy_id),
    FOREIGN KEY (manufacturer_id) REFERENCES Drug_Manufacturer(manufacturer_id),
    FOREIGN KEY (pharmacy_id) REFERENCES Pharmacy(pharmacy_id)
);
