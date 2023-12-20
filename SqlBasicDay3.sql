#stored Procedure--compiled format
# functions
# Triggers
# joins
# CTE Windows Functions

use ineuron;
create table student_info(
id int,
student_code varchar(25),
first_name varchar(25),
subjects varchar(25),
marks float);

insert into student_info values(1,"100","krish","Data Science",50),
(2,"102","Sunny","Machine Learning",70),
(3,"103","John","Physics",80),
(4,"104","Mary","Chemistry",90),
(5,"105","Virat","Cricket",100),
(6,"106","tony","Dhoni",70);

select * from student_info;

call ranked_students(85);

call get_students(4);


call top_marks(@output);
select @output;

call low_marks(@output);
select @output;

set @saki="104";
call display_marks(@saki);
select @saki;

#-----------------------------------INDEX-----------------------------------------
#create index
create index idx_first_name
on student_info(first_name);

#drop index
alter table student_info
drop index idx_first_name;


#----------------------------------VIEWS---------------------------------------------

create view stud_basic_info as
select student_code,first_name
from student_info;