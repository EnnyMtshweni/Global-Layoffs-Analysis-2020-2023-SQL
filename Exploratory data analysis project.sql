-- Exploratory Data Analysis

SELECT *
FROM staging_layoffs2;

SELECT *
FROM staging_layoffs2
WHERE company LIKE 'clearco%';

UPDATE staging_layoffs2
SET company = 'ClearCo'
WHERE company LIKE 'clearco%';

SELECT MAX(total_laid_off) , Max(percentage_laid_off)
FROM staging_layoffs2;

SELECT  *
FROM staging_layoffs2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;
 
SELECT company, SUM(total_laid_off)
FROM staging_layoffs2
GROUP BY 1
ORDER BY 2 DESC;

SELECT MIN(`date`) , MAX(`date`)
FROM staging_layoffs2;

SELECT `date`, SUM(total_laid_off)
FROM staging_layoffs2
GROUP BY `date`
ORDER BY 2 DESC;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM staging_layoffs2
GROUP BY YEAR(`date`)
ORDER BY 2 DESC;

SELECT industry, SUM(total_laid_off)
FROM staging_layoffs2
GROUP BY industry
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off)
FROM staging_layoffs2
GROUP BY country
ORDER BY 2 DESC;


SELECT stage, SUM(total_laid_off)
FROM staging_layoffs2
GROUP BY stage
ORDER BY 1 DESC;

SELECT *
FROM staging_layoffs2;

-- each total  loss per company
SELECT company, SUBSTRING(`date`, 1,7) AS month, SUM(total_laid_off)
FROM staging_layoffs2
WHERE SUBSTRING(`date`, 1,7) IS NOT NULL
GROUP BY  `month`, company
ORDER BY 2 ASC;

-- total of people were lost each month globally
SELECT SUBSTRING(`date`, 1,7) AS month, SUM(total_laid_off)
FROM staging_layoffs2
WHERE SUBSTRING(`date`, 1,7) IS NOT NULL
GROUP BY  `month`
ORDER BY 1 ASC;

WITH Rolling_total_cte AS
(
SELECT SUBSTRING(`date`, 1,7) AS month, SUM(total_laid_off) AS Monthly_total
FROM staging_layoffs2
WHERE SUBSTRING(`date`, 1,7) IS NOT NULL
GROUP BY  `month`
ORDER BY 1 ASC
)
SELECT `month`, (Monthly_total)
,SUM(Monthly_total) OVER (ORDER BY `month`) AS rolling_total
FROM Rolling_total_cte;

-- how many people were lost in each company yearly globally. 
SELECT company, year(`date`), SUM(total_laid_off)
FROM staging_layoffs2
GROUP BY company, year(`date`)
ORDER BY company DESC;

SELECT company, year(`date`), SUM(total_laid_off)
FROM staging_layoffs2
GROUP BY company, year(`date`)
ORDER BY 3 DESC;

-- rank which year they have to let go their employees most and least using cte

WITH Company_year_cte (company, years, total_laid_off) AS
(
SELECT company, year(`date`), SUM(total_laid_off)
FROM staging_layoffs2
GROUP BY company, year(`date`)
), Company_year_rank AS
(
SELECT *,
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM company_year_cte
WHERE years IS NOT NULL
)
SELECT *
FROM Company_year_rank
WHERE RANKING <= 5;

-- Temporal (Time-based) Insights
SELECT company, QUARTER(`date`) AS quarter, YEAR(`date`) AS year,
SUM(total_laid_off) FROM staging_layoffs2 GROUP BY company, year, quarter ORDER BY
year, quarter;
