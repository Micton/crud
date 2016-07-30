use test;
DROP TABLE IF EXISTS User;
create table User (id int(8) auto_increment PRIMARY KEY,
                   name varchar(25) not null,
                   age int not null,
                   isAdmin bit not null,
                   createdDate timestamp NOT NULL
);
insert into User (name, age, isAdmin, createdDate) values ('user1', 20, false, '2012-12-31 11:30:45');
insert into User (name, age, isAdmin, createdDate) values ('user2', 30, false, '2011-12-31 11:30:45');
insert into User (name, age, isAdmin, createdDate) values ('user3', 40, false, '2015-12-31 11:30:45');
insert into User (name, age, isAdmin, createdDate) values ('user4', 25, false, '2010-12-31 11:30:45');
insert into User (name, age, isAdmin, createdDate) values ('user5', 35, true, '2009-12-31 11:30:45');
insert into User (name, age, isAdmin, createdDate) values ('user6', 45, false, '2001-12-31 11:30:45');
insert into User (name, age, isAdmin, createdDate) values ('user7', 50, true, '1998-12-31 11:30:45');
insert into User (name, age, isAdmin, createdDate) values ('user9', 15, false, '2008-12-31 11:30:45');
insert into User (name, age, isAdmin, createdDate) values ('user10', 25, false, '2007-12-31 11:30:45');
insert into User (name, age, isAdmin, createdDate) values ('user11', 35, false, '2003-12-31 11:30:45');
insert into User (name, age, isAdmin, createdDate) values ('user12', 45, true, '2002-12-31 11:30:45');
insert into User (name, age, isAdmin, createdDate) values ('user13', 55, false, '2004-12-31 11:30:45');
insert into User (name, age, isAdmin, createdDate) values ('user14', 45, false, '2001-12-31 11:30:45');