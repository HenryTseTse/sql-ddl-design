-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    specialty TEXT NOT NULL
)

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    birthday TEXT NOT NULL,
    insurance BOOLEAN
)

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE
    date TEXT NOT NULL,
)

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
)

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    visit_id TEXT REFERENCES diagnoses ON DELETE CASCADE,
    disease_id TEXT REFERENCES diseases ON DELETE CASCADE
)