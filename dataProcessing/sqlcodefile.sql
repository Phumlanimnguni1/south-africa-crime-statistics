--South Africa Criminal Database  
--1. Display all records from the CriminalCases table.
select *
from [saps_crime_data].[dbo].[saps_crime_data];

--2. Count the total number of cases in the table.
select count(casenumber) as Total_number_of_cases
from [saps_crime_data].[dbo].[saps_crime_data];

--3. Count the number of cases in each province.
select province,count(casenumber) as number_of_cases
from [saps_crime_data].[dbo].[saps_crime_data]
group by province
order by number_of_cases desc;

--4. Retrieve all cases where the crime type is Fraud.
select *
from [saps_crime_data].[dbo].[saps_crime_data]
where CrimeType = 'fraud';

--5. Count the number of cases for each crime type.
select CrimeType,count(casenumber) as number_of_cases
from [saps_crime_data].[dbo].[saps_crime_data]
group by CrimeType
order by number_of_cases desc;

--6. Display all cases classified as High or Critical risk.
select *
from [saps_crime_data].[dbo].[saps_crime_data]
where RiskLevel in ('high','critical');

--7. Calculate the average Financial Score of all suspects.
select avg(financialscore) as Average_Financial_Score
from [saps_crime_data].[dbo].[saps_crime_data];

--8. Find the highest Estimated Fraud Amount recorded.
select MAX(estimatedfraudamount_zar) as Highest_Fraud_Amount
from [saps_crime_data].[dbo].[saps_crime_data];

--9. Retrieve the top 10 cases with the highest Estimated Fraud Amount.
select top 10 *
from [saps_crime_data].[dbo].[saps_crime_data]
order by EstimatedFraudAmount_ZAR desc;

--10. Display all cases where the suspect was arrested.
select  *
from [saps_crime_data].[dbo].[saps_crime_data]
where arrested = 'yes';

--11. Count how many suspects were arrested versus not arrested.
select arrested, count(*) as number_suspects
from [saps_crime_data].[dbo].[saps_crime_data]
group by Arrested;

--12. Count the number of cases associated with each bank.
select bankinvolved, count(*) as number_cases
from [saps_crime_data].[dbo].[saps_crime_data]
group by BankInvolved
order by number_cases desc;

--13. Calculate the total Estimated Fraud Amount per province.
select province, sum(EstimatedFraudAmount_ZAR) as fraud_amount
from [saps_crime_data].[dbo].[saps_crime_data]
group by Province
order by fraud_amount desc;

--14. Retrieve all suspects older than 50 years.
select *
from [saps_crime_data].[dbo].[saps_crime_data]
where age > 50;

--15. Calculate the average age of suspects per province.
select province, avg(age) as average_age
from [saps_crime_data].[dbo].[saps_crime_data]
group by province
order by average_age desc;

--16. Display all cases recorded from 2020 onwards.
select *
from [saps_crime_data].[dbo].[saps_crime_data]
where YEAR(CrimeDate) > 2020;

--17. Count how many cases resulted in a Convicted status.
select count(*) as number_of_cases
from [saps_crime_data].[dbo].[saps_crime_data]
where CaseStatus ='convicted';

--18. Retrieve all suspects with more than three previous offenses.
select *
from [saps_crime_data].[dbo].[saps_crime_data]
where PreviousOffenses > 3;

--19. Show the distribution of cases by Risk Level.
select RiskLevel,count(*) as number_of_cases
from [saps_crime_data].[dbo].[saps_crime_data]
group by RiskLevel
order by number_of_cases desc;

--20. Calculate the total Estimated Fraud Amount across all cases.
select sum(cast(EstimatedFraudAmount_ZAR as BIGINT)) as total_fraud_amount
from [saps_crime_data].[dbo].[saps_crime_data];

--21. Identify the province with the highest number of cases.


--22. Retrieve the youngest suspect in the dataset.


--23. Retrieve the oldest suspect in the dataset.


--24. Count the number of cases handled by each investigating officer.


--25. Calculate the average Estimated Fraud Amount per crime type.


--26. Display all cases occurring in Gauteng province.


--27. Retrieve all Fraud cases classified as High risk.


--28. Count the number of cases per year based on CrimeDate.


--29. Display all suspects with a Financial Score below 500.


--30. Identify the most common Crime Type in the dataset.


--31. Write a query to show the number of high-risk and critical SAPS cases, broken down by Gender and CrimeType. Display the results with the highest number of cases first.
select gender,  crimetype, count(casenumber) as number_cases
from [saps_crime_data].[dbo].[saps_crime_data]
where RiskLevel in ('high','critical')
group by gender, crimetype
order by number_cases desc;
