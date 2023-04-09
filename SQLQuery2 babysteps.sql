SELECT *
FROM [Porfolio2].[dbo].['2021_rws1$']
----cleaning the dataset
UPDATE [Porfolio2].[dbo].['2021_rws1$']
SET Actually_remote# = ISNULL (Actually_remote#, 0)
ALTER TABLE [Porfolio2].[dbo].['2021_rws1$']
ADD Actually_remote VARCHAR (255) NULL
UPDATE [Porfolio2].[dbo].['2021_rws1$']
SET Actually_remote =FORMAT(Actually_remote#, 'p0')

ALTER TABLE [Porfolio2].[dbo].['2021_rws1$']
ADD Prefered_remote_after_covid AS (
	CASE 
		WHEN Prefered_remote_after_covid# = 'I would prefer not to work remotely' THEN '0%'
		WHEN Prefered_remote_after_covid# = 'Less than 10% of my time' THEN '10%'
		WHEN Prefered_remote_after_covid# = '10%' THEN '10%'
		WHEN Prefered_remote_after_covid# = '20%' THEN '20%'
		WHEN Prefered_remote_after_covid# = '30%' THEN '30%'
		WHEN Prefered_remote_after_covid# = '40%' THEN '40%'
		WHEN Prefered_remote_after_covid# = '50% - About half of my time' THEN '50%'
		WHEN Prefered_remote_after_covid# = '60%' THEN '60%'
		WHEN Prefered_remote_after_covid# = '70%' THEN '70%'
		WHEN Prefered_remote_after_covid# = '80%' THEN '80%'
		WHEN prefered_remote_after_covid# = '90%' THEN '90%'
		WHEN Prefered_remote_after_covid# = '100% - All of my time' THEN '100%'
		ELSE '0-NA'
	END)
 SELECT hours_Caring_and_domestic_responsibilities_remote
 FROM [Porfolio2].[dbo].['2021_rws1$']
 WHERE hours_Caring_and_domestic_responsibilities_remote is null

 UPDATE [Porfolio2].[dbo].['2021_rws1$']
SET hours_Caring_and_domestic_responsibilities_remote   = ISNULL (hours_Caring_and_domestic_responsibilities_remote, 0)

 SELECT [ hours_Spent_Working_at_office]
 FROM [Porfolio2].[dbo].['2021_rws1$']
 WHERE [ hours_Spent_Working_at_office] is null

  UPDATE [Porfolio2].[dbo].['2021_rws1$']
SET [ hours_Spent_Working_at_office]   = ISNULL ([ hours_Spent_Working_at_office], 0)

 SELECT [Hours_spent_Preparing_for_work_and_commuting(office)]
 FROM [Porfolio2].[dbo].['2021_rws1$']
 WHERE [Hours_spent_Preparing_for_work_and_commuting(office)] is null
   UPDATE [Porfolio2].[dbo].['2021_rws1$']
SET [Hours_spent_Preparing_for_work_and_commuting(office)]   = ISNULL ([Hours_spent_Preparing_for_work_and_commuting(office)], 0)

 SELECT hours_spent_on_Caring_and_domestic_responsibilities_from_office
 FROM [Porfolio2].[dbo].['2021_rws1$']
 WHERE hours_spent_on_Caring_and_domestic_responsibilities_from_office is null
    UPDATE [Porfolio2].[dbo].['2021_rws1$']
SET hours_spent_on_Caring_and_domestic_responsibilities_from_office  = ISNULL (hours_spent_on_Caring_and_domestic_responsibilities_from_office, 0)

 SELECT hours_for_Personal_and_family_time_from_office
 FROM [Porfolio2].[dbo].['2021_rws1$']
 WHERE hours_for_Personal_and_family_time_from_office is null
     UPDATE [Porfolio2].[dbo].['2021_rws1$']
SET hours_for_Personal_and_family_time_from_office  = ISNULL (hours_for_Personal_and_family_time_from_office, 0)

 SELECT Hours_Sleep_office
 FROM [Porfolio2].[dbo].['2021_rws1$']
 WHERE Hours_Sleep_office is null
      UPDATE [Porfolio2].[dbo].['2021_rws1$']
SET Hours_Sleep_office  = ISNULL (Hours_Sleep_office, 0)

 SELECT Hours_Preparing_for_work_and_commuting_remote
 FROM [Porfolio2].[dbo].['2021_rws1$']
 WHERE Hours_Preparing_for_work_and_commuting_remote is null
      UPDATE [Porfolio2].[dbo].['2021_rws1$']
SET  Hours_Preparing_for_work_and_commuting_remote  = ISNULL ( Hours_Preparing_for_work_and_commuting_remote, 0)

 SELECT Hours_Working_remote
 FROM [Porfolio2].[dbo].['2021_rws1$']
 WHERE Hours_Working_remote is null
       UPDATE [Porfolio2].[dbo].['2021_rws1$']
SET Hours_Working_remote = ISNULL (Hours_Working_remote , 0)

 SELECT Hour_Personal_and_family_time_remote
 FROM [Porfolio2].[dbo].['2021_rws1$']
 WHERE Hour_Personal_and_family_time_remote is null
        UPDATE [Porfolio2].[dbo].['2021_rws1$']
SET Hour_Personal_and_family_time_remote = ISNULL (Hour_Personal_and_family_time_remote , 0)

 SELECT Hour_Sleep_remote
 FROM [Porfolio2].[dbo].['2021_rws1$']
 WHERE Hour_Sleep_remote is null
        UPDATE [Porfolio2].[dbo].['2021_rws1$']
SET Hour_Sleep_remote = ISNULL (Hour_Sleep_remote, 0)

---CALCULATING AGE OF RESPONDENTS

ALTER TABLE [Porfolio2].[dbo].['2021_rws1$']
ADD Age VARCHAR (255) NULL
UPDATE [Porfolio2].[dbo].['2021_rws1$']
SET Age = (2021 - year_of_birth)
ALTER TABLE [Porfolio2].[dbo].['2021_rws1$']
DROP COLUMN AGE
----Analysis Stage---
SELECT *
FROM [Porfolio2].[dbo].['2021_rws1$']

---determining the genders represented in the research

SELECT gender, COUNT(ID) AS Total_respondents
FROM [Porfolio2].[dbo].['2021_rws1$']
Group by gender

---industries represented in the reseacrh

SELECT industry, COUNT(ID) AS industry_representation
FROM [Porfolio2].[dbo].['2021_rws1$']
Group by [industry  ]

---how long have respondents been at there respective jobs--

SELECT duration_at_job, COUNT(duration_at_job) AS Time_at_job
FROM [Porfolio2].[dbo].['2021_rws1$']
Group by [duration_at_job  ]

---determining how many prefered remote work based on gender and household suitation

SELECT gender, household_suitation, Prefered_remote2, COUNT(Prefered_remote2) AS Prefered_remote
FROM [Porfolio2].[dbo].['2021_rws1$']
Group by gender, household_suitation, Prefered_remote2
Order by gender

---how many were required to be in office by office policy

SELECT Must_be_in_office_policy, COUNT(Must_be_in_office_policy)
FROM [Porfolio2].[dbo].['2021_rws1$']
Group by [Must_be_in_office_policy ]

---how many were required to be in office by office policy grouped by industry

SELECT Must_be_in_office_policy, industry, COUNT(Must_be_in_office_policy)
FROM [Porfolio2].[dbo].['2021_rws1$']
Group by [Must_be_in_office_policy ], [industry  ]
Order by [industry  ]

---how many of the respondents have a suitable remote work policy

SELECT Suitableremotepolicy_employer, COUNT(Suitableremotepolicy_employer)
FROM [Porfolio2].[dbo].['2021_rws1$']
Group by Suitableremotepolicy_employer

SELECT *
FROM [Porfolio2].[dbo].['2021_rws1$']