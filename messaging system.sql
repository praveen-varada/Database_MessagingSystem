create database messaging_system;
use messaging_system;
create table user_details(
user_id varchar(10),
first_name varchar(40),
last_name varchar(40),
phone_number varchar(10),
created_date date,
is_active binary,
primary key(user_id));
create table device_details(
device_id varchar(10),
device_name varchar(20),
processor varchar(20),
ram varchar(20),
battery varchar(10),
primary key(device_id));
create table message(
message_id varchar(10),
subject LONGTEXT,
creator_id varchar(10),
message_body LONGTEXT,
is_remainder binary,
device_id varchar(10),
primary key(message_id),
foreign key (device_id) references device_details(device_id),
foreign key(creator_id) references user_details(user_id));
create table user_contacts(
user_id varchar(10),
contact_id varchar(10),
first_name varchar(20),
last_name varchar(20),
creation_date date,
modified_date date,
phone_number varchar(10),
primary key(user_id,contact_id),
foreign key(user_id) references user_details(user_id));
create table message_receipent(
message_id varchar(10),
receipent_id varchar(10),
is_read binary,
primary key(message_id));
create table user_group(
user_id varchar(10),
group__id varchar(10),
created_date date,
is_active binary,
foreign key(user_id) references user_details(user_id));
create table group_(
group__id varchar(10),
group_name varchar(40),
created_date date,
is_active binary,
primary key(group__id));
create table storage_constraints(
user_id varchar(10),
message_id varchar(10),
storage_name varchar(20),
allocated varchar(10),
availabe varchar(10),
foreign key(user_id) references user_details(user_id),
foreign key(message_id) references message(message_id));
create table deleted_message(
message_id varchar(10),
user_id varchar(10),
created_date date,
deleted_date date,
primary key(message_id),
foreign key(message_id) references  message(message_id),
foreign key(user_id) references user_details(user_id));
create table permission_(
user_id varchar(10),
device_id varchar(10),
created_date date,
primary key(user_id,device_id),
foreign key(user_id) references user_details(user_id),
foreign key(device_id) references device_details(device_id));
create table block_list(
user_id varchar(10),
device_id varchar(10),
blocked_date date,
description_ LONGTEXT,
primary key(user_id,device_id),
foreign key(user_id) references user_details(user_id),
foreign key(device_id) references device_details(device_id));
create table notification_details(
notification_type varchar(20),
description_ LONGTEXT,
name_ varchar(40),
template_ varchaR(40),
urgent binary,
primary key(notification_type));
create table notification_(
message_id varchar(10),
notification_type varchar(20),
deleted binary,
sender_id varchar(10),
receiver varchar(40),
reciever_id varchar(10),
notification_frequency varchar(10),
foreign key(message_id) references message(message_id),
foreign key(notification_type) references notification_details(notification_type));

-----------------------------------------------------------------------
INSERT INTO USER_details VALUES(21, 'Rohit', 'Verma', 
1234567890, '1-3-20', 1);
INSERT INTO USER_details VALUES(22, 'Sneha', 'Shukla', 
2345678901, '12-3-20', 1);
INSERT INTO USER_details VALUES(23, 'Andy', 'Robbin', 3456789012, 
'7-4-20', 0);
INSERT INTO USER_details VALUES(24, 'Tom', 'Stark', 4567890123, 
'15-4-20', 1);
INSERT INTO USER_details VALUES(25, 'Abhijeet', 'Shah', 5678901234, 
'24-7-20', 0);
INSERT INTO USER_details VALUES(26, 'Suresh', 'Kumar', 6789012345, 
'10-8-20', 1);
INSERT INTO MESSAGE VALUES(51, "Wishes", 21, "Happy 
Birthday", 0,71);
INSERT INTO MESSAGE VALUES(52, 'Request', 22, 'Please 
extend the date of Submission', 1, 72);
INSERT INTO MESSAGE VALUES(53, 'Reminder', 23, 'Hey u ve 
exam 2day', 1, 73);
INSERT INTO MESSAGE VALUES(54, 'Demand', 24, 'can u send 
money', 0, 74);
INSERT INTO MESSAGE VALUES(55, 'Notice', 25, 'Hostel should 
be vacated in 2 weeks', 1, 75);
INSERT INTO MESSAGE VALUES(56, 'Selection', 26, 'Hey u 
selected for interview', 1, 76);
INSERT INTO Device_details VALUES(71, 'Hp-Notebook', 
'Intel I-5', 8, 30);
INSERT INTO Device_details VALUES(72, 'Android', 
'Snapdragon 865', 4, 80);
INSERT INTO Device_details VALUES(73, 'Macbook', 'M1', 6, 
60);
INSERT INTO Device_details VALUES(74, 'iPhone', 'A13 
Bionic', 3, 65);
INSERT INTO Device_details VALUES(75, 'iPad', 'A12 
Bionic', 4, 73);
INSERT INTO Device_details VALUES(76, 'Galaxy Tab', 
'Mediatek g90', 6, 88);
INSERT INTO user_contacts VALUES(21, 24, 'Tom', 'Stark', 
'11-4-20', '12-6-20', 4567890123);INSERT INTO user_contacts VALUES(21, 
25, 'Abhijeet', 'Shah', 
'1-3-20', '12-3-20', 5678901234);
INSERT INTO user_contacts VALUES(21, 23, 'Andy', 'Robbin', 
'12-3-20', '7-4-20', 6789012345);
INSERT INTO user_contacts VALUES(22, 21, 'Rohit', 'Verma', 
'7-4-20', '11-4-20', 1234567890);
INSERT INTO user_contacts VALUES(22, 24, 'Tom', 'Stark', 
'11-4-20', '4-7-20', 4567890123);
INSERT INTO user_contacts VALUES(23 , 24, 'Tom', 'Stark', 
'4-7-20', '10-8-20', 4567890123);
INSERT INTO user_contacts VALUES(23, 25, 'Abhijeet', 'Shah', 
'10-8-20', '1-9-20', 5678901234);
INSERT INTO user_contacts VALUES(24, 21, 'Rohit', 'Verma', 
'1-3-20', '12-10-20', 1234567890);
INSERT INTO user_contacts VALUES(25, 22, 'Sneha', 'Shukla', 
'12-3-20', '7-11-20', 2345678901);
INSERT INTO user_contacts VALUES(25, 23, 'Andy', 'Robbin', 
'7-4-20', '10-12-20', 3456789012);
INSERT INTO message_receipent VALUES(51, 25, 1);
INSERT INTO message_receipent VALUES(52, 21, 0);
INSERT INTO message_receipent VALUES(53, 24, 1);
INSERT INTO message_receipent VALUES(54, 21, 1);
INSERT INTO message_receipent VALUES(55, 23, 0);
INSERT INTO message_receipent VALUES(56, 24, 0);
INSERT INTO user_group VALUES(21, 1, '10-8-20', 1);
INSERT INTO user_group VALUES(22, 1, '10-8-20', 0);
INSERT INTO user_group VALUES(23, 1, '10-8-20', 1);
INSERT INTO user_group VALUES(24, 2, '1-9-20',1);
INSERT INTO user_group VALUES(25, 2, '1-9-20', 0);
INSERT INTO user_group VALUES(26, 2, '1-9-20', 0);
INSERT INTO Group_ VALUES(1, 'CSE 1A', '10-8-20', 1); 
INSERT INTO Group_ VALUES(2, 'CSE 2B', '1-9-20', 0); 
INSERT INTO Group_ VALUES(3, 'Civil 3C', '1-9-20', 0); 
INSERT INTO Group_ VALUES(4, 'MME 2A', '1-9-20', 0);
INSERT INTO Storage_constraints VALUES(25, 51, 'Internal', 
200 , 190 );
INSERT INTO Storage_constraints VALUES(21, 52, 'Cloud', 
350 , 250 );
INSERT INTO Storage_constraints VALUES(24, 53, 
'External',450, 340);
INSERT INTO Storage_constraints VALUES(21, 54, 'Internal', 
500, 460);
INSERT INTO Storage_constraints VALUES(23, 55, 'External', 
1000, 120);
INSERT INTO Storage_constraints VALUES(24, 56,'Cloud', 
300, 100);
INSERT INTO deleted_message VALUES(55, 23, '11-4-20', 
'11-12-20');
INSERT INTO deleted_message VALUES(56, 24, '24-7-20', 
'12-9-20');
INSERT INTO Permission_ VALUES(21, 71, '11-4-20');
INSERT INTO Permission_ VALUES(22, 72, '1-3-20');
INSERT INTO Permission_ VALUES(23, 73, '12-3-20');
INSERT INTO Permission_ VALUES(24, 74, '7-4-20');
INSERT INTO Permission_ VALUES(25, 75, '15-4-20');
INSERT INTO Permission_ VALUES(26, 76, '24-7-20');
INSERT INTO Block_list VALUES(21, 71, '11-4-20', 'Spam');
INSERT INTO Block_list VALUES(22, 72, '1-3-20', 'Advertisements');
INSERT INTO Block_list VALUES(23, 73, '12-3-20', 'Fraud');
INSERT INTO Block_list VALUES(24, 74, '7-4-20', 'Ex');
INSERT INTO Block_list VALUES(25, 75, '15-4-20', 'Threat');
INSERT INTO Block_list VALUES(26, 76, '24-4-20', 'Clash');
INSERT INTO Notification_ VALUES(51, 'pop-up', 0, 21, 
'Abhijeet',25,5);
INSERT INTO Notification_ VALUES(51, 'Ring', 0, 22, 
'Rohit',21,3);
INSERT INTO Notification_ VALUES(51, 'silent', 0, 23, 
'Tom',24,0);
INSERT INTO Notification_ VALUES(51, 'alert sound', 0, 24, 
'Rohit',21,6);
INSERT INTO Notification_ VALUES(51, 'No notification', 
1, 25, 'Andy',23,0);
INSERT INTO Notification_ VALUES(51, 'pop-up', 1, 26, 
'Suresh',26,2);
INSERT INTO Notification_Details VALUES('pop-up', 'Portion 
of message', 'Popping', 'Message with Rings', 1);
INSERT INTO Notification_Details VALUES('Ring', 'Name of 
Sender', 'Ringing', 'Just rings without screen on', 1);
INSERT INTO Notification_Details VALUES('silent', 
'Nothing', 'Calm', 'No sound and Notification', 0);
INSERT INTO Notification_Details VALUES('alert sound', 
'Important', 'Siren', 'Loud Sound', 1);
INSERT INTO Notification_Details VALUES('No notification','Nothing', 
'Nothing', 'Nothing', 0);