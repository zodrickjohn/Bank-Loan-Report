select * from bank_loan_data

-- summary dashboard

select count(id) as [Total Applications] 
from bank_loan_data

select count(id) as [MTD Total Applications] 
from bank_loan_data 
where month(issue_date) = 12

select count(id) as [PMTD Total Applications] 
from bank_loan_data 
where month(issue_date) = 11



select sum(loan_amount) as [MTD Total Funded Amount]
from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

select sum(loan_amount) as [PMTD Total Funded Amount]
from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021



select sum(total_payment) as [Total Amount Received] 
from bank_loan_data

select sum(total_payment) as [MTD Total Amount Received] 
from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

select sum(total_payment) as [PMTD Total Amount Received] 
from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021



select round(avg(int_rate)*100,2) as [Avg Interest Rate]
from bank_loan_data

select round(avg(int_rate)*100,2) as [MTD Avg Interest Rate]
from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

select round(avg(int_rate)*100,2) as [PMTD Avg Interest Rate]
from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021



select round(avg(dti)*100,2) as [Avg DTI]
from bank_loan_data

select round(avg(dti)*100,2) as [MTD Avg DTI]
from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

select round(avg(dti)*100,2) as [PMTD Avg DTI]
from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021



select 
round((count (case when loan_status = 'Fully Paid' OR loan_status = 'Current' then id end)*100.0/count(id)),2) as [Good Loan Percentage]
from bank_loan_data

select count(id) as [Good Loan Applications]
from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

select sum(loan_amount) as [Good Loan Funded Amount]
from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

select sum(total_payment) as [Good Loan Received Amount]
from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'



select
round((count (case when loan_status = 'Charged Off' then id end)*100.0/count(id)),2) as [Bad Loan Percentage]
from bank_loan_data

select count(id) as [Bad Loan Applications]
from bank_loan_data
where loan_status = 'Charged Off'

select sum(total_payment) as [Bad Loan Funded Amount]
from bank_loan_data
where loan_status = 'Charged Off'

select sum(loan_amount) as [Bad Loan Received Amount]
from bank_loan_data
where loan_status = 'Charged Off'



select 
loan_status,
count(id) as [Total Loan Applications],
sum(total_payment) as [Total Amount Received],
sum(loan_amount) as [Total Funded Amount],
round(avg(int_rate * 100),2) as [Interest Rate],
round(avg(dti * 100),2) as DTI
from bank_loan_data
group by loan_status

