/*Queries that provide answers to the questions from all projects.*/
-- Animals whose name ends with "mon"
SELECT * from animals WHERE name LIKE '%mon';

-- Names of animals born between 2016 and 2019
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- Names of animals that are neutered and have less than 3 escape attempts
SELECT name from animals WHERE neutered = true AND escape_attempts < 3;

-- Date of birth of animals named either "Agumon" or "Pikachu"
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';

-- Names and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;

-- Animals that are neutered
SELECT * from animals WHERE neutered = true;

-- Animals not named Gabumon
SELECT * from animals WHERE name != 'Gabumon';

-- Animals that weigh 10.4 kg to 17.3 kg
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


-- Update the species column to 'unspecified' inside a transaction.
BEGIN;
UPDATE animals SET species = 'unspecified';

-- Verify that changes were made.
SELECT * FROM animals;

-- Roll back the changes.
ROLLBACK;

-- Verify that changes were rolled back.
SELECT * FROM animals;


-- Inside a transaction:
BEGIN;

-- Update the species column to 'digimon' for all animals that have a name ending in 'mon'.
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

-- Update the species column to 'pokemon' for all animals that don't have species already set.
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

-- Commit the transaction.
COMMIT;

-- Verify that change was made and persists after commit.
SELECT * FROM animals;


-- Inside a transaction:
BEGIN;

-- Delete all records in the animals table.
DELETE FROM animals;

-- Roll back the transaction.
ROLLBACK;

-- Verify if all records in the animals table still exists.
SELECT * FROM animals;


-- Inside a transaction:
BEGIN;

-- Delete all animals born after Jan 1st, 2022.
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

-- Create a savepoint for the transaction.
SAVEPOINT savepoint;

-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1;

-- Rollback to the savepoint.
ROLLBACK TO savepoint;

-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

-- Commit transaction.
COMMIT;


-- Queries that answer the following questions:

-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals 
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;
