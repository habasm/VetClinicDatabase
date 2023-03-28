-- Creeate database
CREATE DATABASE vet_clinic;

-- Create table
CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL,
    PRIMARY KEY (id)
);

-- Add 'species' column of type string to animals table
ALTER TABLE animals ADD COLUMN species VARCHAR(100);

