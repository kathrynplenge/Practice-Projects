-- Patient Diagnosis Report --

-- create the patients table --
create table patients (
    date         date,
    pid          varchar(10) primary key,
    p_name       varchar(50),
    age          int,
    weight       int,
    gender       varchar(10),
    location     varchar(50),
    phone_no     bigint,
    disease      varchar(50),
    doctor_name  varchar(50),
    doctor_id    int
);

-- insert values into the patients table --
insert into patients
(date, pid, p_name, age, weight, gender, location, phone_no, disease, doctor_name, doctor_id)
values
('2019-06-15', 'AP2021', 'Sarath', 67, 76, 'Male', 'chennai', 5462829, 'Cardiac', 'Mohan', 21),
('2019-02-13', 'AP2022', 'John', 62, 80, 'Male', 'banglore', 1234731, 'Cancer', 'Suraj', 22),
('2018-01-08', 'AP2023', 'Henry', 43, 65, 'Male', 'Kerala', 9028320, 'Liver', 'Mehta', 23),
('2020-02-04', 'AP2024', 'Carl', 56, 72, 'Female', 'Mumbai', 9293829, 'Asthma', 'Karthik', 24),
('2017-09-15', 'AP2025', 'Shikar', 55, 71, 'Male', 'Delhi', 7821281, 'Cardiac', 'Mohan', 21),
('2018-07-22', 'AP2026', 'Piysuh', 47, 59, 'Male', 'Haryana', 8912819, 'Cancer', 'Suraj', 22),
('2017-03-25', 'AP2027', 'Stephen', 69, 55, 'Male', 'Gujarat', 8888211, 'Liver', 'Mehta', 23),
('2019-04-22', 'AP2028', 'Aaron', 75, 53, 'Male', 'Banglore', 9012192, 'Asthma', 'Karthik', 24);

select *
from patients;

-- display the total number of patients --
select count(pid) as total_patients
from patients;

-- patient ID and patient name with the current date --
select pid, p_name, date('now') as today_date
from patients;

-- old patient name and new patient name in uppercase --
select p_name as old_name,
upper(p_name) as new_name
from patients;

-- patient names with the total number of characters in their name --
select p_name,
length(p_name) as name_length
from patients;

-- combine the patient's name and the doctor's name in a new column --
select p_name, doctor_name,
p_name || ' - ' || doctor_name as patient_doctor
from patients;

-- extract the year from the date into a separate column --
select pid, p_name, date,
strftime('%Y', date) as visit_year
from patients;

-- duplicate entries in the doctor name column--
select doctor_name, count(doctor_name) as occurrences
from patients
group by doctor_name
having count(doctor_name) > 1;