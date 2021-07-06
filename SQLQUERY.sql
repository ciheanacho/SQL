
select loan_type, AVG(loan_balance) from loan group by loan_type;

select first_name, last_name, membership_number from cumember natural join loan where loan_type = 'SignatureCollateral';

select loan_number, loan_type, membership_number, loan_balance from loan natural join application;

select loan_type, membership_number, loan_amount from application where loan_amount >10000.00 group by membership_number, loan_amount;

select AVG(loan_balance), first_name, last_name from loan natural join cumember group by first_name, last_name having avg(loan_balance) > 4000;

select * from loan where loan_collateral IS NULL;

select acct_balance, membership_number,acct_suffix from cuaccount where acct_suffix = 1 and acct_balance <> (select min(acct_balance) from cuaccount);