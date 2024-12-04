-- Part 01: Schema Design - Medical Center

-- Only use this if we are testing... you don't want to 
--  delete data in a DB in production
DROP DATABASE IF EXISTS medical_center_db;
CREATE DATABASE medical_center_db;
\c medical_center_db;

CREATE TABLE doctor(
    id SERIAL PRIMARY KEY,
    name TEXT,
    specialization TEXT
);

CREATE TABLE patient(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT,
    phone VARCHAR(10)
);

CREATE TABLE appointment(
    id SERIAL PRIMARY KEY,
    appt_date DATE,
    patient_id INTEGER REFERENCES patient,
    doctor_id INTEGER REFERENCES doctor,
    notes TEXT
);

CREATE TABLE disease(
    id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT
);

CREATE TABLE treatments(
    id SERIAL PRIMARY KEY,
    disease_id INTEGER REFERENCES disease,
    appointment_id INTEGER REFERENCES appointment,
    notes TEXT
);