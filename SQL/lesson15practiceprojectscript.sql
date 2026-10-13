-- Employee Data Analysis --

-- create a new db: XYZ --
attach database 'XYZ.db' as xyz;

-- create table --
drop table if exists xyz.employee;

create table xyz.employee (
    emp_id      integer primary key,
    f_name      text not null,
    l_name      text not null,
    job_id      text not null,
    salary      integer not null,
    manager_id  text,
    dept_id     integer
);

-- insert values --
insert into xyz.employee (emp_id, f_name, l_name, job_id, salary, manager_id, dept_id)
values
(101, 'John',    'Smith',    'JP123', 70000, '02', 30),
(102, 'Emily',   'Johnson',  'EN456', 80000, '03', 40),
(103, 'Michael', 'Williams', 'MW789', 90000, '04', 20),
(104, 'Emma',    'Jones',    'EJ567', 75000, '02', 10),
(105, 'Calvin',  'Miller',   'CM345', 85000, '03', 30),
(106, 'Sophia',  'Davis',    'SD678', 95000, '04', 20),
(107, 'Liam',    'Moore',    'LM901', 72000, '02', 40),
(108, 'Olivia',  'Anderson', 'OA234', 87000, '03', 10),
(109, 'William', 'Brown',    'WB567', 92000, '04', 30),
(110, 'Ava',     'Taylor',   'AT890', 78000, '02', 20);

-- check data --
select * from xyz.employee;

-- retrieve names with higher salary than calvin --
select e1.f_name,
e1.l_name,
e1.salary
from xyz.employee e1
inner join xyz.employee e2 on e2.f_name = 'Calvin'
where e1.salary > e2.salary
order by e1.salary;

-- display ID and last name above average salary --
select emp_id,
l_name
from xyz.employee
where salary > (select avg(salary) from xyz.employee);

-- display ID and first name above MW789, sort by salary  --
select emp_id,
f_name,
salary
from xyz.employee
except
select emp_id,
f_name,
salary
from xyz.employee
where salary <= (select salary from xyz.employee where job_id = 'MW789')
order by salary;

-- display top three earners --
select e.f_name,
e.emp_id,
e.salary
from xyz.employee e
inner join (select emp_id
            from xyz.employee
            order by salary desc
            limit 3) top3 on top3.emp_id = e.emp_id
order by e.salary desc;