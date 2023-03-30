-- project one ---
insert into animals (id,name,date_of_birth, escape_attempts, neutered, weight_kg)
values (1,'Agumon','2020-02-03',0,true,12.23);
insert into animals (id,name,date_of_birth, escape_attempts, neutered, weight_kg)
values (2,'Gabumon','2018-11-15',2,true,8);
insert into animals (id,name,date_of_birth, escape_attempts, neutered, weight_kg)
values (3,'Pikachu','2021-01-07',1,false,15.04);
insert into animals (id,name,date_of_birth, escape_attempts, neutered, weight_kg)
values (4,'Devimon','2017-05-12',5,true,11);
select * from animals;
-- project two ---
insert into animals (id,name,date_of_birth, escape_attempts, neutered, weight_kg)
values (5,'Charmander','2020-02-08',0,false,-11);

insert into animals (id,name,date_of_birth, escape_attempts, neutered, weight_kg)
values (6,'Plantmon','2021-11-15',2,true,-5.7);

insert into animals (id,name,date_of_birth, escape_attempts, neutered, weight_kg)
values (7,'Squirtle','1993-04-02',3,false,-12.13);

insert into animals (id,name,date_of_birth, escape_attempts, neutered, weight_kg)
values (8,'Angemon','2005-06-12',1,true,-45);

insert into animals (id,name,date_of_birth, escape_attempts, neutered, weight_kg)
values (9,'Boarmon','2005-06-07',7,true,20.4);

insert into animals (id,name,date_of_birth, escape_attempts, neutered, weight_kg)
values (10,'Blossom','1998-10-13',3,true,17);

insert into animals (id,name,date_of_birth, escape_attempts, neutered, weight_kg)
values (11,'Ditto','2022-05-14',4,true,22);

--- project three ---
INSERT INTO owners (full_name, age) VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);
INSERT INTO species (name) VALUES
  ('Pokemon'),
  ('Digimon');
UPDATE animals
SET species_id = 
  CASE 
    WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
    ELSE (SELECT id FROM species WHERE name = 'Pokemon')
  END;

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Agumon' AND owners.full_name = 'Sam Smith';

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Gabumon'  AND owners.full_name = 'Jennifer Orwell' or 
      animals.name = 'Pikachu' AND owners.full_name = 'Jennifer Orwell';

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Devimon' AND owners.full_name = 'Bob' or 
      animals.name = 'Plantmon' AND owners.full_name = 'Bob';

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Charmander' AND owners.full_name = 'Melody Pond' or
      animals.name = 'Squirtle' AND owners.full_name = 'Melody Pond' or
      animals.name = 'Blossom' AND owners.full_name = 'Melody Pond';

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Angemon' AND owners.full_name = 'Dean Winchester' or
      animals.name = 'Boarmon' AND owners.full_name = 'Dean Winchester';