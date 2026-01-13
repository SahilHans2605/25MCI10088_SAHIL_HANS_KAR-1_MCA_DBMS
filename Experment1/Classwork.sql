create table games(
Gd int primary key,
Gname varchar(20) not null,
Price int,
Release_date date unique
)

create table persons(
Person_Id int primary key,
Person_name varchar(20) not null,
email varchar(30) unique
)

create table Games_issue(
Issue_id int primary key,
Gd int references games(Gd),
Member_id int references persons(Person_Id),
Issue_date date not null,
Return_date date
)

insert into persons values(1,'sahil','sahil@gmail.com');
insert into persons values(2,'ansh','ans@gmail.com');
insert into persons values(3,'nitin','ntn@gmail.com');
insert into persons values(4,'chirag','chiggy@gmail.com');
insert into persons values(5,'hans','hans@gmail.com');
insert into persons values(6,'Bector','bector@gmail.com');

insert into games values(1,'Fornite',1000,'26-05-2004')
insert into games values(2,'Forza',5000,'26-02-2005');
insert into games values(3,'GTAV',6500,'26-02-2006');
insert into games values(4,'NBA2k12',100,'26-01-2007');
insert into games values(5,'WWE',4000,'26-04-2008');
insert into games values(6,'FarCry',2000,'26-06-2014');


insert into Games_issue values(1,1,1,'21-03-2020',null)
insert into Games_issue values(2,2,2,'11-04-2020',null);
insert into Games_issue values(3,3,3,'19-05-2020','27-06-2020');
insert into Games_issue values(4,4,4,'02-06-2020',null);
insert into Games_issue values(5,5,5,'12-07-2020','13-09-2021');
insert into Games_issue values(6,6,6,'21-08-2020',null);

alter table games add Avl_copy int

update games set Avl_copy=10 where Gd<10

"OPERATIONS TO PERFORM WHEN A GAME IS ISSUED"


UPDATE games
SET Avl_copy = Avl_copy - 1
WHERE Gd = 1;


"OPERATIONS TO PERFORM FOR OBSOLETE ENTRIES"
--Obsolete entries are old or outdated 
-- data that should be removed because they are no longer relevant.
DELETE FROM Games_issue
WHERE return_date IS NOT NULL;


"GRANT AND REVOKE"



SELECT CURRENT_USER

CREATE  ROLE MANAGER
WITH LOGIN PASSWORD 'SAHIL2012@'



SELECT CURRENT_USER;
GRANT SELECT, INSERT, DELETE ON games TO manager;
GRANT SELECT, INSERT, DELETE ON Games_issue TO manager;
GRANT SELECT, INSERT, DELETE ON persons TO manager;


REVOKE DELETE ON Games_issue FROM manager;






