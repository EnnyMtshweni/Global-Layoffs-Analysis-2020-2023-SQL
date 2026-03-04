# Global Layoffs Analysis (2020-2023).

Background and overview

This project presents an exploratory data analysis (EDA) of global layoffs recorded between 2020 and 2023.
The dataset was cleaned and aggregated using SQL, analysed through structured queries, transformed in Power BI, enhanced with DAX measures, and visualised through an interactive dashboard.

* In the past years, during covid 19 pandemic global companies have experience significant workforce reduction  due to economic uncertainty post covid restructuring and market corrections.
* The objective of this analysis is to identify affected industries, countries, and companies, examine yearly layoff trends, uncover structural patterns, and provide strategic recommendations.

* The SQL queries utilisesd to clean, organise and prepare data for dashboard can be found [Data Cleaning Project.sql](https://github.com/user-attachments/files/25743648/Data.Cleaning.Project.sql)
* The SQL queries utilised to perform Exploratory Data Analysis (EDA) [Exploratory data analysis project.sql](https://github.com/user-attachments/files/25743729/Exploratory.data.analysis.project.sql)
* The Power bi dashboard[Dashboard pdf .pdf](https://github.com/user-attachments/files/25743792/Dashboard.pdf.pdf)
* The layoffs raw copy and cleaned copy of dataset [layoffs raw data copy.csv](https://github.com/user-attachments/files/25743805/layoffs.raw.data.copy.csv)  ,  [Cleaned layoffs Covid data copy.csv](https://github.com/user-attachments/files/25743819/Cleaned.layoffs.Covid.data.copy.csv)

  
## Insights and recommendation 
Isights and recommendation are provided on the following key area:

* Trends analysis
* Comparison
* The why behind numbers

<img width="872" height="461" alt="Screenshot (17)" src="https://github.com/user-attachments/assets/49f65bd4-afe2-4a14-a2d1-959c8ceaf157" />

## 1. Executive Summary

* Between 2020 and 2023, over 1,000 companies reported layoffs affecting approximately 354,000 employees globally.
* Layoffs peaked in 2022 following post-pandemic restructuring. The United States accounted for the majority of job losses, while Consumer and Retail sectors were disproportionately affected. Large multinational technology firms contributed significantly to total layoffs.
* The most severe workforce reductions occurred during the post-pandemic correction phase rather than the initial 2020 disruption.

## 2. Deep Dive Insights

### Yearly Trends – Global Layoffs (2020–2023)

<img width="867" height="394" alt="Screenshot (19)" src="https://github.com/user-attachments/assets/c783cc26-1c44-4ec7-b85a-219a0a7355d6" />

* The onset of the COVID-19 pandemic in 2020 led to widespread operational disruptions as companies temporarily closed or scaled down their activities due to lockdown measures and movement restrictions. As a result, approximately 70,621 layoffs were recorded globally in 2020.

* In 2021, reported layoffs declined significantly to 6,503, suggesting a temporary stabilisation period. This reduction may be attributed to the gradual easing of restrictions, government stimulus interventions, and short-term operational adjustments adopted by businesses. However, 2022 recorded a sharp surge to 135,491 layoffs, marking the highest annual total within the observed period. This spike likely reflects post-pandemic market corrections, restructuring efforts, cost optimisation strategies, and delayed closed or scaled down their activities due to lockdown measures and movement restrictions. As a result, approximately 70,621 layoffs were recorded globally in 2020.

* In 2021, reported layoffs declined significantly to 6,503, suggesting a temporary stabilisation period. This reduction may be attributed to the gradual easing of restrictions, government stimulus interventions, and short-term operational adjustments adopted by businesses.However, 2022 recorded a sharp surge to 135,491 layoffs, marking the highest annual total within the observed period. This spike likely reflects post-pandemic market corrections, restructuring efforts, cost optimisation strategies, and delayed 

### Industry Impact – Comparative Analysis (2020–2023)

<img width="840" height="443" alt="Screenshot (20)" src="https://github.com/user-attachments/assets/01955959-cd4b-4db5-9ca7-6997ba363443" />

* The implementation of COVID-19 lockdown measures significantly disrupted multiple industries due to movement restrictions, supply chain interruptions, and reduced consumer activity. Businesses reliant on physical presence and discretionary spending experienced notable revenue declines.

* Between 2020 and 2023, the five most affected industries in the datasets recorded a combined total of 163,413 layoffs.

#### A breakdown by industry shows:

- Consumer: 38,976 layoffs (23.9%)

- Retail: 38,530 layoffs (23.6%)

- Other Industries: 32,969 layoffs (20.2%)

- Transportation: 29,267 layoffs (17.9%)

- Finance: 23,671 layoffs (14.5%)

* The Consumer and Retail sectors together account for nearly 47.5% of total layoffs, highlighting the disproportionate impact on consumer-facing industries. This pattern suggests that sectors heavily dependent on physical mobility and discretionary spending were more vulnerable to demand contraction during and after the pandemic.

* Transportation was also significantly affected due to travel restrictions and trade slowdowns, while Finance, although impacted, showed comparatively lower workforce reductions and financial pressures that materialised after initial recovery attempts.

* In 2023, layoffs declined to 112,277, yet remained substantially higher than pre-spike levels. This suggests that while some stabilisation occurred, many companies continued restructuring in response to sustained economic uncertainty and changing market conditions.

* Across the four-year period, a cumulative total of approximately 354,000 reported layoffs was recorded. The trend indicates that although short-term recovery was visible in 2021, many organisations struggled to achieve long-term stability, leading to extended workforce reductions and, in some cases, complete business closures.
  
### Geographic Impact – Country Analysis (2020–2023)

<img width="873" height="372" alt="Screenshot (21)" src="https://github.com/user-attachments/assets/7258a22a-4009-4a35-8d3d-a3863d92f553" />

* Layoff activity was heavily concentrated in a small number of countries, with the United States recording the highest number of workforce reductions at 228,249 layoffs. This figure significantly 
exceeds other countries in the dataset and accounts for the overwhelming majority of reported layoffs among the top five nations.

#### Other affected countries include:

* India: 20,500 layoffs

* Netherlands: 16,750 layoffs

* Sweden: 10,782 layoffs

* Brazil: 8,998 layoffs

* Combined, the top five countries recorded approximately 285,279 layoffs, with the United States contributing nearly 80% of this total. The disproportionate impact in the United States may reflect the concentration of large multinational
corporations, particularly in the technology and consumer sectors, which underwent significant post-pandemic restructuring.

* While countries such as India and the Netherlands experienced notable workforce reductions, their totals remain substantially lower, suggesting that large-scale layoffs were more concentrated within mature, high-tech and corporate-heavy economies.

### Company-Level Concentration ( 2020 -2023)

<img width="878" height="367" alt="Screenshot (18)" src="https://github.com/user-attachments/assets/cdee8e94-e2ea-4d87-ad24-f5a563a9d89d" />

#### Layoff activity also appears concentrated among major multinational corporations. The most significant reductions were reported by:

* Amazon – 18,000 layoffs

* Google – 12,000 layoffs

* Meta – 11,000 layoffs

* Microsoft – 10,000 layoffs

* Philips – 10,000 layoffs

* Salesforce – 10,000 layoffs

* The data indicates that large technology and multinational firms contributed significantly to global layoff volumes. This trend aligns with broader industry-wide restructuring, cost optimisation initiatives, and post-pandemic demand re calibration within the technology sector.


## 3. Strategic Recommendations

* Build multi-year financial resilience buffers.
* Diversify revenue beyond discretionary consumer spending.
* Implement workforce scalability models instead of mass layoffs.
* Strengthen real-time labour and revenue monitoring systems.
* Diversify geographic operational risk.
