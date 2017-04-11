--Andrew Arrigo
--4/08/17

DROP TABLE IF EXISTS CoachInfo;
DROP TABLE IF EXISTS TeamType;
DROP TABLE IF EXISTS Teams;
DROP TABLE IF EXISTS AssistantCoach;
DROP TABLE IF EXISTS Players;

--CoachInfo--
CREATE TABLE CoachInfo(
 CoachID char(4) NOT NULL,
 FullName text NOT NULL,
 Address text,
 PhoneNum text,
 YearsCoaching int,
 PRIMARY KEY (CoachID)
)
;

--TeamType--
CREATE TABLE TeamType(
 AgeGroupID char(3) NOT NULL,
 AgeGroup text,
 PRIMARY KEY (AgeGroupID)
)
;

--Teams--
CREATE TABLE Teams(
 TeamID char(5) NOT NULL references TeamType (AgeGroupID),
 HeadCoach text NOT NULL,
 TeamName text,
 AgeGroup text NOT NULL,
 PRIMARY KEY(TeamID)
)
;

--AssistantCoach--
CREATE TABLE AssistantCoach(
 CoachID char(4) NOT NULL references CoachInfo (CoachID),
 TeamID char(5) NOT NULL references Teams (TeamID),
 PRIMARY KEY (CoachID, TeamID)
)
;

--Players--
CREATE TABLE Players(
 PlayerID char(5) NOT NULL references Teams (TeamID),
 TeamID char(5) NOT NULL,
 Age int NOT NULL,
 FullName text NOT NULL,
 Address text,
 PhoneNum text,
 PRIMARY KEY (PlayerID)
)
;
