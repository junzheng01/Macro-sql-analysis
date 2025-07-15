-- Step 1: Create the Wide Table
CREATE TABLE unemployment_wide (
  year INTEGER PRIMARY KEY,
  jan FLOAT,
  feb FLOAT,
  mar FLOAT,
  apr FLOAT,
  may FLOAT,
  jun FLOAT,
  jul FLOAT,
  aug FLOAT,
  sep FLOAT,
  oct FLOAT,
  nov FLOAT,
  dec FLOAT
);

-- Step 2: Populate the Wide Table
-- Step 3: Create the Long Table
CREATE TABLE unemployment_long (
  year INTEGER,
  month TEXT,
  unemployment_rate FLOAT,
  PRIMARY KEY (year, month)
);

-- Step 4: Transform and Insert (Wide → Long)
INSERT INTO unemployment_long (year, month, unemployment_rate)
SELECT
  year,
  month,
  unemployment_rate
FROM unemployment_wide
CROSS JOIN LATERAL (
  VALUES
    ('Jan', jan), ('Feb', feb), ('Mar', mar), ('Apr', apr),
    ('May', may), ('Jun', jun), ('Jul', jul), ('Aug', aug),
    ('Sep', sep), ('Oct', oct), ('Nov', nov), ('Dec', dec)
) AS m(month, unemployment_rate);

-- Step 5 : Drop Wide Table (optional)
DROP TABLE unemployment_wide; 
