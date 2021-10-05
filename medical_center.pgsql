DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center; 

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name CHAR NOT NULL,
    last_name TEXT NOT NULL,
    sex TEXT NOT NULL,
    age INTEGER CHECK (age > 0)
)

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    sex TEXT NOT NULL,
    age INTEGER CHECK (age > 0)
)

CREATE  TABLE diseases(
    id SERIAL PRIMARY KEY,
    disease TEXT UNIQUE NOT NULL
)


CREATE TABLE patient_doctor(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    symptom_id INTEGER REFERENCES diseases ON DELETE CASCADE,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE
)