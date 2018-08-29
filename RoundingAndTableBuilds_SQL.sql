USE (REDACTED);

CREATE TABLE Data2017 (
State VARCHAR(256),
New2010 int,
New2011 int,
New2012 int,
New2013 int,
New2014 int,
New2015 int,
New2016 int,
New2017 int
);


CREATE TABLE Data2016 (
State VARCHAR(256),
Old2010 int,
Old2011 int,
Old2012 int,
Old2013 int,
Old2014 int,
Old2015 int,
Old2016 int
);

SELECT * FROM Data2016;
SELECT * FROM Data2017;

SELECT State, New2016 AS '2016 Population', New2017 AS '2017 Population', New2017 - New2016 AS 'Population Difference' FROM Data2017;


CREATE TABLE T17 (
State VARCHAR(256),
Year VARCHAR(4),
Population int);

INSERT INTO T17 (State, Year, Population)
SELECT State, 2010, New2010 FROM Data2017;
INSERT INTO T17 (State, Year, Population)
SELECT State, 2011, New2011 FROM Data2017;
INSERT INTO T17 (State, Year, Population)
SELECT State, 2012, New2012 FROM Data2017;
INSERT INTO T17 (State, Year, Population)
SELECT State, 2013, New2013 FROM Data2017;
INSERT INTO T17 (State, Year, Population)
SELECT State, 2014, New2014 FROM Data2017;
INSERT INTO T17 (State, Year, Population)
SELECT State, 2015, New2015 FROM Data2017;
INSERT INTO T17 (State, Year, Population)
SELECT State, 2016, New2016 FROM Data2017;

SELECT * FROM T17;

CREATE TABLE T16 (
State VARCHAR(256),
Year VARCHAR(4),
Population int);

INSERT INTO T16 (State, Year, Population)
SELECT State, 2010, Old2010 FROM Data2016;
INSERT INTO T16 (State, Year, Population)
SELECT State, 2011, Old2011 FROM Data2016;
INSERT INTO T16 (State, Year, Population)
SELECT State, 2012, Old2012 FROM Data2016;
INSERT INTO T16 (State, Year, Population)
SELECT State, 2013, Old2013 FROM Data2016;
INSERT INTO T16 (State, Year, Population)
SELECT State, 2014, Old2014 FROM Data2016;
INSERT INTO T16 (State, Year, Population)
SELECT State, 2015, Old2015 FROM Data2016;
INSERT INTO T16 (State, Year, Population)
SELECT State, 2016, Old2016 FROM Data2016;

SELECT * FROM T16;

SELECT T17.State, T17.Year,
ROUND(T17.Population, -2) - ROUND(T16.Population, -2) AS 'PopulationDelta'
FROM T17 LEFT JOIN T16 ON (T17.State = T16.State AND T17.Year = T16.Year)
WHERE ROUND(T17.Population, -2) - ROUND(T16.Population, -2) >= 10000 
OR ROUND(T17.Population, -2) - ROUND(T16.Population, -2) <= -10000;

SELECT T17.State, T17.Year,
ROUND(T17.Population, -2) - ROUND(T16.Population, -2) AS 'PopulationDelta'
FROM T17 LEFT JOIN T16 ON (T17.State = T16.State AND T17.Year = T16.Year)
WHERE ROUND(T17.Population, -2) - ROUND(T16.Population, -2) >= 10000 
OR ROUND(T17.Population, -2) - ROUND(T16.Population, -2) <= -10000;

SELECT T17.State, T17.Year,
ROUND(T17.Population, -4) - ROUND(T16.Population, -4) AS 'PopulationDelta'
FROM T17 LEFT JOIN T16 ON (T17.State = T16.State AND T17.Year = T16.Year)
WHERE ROUND(T17.Population, -4) - ROUND(T16.Population, -4) >= 10000 
OR ROUND(T17.Population, -4) - ROUND(T16.Population, -4) <= -10000;
