#Booking Bug developers test

Ruby 2.2.0 Rails 4.2.1

- Questions 4 isn't finished, because I wasn't able to connect to the API neither with curl, noir website GUI. Kept getting
the Request Code 400,401 or 404. Even tried creating a new account and created a post on the forum. I'll try again in the
morning, really want to finish it.

- The answers to questions 1,2,3 can be found in models/blog_api.rb and assets/javascript/blog_api.js including specs.

- For question 5 I used db/structure.sql for creating tables and inserting data. Wasn't sure how I was expected to create
them, but I remember you mentioning during the interview that there is still a lot of legacy code. Thats why it seemed
like a good idea to write SQL like that. rake db:setup stills works.

Thank you for consideration



'''
For questions 1 to 4 provide answers in Javascript and Ruby code

1. Define a function that deletes all elements of the array a = [4,7,8,'x'] that are not numbers between 6 and 9.

2. Define a function that prints all permutations of an array.

3. Define a function that creates a 5 x 5 array and randomly fills each cell with "Yes", "No" or "Maybe".

4. Using the bookingbug API, find the list of services for company where the company_id=114784. Inside the JSON response will be a list of services. Print names of the last two services returned in response.

5. Write a SQL query to calculate the number of goals for each team.

players

id    name    team_id   goals
1     Joel    1         3
2     Ed      2         1
3     Simon   2         4

teams

id    name
1     New Zealand
2     London

create table players (id int not null auto_increment, name varchar(12) not null, team_id int not null, goals int not null);
create table players (id int not null auto_increment, name varchar(12) not null, team_id int not null, goals int not null, primary key (id));
create table teams (id int not null auto_increment, name varchar(12) not null, primary key (id));
insert into players (name, team_id, goals) values ('Joel', 1, 3),('Ed', 2, 1),('Simon', 2, 4);
insert into teams (name) values ('New Zealand'),('London');


