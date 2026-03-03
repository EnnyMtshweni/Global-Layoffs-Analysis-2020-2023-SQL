-- Data Cleaning

-- STEP 1 STAGING MAKING A COPY 
SELECT *
FROM layoffs;

CREATE TABLE staging_layoffs
LIKE layoffs;

-- CHECK IF IS CREATED
SELECT *
FROM staging_layoffs;

INSERT staging_layoffs
SELECT *
FROM layoffs;

-- CHECK IF IS INSERTED
SELECT *
FROM staging_layoffs;

-- STAGE 2 DATA CLEANING STAGES

-- step 1 remove duplicates

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num
FROM staging_layoffs;

WITH cte_duplicate AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num
FROM staging_layoffs
)
SELECT *
FROM cte_duplicate
WHERE row_num> 1;

-- check if each company it does have duplicates/ just to make sure but not necessary can choose 1 to double check.

SELECT *
FROM staging_layoffs
WHERE company = 'casper';

CREATE TABLE `staging_layoffs2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM staging_layoffs2;

INSERT INTO staging_layoffs2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num
FROM staging_layoffs;


SELECT *
FROM staging_layoffs2;

-- check duplicate again
SELECT *
FROM staging_layoffs2
WHERE row_num > 1;


DELETE 
FROM staging_layoffs2
WHERE row_num > 1;

-- check if they are gone
SELECT *
FROM staging_layoffs2
WHERE row_num > 1;

-- check agin if duplicates are removed
SELECT *
FROM staging_layoffs2;

-- STEP 2 STANDARDISE DATA

-- if you want to check the colomn individually to check errors, you can use DIStinct for example number 1

SELECT distinct industry
FROM staging_layoffs2
order by 1;

SELECT *
FROM staging_layoffs2;

-- number 2 remove white spaces, for great postionion of ypur data
SELECT company, TRIM(company)
FROM staging_layoffs2;

UPDATE staging_layoffs2
SET company = TRIM(company);

SELECT *
FROM staging_layoffs2;

-- number 3 fix the real issues such as spelling, and things thaat are the same but not labelled the same.alter
SELECT distinct industry
FROM staging_layoffs2
GROUP BY 1;

-- check everything that has name crypto in it
SELECT *
FROM staging_layoffs2
WHERE industry LIKE 'crypto%';

UPDATE staging_layoffs2
SET industry = 'crypto'
WHERE industry LIKE 'crypto%';

-- number 4 removing things at the end of the word you can use Trailing coz it allows you to specify what you want
SELECT distinct country
FROM staging_layoffs2
GROUP BY 1; 

SELECT distinct country, TRIM(TRAILING '.' FROM country)
FROM staging_layoffs2
GROUP BY 1;

UPDATE staging_layoffs2
SET country =  TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT distinct country
FROM staging_layoffs2
GROUP BY 1; 

-- number 5 time series changing the date from text to date format

SELECT `date`,
str_to_date( `date`, ' %m/%d/%Y ')
FROM staging_layoffs2;

UPDATE staging_layoffs2
SET `date` = str_to_date( `date`, ' %m/%d/%Y ');

SELECT `date`
FROM staging_layoffs2;

ALTER TABLE staging_layoffs2
MODIFY COLUMN `date` DATE;

SELECT *
FROM staging_layoffs2;

-- STEP 3 null value and blank values 
-- display information
SELECT *
FROM staging_layoffs2;

-- now that you have checked, and realised which colomn has null filter that to find missing data
SELECT *
FROM staging_layoffs2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- change blanks to null for consistency
UPDATE staging_layoffs2
SET industry = NULL
WHERE industry = '';

-- use self join to locate other rows of the same company that do have missing information.alter
-- ERROR HERE COZ WE ALREADY CONVERTED
SELECT *
FROM staging_layoffs2
WHERE industry = 'NULL'
OR industry =  '';

SELECT *
FROM staging_layoffs2 t1
JOIN staging_layoffs2 t2
	ON t1.company = t2.company
 WHERE t1.industry IS NULL
 AND t2.industry IS NOT NULL;
 
 UPDATE staging_layoffs2 t1
 JOIN staging_layoffs2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
 WHERE t1.industry IS NULL
 AND t2.industry IS NOT NULL;
 
 SELECT distinct industry
 FROM staging_layoffs2
 GROUP BY 1;
 
 -- STEP 4 REMOVING EXTRA COLOMNS AND ROWS WE DONT NEED
 
 -- check coloms and rows that have null and filter that
 
 SELECT *
 FROM staging_layoffs2
 WHERE total_laid_off IS NULL
 AND percentage_laid_off IS NULL;
 
 -- DELETE ROWS
 DELETE
 FROM staging_layoffs2
 WHERE total_laid_off IS NULL
 AND percentage_laid_off IS NULL;
 
 -- check if deleted
 
 SELECT *
 FROM staging_layoffs2
 WHERE total_laid_off IS NULL
 AND percentage_laid_off IS NULL;
 
 -- now remove extra added colomns eg row-num
 
 ALTER TABLE staging_layoffs2
 DROP COLUMN  row_num;
 
 SELECT *
 FROM staging_layoffs2;