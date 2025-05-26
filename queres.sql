-- Active: 1747567010552@@127.0.0.1@5432@conservation_db
CREATE TABLE rangers (
  ranger_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  region VARCHAR(50) NOT NULL
);

CREATE TABLE  species(
    species_id SERIAL PRIMARY key,
    common_name VARCHAR(100) not null,
    scientific_name VARCHAR(100) not null,
    discovery_date date not null,
    conservation_status VARCHAR(50)
)

CREATE TABLE sightings (
  sighting_id SERIAL PRIMARY KEY,
  ranger_id INT REFERENCES rangers(ranger_id) ON DELETE CASCADE,
  species_id INT REFERENCES species(species_id) ON DELETE CASCADE,
  sighting_time TIMESTAMP NOT NULL,
  location VARCHAR(150) NOT NULL,
  notes TEXT
);
INSERT INTO rangers VALUES
(DEFAULT, 'Alice Green', 'Northern Hills'),
(DEFAULT, 'Bob White', 'River Delta'),
(DEFAULT, 'Carol King', 'Mountain Range');

select *from rangers;

INSERT INTO species VALUES
(DEFAULT, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(DEFAULT, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(DEFAULT, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(DEFAULT, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

select *FROM species;

INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

SELECT *FROM sightings;

--problem 01
insert into rangers VALUES (DEFAULT,'Derek Fox','Coastal Plains');

-- problem 02
SELECT COUNT(DISTINCT species_id) as unique_species_count FROM sightings;

-- problem 03
select *from sightings WHERE location ilike '%pass%';


--problem 04
SELECT rangers.name, COUNT(sightings.sighting_id) as total_sightings FROM rangers LEFT JOIN  sightings ON rangers.ranger_id = sightings.ranger_id GROUP BY rangers.name;

--problem 05
SELECT s.common_name FROM species s LEFT JOIN sightings si ON s.species_id = si.species_id
WHERE si.species_id IS NULL;


--problem 06
SELECT sp.common_name, s.sighting_time, r.name FROM sightings s
JOIN species sp ON s.species_id = sp.species_id
JOIN rangers r ON s.ranger_id = r.ranger_id
ORDER BY s.sighting_time DESC
LIMIT 2;

--problem 07

UPDATE species SET conservation_status = 'Historic' WHERE discovery_date < '1800-01-01';


--problem 08
SELECT 
  sighting_id,
  CASE
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sightings;


--problem 09
DELETE FROM rangers WHERE ranger_id NOT IN (SELECT DISTINCT ranger_id FROM sightings);
