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
-- Step 3: Create the Long Table (while connecting it to the other tables)
CREATE TABLE unemployment_long (
  year INT REFERENCES macro_years(year),
  month TEXT,
  month_num INT,
  unemployment_rate FLOAT,
  PRIMARY KEY (year, month)
);

-- Step 4: Transform and Insert (Wide → Long)
INSERT INTO unemployment_long (year, month, month_num, unemployment_rate)
SELECT
  year,
  m.month,
  m.month_num,
  m.unemployment_rate
FROM unemployment_wide
CROSS JOIN LATERAL (
  VALUES
    ('Jan', 1, jan), ('Feb', 2, feb), ('Mar', 3, mar), ('Apr', 4, apr),
    ('May', 5, may), ('Jun', 6, jun), ('Jul', 7, jul), ('Aug', 8, aug),
    ('Sep', 9, sep), ('Oct', 10, oct), ('Nov', 11, nov), ('Dec', 12, dec)
) AS m(month, month_num, unemployment_rate);

-- Step 5 : Drop Wide Table (optional)
DROP TABLE unemployment_wide; 

-- Step 6 : Index 
CREATE INDEX idx_unemployment_long_year_month ON unemployment_long(year, month);

