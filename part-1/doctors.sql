DROP DATABASE IF EXISTS  mc;

CREATE DATABASE mc;

\c mc

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    doc_name TEXT,
    specialty TEXT
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    birthday DATE NOT NULL,
    insurance TEXT
);

CREATE TABLE diseases 
(
    id SERIAL PRIMARY KEY,
    disease_name TEXT
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients,
    doctor_id INTEGER REFERENCES doctors,
    visit_date DATE
);

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits,
    disease_id INTEGER REFERENCES diseases,
    notes TEXT
);

