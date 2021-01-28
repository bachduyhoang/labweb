create database Assignment2_BachDuyHoang
use Assignment2_BachDuyHoang
create table tblRoles(
roleID			varchar(10)			primary key,
roleName		varchar(20)			not null
)

create table tblUsers(
userID			varchar(100)			primary key,
fullName		nvarchar(50),
[password]		varchar(100),
[status]		varchar(10),
roleID			varchar(10)				foreign key (roleID) references tblRoles(roleID)
)

create table tblSubjects(
subjectID		varchar(10)				primary key,
subjectName		varchar(50)		
)

create table tblQuestions(
questionID		int identity(1,1)	primary key,
questionContent	nvarchar(100),
ans1			nvarchar(100),
ans2			nvarchar(100),
ans3			nvarchar(100),
ans4			nvarchar(100),
correctAns		nvarchar(100),
createDate		datetime,
subjectID		varchar(10)			foreign key (subjectID) references tblSubjects(subjectID),
[status]		bit	
)

create table tblTests(
testID			int identity(1,1)		primary key,
userID			varchar(100)			not null	foreign key (userID) references tblUSers(userID),
subjectID		varchar(10)				not null	foreign key (subjectID) references tblSubjects(subjectID),
dayCreated		datetime				not null,
grade			float					not null
)

create table tblTestDetail(
testDetailID	int identity(1,1)		primary key,
testID			int						not null	foreign key (testID) references tblTests(testID),
questionID		int						not null	foreign key (questionID) references tblQuestions(questionID),
answerID		int						not null	foreign key (answerID) references tblAnswers(answerID),
)		


insert tblRoles(roleID, roleName)
values	('ad', 'adminitrator'),
		('us', 'user')


insert tblUSers(userID, fullName, [password], [status], roleID)
values	(?, ?, ?, ?, ? ),

insert tblSubjects(subjectID,subjectName)
values	('PRJ321', 'Web-Based Java Applications'),
		('PRO192','Object-Oriented Programming'),
		('PRJ311', 'Desktop Java Applications')


insert tblQuestions(questionContent, ans1,ans2,ans3,ans4,correctAns,createDate , subjectID, [status])
values	('Question1', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question2', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question3', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question4', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question5', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question6', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question7', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question8', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question9', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question10', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question11', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question12', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question13', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question14', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question15', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question16', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question17', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question18', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question19', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question20', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question21', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question22', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question23', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question24', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question25', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question26', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question27', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question28', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question29', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),
		('Question30', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRJ321','1'),

		('Question1', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question2', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question3', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question4', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question5', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question6', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question7', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question8', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question9', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question10', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question11', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question12', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question13', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question14', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question15', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question16', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question17', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question18', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question19', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question20', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question21', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question22', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question23', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question24', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question25', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question26', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question27', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question28', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question29', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),
		('Question30', 'ans1', 'ans2', 'ans3', 'ans4','ans1', '2021/1/27','PRO192','1'),




--check Login
SELECT [userID],[fullName],[password],[status],[roleID]
FROM [Assignment2_BachDuyHoang].[dbo].[tblUSers]
WHERE userID = 'hoang' and [password] = '1' 

SELECT COUNT([questionID])
FROM [Assignment2_BachDuyHoang].[dbo].[tblQuestions]
WHERE subjectID like '%%' and questionContent like '%%' and [status] like '%1%'