CREATE DATABASE creditunion;
use creditunion;

Create table membership(
membership_number INT(6) PRIMARY KEY,
membership_date DATE
);
Create table cumember(
ss_number INT(9) PRIMARY KEY,
last_name varchar(20),
first_name varchar(20),
street_address varchar(45),
city varchar(20),
state varchar(20),
zip_code varchar(10),
Phone_number varchar(13),
email_address varchar(45),
membership_number INT(6),
 FOREIGN KEY (membership_number) REFERENCES membership(membership_number) ON DELETE SET NULL
);
create table cuaccount(
src_number INT(6) PRIMARY KEY,
acct_suffix INT(2),
acct_type varchar(25),
acct_balance numeric(8,2),
membership_number INT(6),
FOREIGN KEY (membership_number) REFERENCES membership(membership_number) ON DELETE SET NULL
);
create table application(
app_number INT(6) PRIMARY KEY,
loan_type varchar(20),
loan_purpose varchar(45),
loan_amount numeric(8,2),
applicaiton_date DATE,
membership_number INT(6),
FOREIGN KEY(membership_number) REFERENCES membership(membership_number) ON DELETE SET NULL);

create table loan(
loan_number INT(3) PRIMARY KEY,
loan_type varchar(20),
loan_balance numeric(8,2),
loan_status varchar(10),
loan_collateral varchar(50),
membership_number INT(6),
app_number INT(6),
FOREIGN KEY(membership_number) REFERENCES membership(membership_number) ON DELETE SET NULL,
FOREIGN KEY(app_number) REFERENCES application(app_number) ON DELETE SET NULL);
