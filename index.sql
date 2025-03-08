create table Employe(id int,firstname varchar(30),lastname varchar(30),age int,salary int)

INSERT INTO Employe (id, firstname, lastname, age, salary) VALUES
(7, 'David', 'Anderson', 45, 80000),
(1, 'John', 'Doe', 28, 50000),
(9, 'Chris', 'Thomas', 27, 49000),
(2, 'Jane', 'Smith', 32, 60000),
(6, 'Sarah', 'Taylor', 29, 52000),
(3, 'Robert', 'Brown', 40, 75000),
(10, 'Olivia', 'Jackson', 38, 72000),
(5, 'Michael', 'Wilson', 35, 55000),
(4, 'Emily', 'Davis', 25, 45000),
(8, 'Sophia', 'Moore', 31, 47000)

select * from Employe

create clustered index IX_idordder on [dbo].[Employe](id asc)

execute sp_helpindex [Employe]

drop index Employe.IX_idordder