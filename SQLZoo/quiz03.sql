--Nobel Quiz (yr, subject, winner)

--1.Pick the code which shows the name of winner's names beginning with C and ending in n
select name 
from nobel
where winner like 'C%' and winner like '%n'

--2. Select the code that shows how many Chemistry awards were given between 1950 and 1960
select count(subject) 
from nobel 
where subject = 'Chemistry' and yr between 1950 and 1960 

--3. Pick the code that shows the amount of years where no Medicine awards were given
select count(distinct yr) 
from nobel 
where yr not in 
    (select yr 
    from nobel 
    where subject = 'Medicine')

--4. Select the result that would be obtained from the following code:

--5. Select the code which would show the year when neither a Physics or Chemistry award was given
select yr 
from nobel 
where yr not in 
    (select yr 
    from nobel 
    where subject in ('Chemistry', 'Physics'))

--6. Select the code which shows the years when a Medicine award was given but no Peace or Literature award was
select distinct yr
from nobel 
where subject = 'Medicine'
and yr not in 
    (select yr 
    from nobel 
    where subject = 'Peace' and subject ='Literature')