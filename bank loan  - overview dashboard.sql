select* from bank_loan_data

-- monthly trend by issue date
select 
month(issue_date) as [Month Number],
datename(month, issue_date) as [Month Name],
count(id) as [Total Loan Applications],
sum(loan_amount) as [total Funded Amount],
sum(total_payment) as [total received Amount]
from bank_loan_data
group by month(issue_date), datename(month, issue_date)
order by datename(month, issue_date)

-- regional analysis by state
select 
address_state,
count(id) as [Total Loan Applications],
sum(loan_amount) as [total Funded Amount],
sum(total_payment) as [total received Amount]
from bank_loan_data
group by address_state
order by count(id) desc

-- loan term analysis
select 
term,
count(id) as [Total Loan Applications],
sum(loan_amount) as [total Funded Amount],
sum(total_payment) as [total received Amount]
from bank_loan_data
group by term
order by term desc

-- employee length analysis
select 
emp_length,
count(id) as [Total Loan Applications],
sum(loan_amount) as [total Funded Amount],
sum(total_payment) as [total received Amount]
from bank_loan_data
group by emp_length
order by emp_length desc

-- Loan purpose breakdown
select 
purpose,
count(id) as [Total Loan Applications],
sum(loan_amount) as [total Funded Amount],
sum(total_payment) as [total received Amount]
from bank_loan_data
group by purpose
order by count(id) desc

-- homeownership analysis
select 
home_ownership,
count(id) as [Total Loan Applications],
sum(loan_amount) as [total Funded Amount],
sum(total_payment) as [total received Amount]
from bank_loan_data
where grade = 'A'
group by home_ownership
order by count(id) desc