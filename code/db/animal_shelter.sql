DROP TABLE animals;
DROP TABLE owners;

CREATE TABLE owners (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE animals (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  admission_date VARCHAR(255),
  adoptable BOOLEAN NOT NULL,
  owner_id INT8 DEFAULT 1,
  
  CONSTRAINT fk_owner_id
    FOREIGN KEY (owner_id)
    REFERENCES owners (id)
    ON DELETE SET DEFAULT
);