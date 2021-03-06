/*Jack Yu (jyu108)
Raghav Sambasivans (Rsambas1)
*/
DROP TABLE IF EXISTS Player_Season_Information;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Team_Season_Info;
DROP TABLE IF EXISTS Team_Opponent_Info;
DROP TABLE IF EXISTS Team_Misc_Info;
CREATE TABLE Player_Season_Information (
	PLAYER	VARCHAR(30),
	POS	VARCHAR(10),
	AGE	integer,
	TEAM	VARCHAR(3),
	G	integer,
	GS	DOUBLE(4,2),
	MP	DOUBLE(4,2),
	FG	DOUBLE(4,2),
	FGA	DOUBLE(4,2),
	FG_pct	DOUBLE(4,2),
	three_p	DOUBLE(4,2),
	three_pa	DOUBLE(4,2),
	three_p_pct	DOUBLE(4,2),
	two_p	DOUBLE(4,2),
	two_pa	DOUBLE(4,2),
	two_p_pct	DOUBLE(4,2),
	eFG_pct	DOUBLE(4,2),
	FT	DOUBLE(4,2),
	FTA	DOUBLE(4,2),
	FT_pct	DOUBLE(4,2),
	ORB	DOUBLE(4,2),
	DRB	DOUBLE(4,2),
	TRB	DOUBLE(4,2),
	AST	DOUBLE(4,2),
	STL	DOUBLE(4,2),
	BLK	DOUBLE(4,2),
	TOV	DOUBLE(4,2),
	PF	DOUBLE(4,2),
	PTS	DOUBLE(4,2),
	SEASON	integer,
	PRIMARY KEY(PLAYER, TEAM, SEASON, POS, G)
);
INSERT INTO Player_Season_Information VALUES
("Marko Jaric","SF",24,"LAC",66,12.00,20.90,2.70,6.80,0.40,0.80,2.50,0.32,1.90,4.20,0.45,0.46,1.20,1.60,0.75,0.50,1.90,2.40,2.90,1.50,0.20,1.60,1.90,7.40,2003),
("DeMarcus Nelson","PG",23,"GSW",13,5.00,13.20,1.80,4.20,0.44,0.00,0.20,0.00,1.80,3.90,0.47,0.44,0.40,1.10,0.36,0.50,1.40,1.80,1.00,0.70,0.20,1.20,1.80,4.10,2009),
("Troy Murphy","PF",23,"GSW",28,0.00,21.80,3.80,8.70,0.44,0.20,0.60,0.29,3.60,8.10,0.45,0.45,2.10,2.90,0.75,1.70,4.50,6.20,0.70,0.40,0.60,1.20,2.10,10.00,2004),
("Lamar Odom","PF",31,"LAL",82,35.00,32.20,5.80,10.90,0.53,0.80,2.20,0.38,4.90,8.70,0.57,0.57,2.00,3.00,0.68,2.10,6.50,8.70,3.00,0.60,0.70,1.70,2.40,14.40,2011),
("Greg Ostertag","C",29,"UTA",81,74.00,23.80,2.10,4.00,0.52,0.00,0.00,0.00,2.10,4.00,0.52,0.52,1.20,2.40,0.51,2.20,4.00,6.20,0.70,0.20,1.80,1.30,2.90,5.40,2003),
("Larry Nance","C",25,"LAL",42,17.00,22.00,3.60,6.00,0.60,0.00,0.10,0.25,3.60,5.90,0.61,0.60,1.30,2.10,0.63,2.60,4.20,6.80,1.40,1.40,0.50,1.00,2.70,8.60,2018),
("Evan Fournier","SF",23,"ORL",79,71.00,32.50,5.40,11.80,0.46,2.00,4.90,0.40,3.50,6.80,0.51,0.55,2.50,3.00,0.84,0.40,2.40,2.80,2.70,1.20,0.00,1.70,2.70,15.40,2016),
("Mike Miller","SF",35,"DEN",47,2.00,7.90,0.50,1.30,0.35,0.40,1.10,0.36,0.10,0.20,0.30,0.51,0.00,0.00,0.00,0.10,1.00,1.10,0.90,0.30,0.10,0.40,1.10,1.30,2016),
("Mario Chalmers","PG",31,"MEM",66,10.00,21.50,2.50,6.70,0.38,0.80,2.90,0.28,1.70,3.80,0.46,0.44,1.80,2.10,0.85,0.20,2.20,2.40,3.00,1.20,0.20,1.80,2.70,7.70,2018),
("Jeff McInnis","PG",32,"CHA",38,3.00,18.50,1.90,4.80,0.39,0.00,0.20,0.12,1.80,4.60,0.41,0.40,0.60,0.80,0.69,0.40,1.30,1.60,3.30,0.40,0.00,1.10,1.90,4.30,2007),
("Eduardo Najera","PF",29,"DEN",64,3.00,22.60,2.00,4.70,0.42,0.10,0.20,0.33,1.90,4.50,0.43,0.43,1.40,1.80,0.78,2.00,3.10,5.10,0.80,0.80,0.50,0.80,2.60,5.40,2006),
("Udonis Haslem","PF",32,"MIA",75,59.00,18.90,1.70,3.30,0.51,0.00,0.00,0.00,1.70,3.30,0.51,0.51,0.40,0.60,0.71,1.30,4.10,5.40,0.50,0.40,0.20,0.60,2.30,3.90,2013),
("Derrick Williams","SF",24,"NYK",80,9.00,17.90,3.20,7.10,0.45,0.60,1.90,0.29,2.60,5.20,0.51,0.49,2.40,3.20,0.76,0.60,3.10,3.70,0.90,0.40,0.10,0.80,0.90,9.30,2016),
("Cherokee Parks","C",28,"LAC",52,31.00,16.80,2.20,4.50,0.49,0.00,0.10,0.00,2.20,4.40,0.50,0.49,0.40,0.50,0.70,1.10,2.50,3.60,0.80,0.40,0.50,0.60,2.00,4.80,2001),
("Leon Smith","C",21,"ATL",14,0.00,7.10,0.70,1.90,0.39,0.00,0.00,0.00,0.70,1.90,0.39,0.39,0.80,1.20,0.65,0.70,1.50,2.20,0.20,0.40,0.10,0.20,0.90,2.20,2002);
CREATE TABLE Player (
	NUMBER	integer,
	PLAYER	VARCHAR(100),
	POS	VARCHAR(20),
	HEIGHT	VARCHAR(20),
	WEIGHT	VARCHAR(20),
	BIRTH_DATE	VARCHAR(20),
	NATIONALITY	VARCHAR(20),
	EXPERIENCE	VARCHAR(20),
	COLLEGE	VARCHAR(100),
	PRIMARY KEY(PLAYER, NUMBER, Experience, POS)
);
INSERT INTO Player VALUES
(4, "David Wesley", "SG", "6-0", "190", "1970-11-14", "US", "8", "Baylor"),
(44, "Anthony Peeler", "SG", "6-4", "208", "1969-11-25", "US", "8", "Missouri"),
(5, "Jeff McInnis", "PG", "6-4", "190", "1974-10-22", "US", "3", "UNC"),
(8, "Kobe Bryant", "SG", "6-6", "212", "1978-08-23", "US", "4", "0"),
(4, "Duane Causwell", "C", "7-0", "240", "1968-05-31", "US", "10", "Temple"),
(51, "Lawrence Funderburke", "PF", "6-9", "230", "1970-12-15", "US", "3", "Indiana, Ohio State"),
(50, "Todd MacCulloch", "C", "7-0", "280", "1976-01-27", "CA", "1", "Washington"),
(45, "Cedric Henderson", "SF", "6-7", "215", "1975-03-11", "US", "3", "Memphis"),
(3, "Laron Profit", "PG", "6-5", "204", "1977-08-05", "US", "1", "Maryland"),
(33, "Gary Trent", "PF", "6-8", "250", "1974-09-22", "US", "5", "Ohio University"),
(1, "Keyon Dooling", "PG", "6-3", "196", "1980-05-08", "US", "R", "Missouri"),
(52, "Jason Collier", "C", "7-0", "260", "1977-09-08", "US", "R", "Indiana, Georgia Tech"),
(30, "Dell Curry", "SG", "6-4", "190", "1964-06-25", "US", "14", "Virginia Tech"),
(35, "Corliss Williamson", "SF", "6-7", "245", "1973-12-04", "US", "5", "Arkansas"),
(35, "Todd Fuller", "C", "6-11", "255", "1974-07-25", "US", "4", "NC State");
CREATE TABLE Team_Season_Info (
	G    integer,
	MP    DECIMAL(10,2),
	FG    DECIMAL(10,2),
	FGA    DECIMAL(10,2),
	FG_pct    DECIMAL(10,2),
	three_p    DECIMAL(10,2),
	three_pa    DECIMAL(10,2),
	three_p_pct    DECIMAL(10,2),
	two_p    DECIMAL(10,2),
	two_pa    DECIMAL(10,2),
	two_p_pct    DECIMAL(10,2),
	FT    DECIMAL(10,2),
	FTA    DECIMAL(10,2),
	FT_pct    DECIMAL(10,2),
	ORB    DECIMAL(10,2),
	DRB    DECIMAL(10,2),
	TRB    DECIMAL(10,2),
	AST    DECIMAL(10,2),
	STL    DECIMAL(10,2),
	BLK    DECIMAL(10,2),
	TOV    DECIMAL(10,2),
	PF    DECIMAL(10,2),
	PTS    DECIMAL(10,2),
	TEAM    VARCHAR(3),
	SEASON    VARCHAR(10),
	END_SEASON    VARCHAR(10),
	PRIMARY KEY(TEAM, END_SEASON)
);
INSERT INTO Team_Season_Info VALUES
(75,242.30,41.70,90.30,0.46,15.10,41.30,0.37,26.50,49.00,0.54,18.60,23.80,0.78,10.50,36.40,46.90,24.70,6.10,4.80,12.70,19.50,117.00,"DAL","2019-20","2020")
,
(82,242.40,38.70,85.10,0.45,8.30,22.50,0.37,30.40,62.60,0.49,20.30,25.40,0.80,11.70,31.10,42.80,23.80,7.10,4.50,13.50,20.00,105.90,"HOU","2010-11","2011")
,
(82,242.10,36.90,82.30,0.45,5.50,16.00,0.34,31.40,66.20,0.47,17.70,24.10,0.73,12.90,28.80,41.70,21.50,6.60,4.40,14.80,21.30,97.00,"MIL","2007-08","2008")
,
(82,241.80,38.40,82.00,0.47,7.00,17.80,0.39,31.40,64.20,0.49,16.40,20.20,0.81,9.60,30.40,40.10,23.80,7.00,4.10,11.70,19.50,100.20,"TOR","2007-08","2008")
,
(82,240.30,36.50,81.20,0.45,4.80,14.60,0.33,31.70,66.50,0.48,18.20,23.80,0.77,11.70,28.40,40.10,20.00,7.50,4.50,14.00,20.50,96.10,"WAS","2008-09","2009")
,
(82,242.10,39.10,87.00,0.45,9.40,25.30,0.37,29.70,61.70,0.48,19.10,23.50,0.81,12.50,34.00,46.40,23.20,5.50,4.70,13.70,19.20,106.70,"POR","2013-14","2014")
,
(82,242.70,40.70,85.20,0.48,6.40,18.50,0.34,34.40,66.60,0.52,18.40,26.20,0.70,13.30,31.70,45.00,24.40,9.30,6.50,15.30,20.50,106.10,"DEN","2012-13","2013")
,
(82,243.00,33.40,75.50,0.44,6.30,17.10,0.37,27.10,58.40,0.46,16.70,21.60,0.77,10.30,32.30,42.60,19.30,6.80,5.40,16.70,21.50,89.80,"HOU","2003-04","2004")
,
(82,242.40,39.90,84.90,0.47,13.00,33.90,0.38,26.90,51.00,0.53,17.50,23.30,0.75,9.30,34.40,43.70,22.70,6.60,4.00,13.70,18.10,110.30,"CLE","2016-17","2017")
,
(82,244.30,35.70,77.70,0.46,2.80,8.20,0.34,32.80,69.50,0.47,21.60,27.70,0.78,12.00,29.90,41.90,23.20,7.30,5.10,15.70,22.20,95.70,"LAC","2004-05","2005")
,
(82,241.20,39.60,83.10,0.48,8.10,21.40,0.38,31.50,61.80,0.51,21.30,27.70,0.77,11.00,33.20,44.10,24.40,8.00,5.30,14.10,20.60,108.60,"LAL","2007-08","2008")
,
(82,242.10,35.60,76.70,0.46,6.40,18.80,0.34,29.20,57.90,0.50,17.00,24.60,0.69,10.00,30.80,40.80,20.50,6.90,5.40,14.60,21.30,94.60,"MIA","2006-07","2007")
,
(82,242.10,38.70,86.00,0.45,9.80,27.20,0.36,28.90,58.80,0.49,15.50,19.40,0.80,10.70,35.10,45.90,21.90,6.40,4.50,13.60,18.20,102.80,"POR","2014-15","2015")
,
(82,241.80,37.70,85.40,0.44,8.00,23.70,0.34,29.70,61.70,0.48,18.50,24.10,0.77,11.50,33.10,44.60,22.70,7.40,4.80,14.70,21.00,101.90,"DEN","2015-16","2016")
,
(82,241.20,34.30,79.90,0.43,4.60,14.50,0.32,29.70,65.50,0.45,19.20,24.60,0.78,10.90,28.80,39.70,18.80,7.00,4.80,14.40,20.00,92.40,"NJN","2009-10","2010")
;
CREATE TABLE Team_Opponent_Info (
	OPP_G    integer,
	OPP_MP    DECIMAL(10,2),
	OPP_FG    DECIMAL(10,2),
	OPP_FGA    DECIMAL(10,2),
	OPP_FG_pct    DECIMAL(10,2),
	OPP_3P    DECIMAL(10,2),
	OPP_3PA    DECIMAL(10,2),
	OPP_3P_pct    DECIMAL(10,2),
	OPP_2P    DECIMAL(10,2),
	OPP_2PA    DECIMAL(10,2),
	OPP_2P_pct    DECIMAL(10,2),
	OPP_FT    DECIMAL(10,2),
	OPP_FTA    DECIMAL(10,2),
	OPP_FT_pct    DECIMAL(10,2),
	OPP_ORB    DECIMAL(10,2),
	OPP_DRB    DECIMAL(10,2),
	OPP_TRB    DECIMAL(10,2),
	OPP_AST    DECIMAL(10,2),
	OPP_STL    DECIMAL(10,2),
	OPP_BLK    DECIMAL(10,2),
	OPP_TOV    DECIMAL(10,2),
	OPP_PF    DECIMAL(10,2),
	OPP_PTS    DECIMAL(10,2),
	TEAM    VARCHAR(3),
	SEASON    VARCHAR(10),
	END_SEASON    VARCHAR(4),
	PRIMARY KEY(TEAM, END_SEASON)
);
INSERT INTO Team_Opponent_Info VALUES
(75,242.30,41.90,91.60,0.46,12.30,34.90,0.35,29.70,56.70,0.52,16.00,21.00,0.76,10.40,35.00,45.40,23.90,7.00,4.10,11.90,21.30,112.10,"DAL","2019-20","2020"),
(82,242.40,39.80,85.10,0.47,5.50,15.20,0.36,34.40,69.90,0.49,18.60,23.80,0.78,11.60,31.10,42.80,20.80,7.20,5.50,13.70,21.40,103.70,"HOU","2010-11","2011"),
(82,242.10,38.40,80.00,0.48,7.20,18.70,0.38,31.20,61.40,0.51,20.00,26.10,0.77,10.60,30.00,40.70,23.30,7.90,4.90,13.70,21.10,103.90,"MIL","2007-08","2008"),
(82,241.80,36.70,80.10,0.46,7.50,20.50,0.37,29.10,59.60,0.49,16.40,21.10,0.78,10.10,31.50,41.60,21.90,5.70,4.10,14.00,18.40,97.30,"TOR","2007-08","2008"),
(82,240.30,38.60,80.10,0.48,8.20,21.20,0.39,30.40,58.80,0.52,18.10,23.90,0.76,11.40,30.40,41.80,24.60,7.20,5.30,13.90,20.00,103.50,"WAS","2008-09","2009"),
(82,242.10,39.60,87.80,0.45,6.50,18.30,0.35,33.10,69.50,0.48,17.00,22.20,0.77,11.50,32.00,43.50,20.40,7.80,3.70,12.00,20.70,102.80,"POR","2013-14","2014"),
(82,242.70,38.10,85.70,0.44,8.40,23.10,0.36,29.70,62.60,0.47,16.60,22.70,0.73,12.40,29.20,41.60,23.60,8.00,6.80,15.90,21.60,101.10,"DEN","2012-13","2013"),
(82,243.00,32.10,78.10,0.41,5.60,15.00,0.37,26.60,63.10,0.42,18.20,24.70,0.74,11.10,28.70,39.70,20.60,8.70,4.40,13.50,20.70,88.00,"HOU","2003-04","2004"),
(82,242.40,40.60,88.80,0.46,10.40,28.70,0.36,30.30,60.10,0.50,15.50,20.00,0.77,11.00,33.20,44.20,24.70,7.30,4.30,12.60,20.60,107.20,"CLE","2016-17","2017"),
(82,244.30,35.80,80.70,0.44,5.90,16.10,0.37,29.90,64.60,0.46,19.00,24.90,0.76,12.00,27.50,39.50,21.10,7.80,4.80,13.70,23.60,96.50,"LAC","2004-05","2005"),
(82,241.20,38.10,85.60,0.45,6.80,18.70,0.36,31.40,67.00,0.47,18.30,24.30,0.75,12.00,30.70,42.80,21.90,7.70,4.50,14.20,22.60,101.30,"LAL","2007-08","2008"),
(82,242.10,35.30,79.50,0.44,6.50,18.20,0.35,28.80,61.20,0.47,18.50,24.90,0.74,11.20,30.10,41.30,20.20,6.90,3.80,14.50,21.80,95.50,"MIA","2006-07","2007"),
(82,242.10,38.20,86.90,0.44,6.40,18.90,0.34,31.80,67.90,0.47,15.80,20.90,0.76,11.00,33.60,44.60,20.40,8.00,3.60,12.20,18.70,98.60,"POR","2014-15","2015"),
(82,241.80,38.80,84.20,0.46,9.20,24.80,0.37,29.60,59.40,0.50,18.20,23.90,0.76,9.70,32.90,42.70,23.50,8.00,6.30,13.70,20.90,105.00,"DEN","2015-16","2016"),
(82,241.20,38.70,80.40,0.48,5.70,15.60,0.37,33.00,64.80,0.51,18.40,24.60,0.75,11.30,32.70,44.00,23.90,7.80,5.10,14.00,20.10,101.50,"NJN","2009-10","2010");
CREATE TABLE Team_Misc_Info (
	AGE    DECIMAL(10,2),
	W    integer,
	L    integer,
	PW    integer,
	PL    integer,
	MOV    DECIMAL(10,2),
	SOS    DECIMAL(10,2),
	SRS    DECIMAL(10,2),
	ORtg    DECIMAL(10,2),
	DRtg    DECIMAL(10,2),
	NRtg    DECIMAL(10,2),
	PACE    DECIMAL(10,2),
	FTr    DECIMAL(10,2),
	3PAr    DECIMAL(10,2),
	TS_pct    DECIMAL(10,2),
	eFG_pct    DECIMAL(10,2),
	TOV_pct    DECIMAL(10,2),
	ORB_pct    DECIMAL(10,2),
	FT_FGA    DECIMAL(10,2),
	opp_eFG_pct    DECIMAL(10,2),
	opp_TOV_pct    DECIMAL(10,2),
	DRB_pct    DECIMAL(10,2),
	opp_FT_FGA    DECIMAL(10,2),
	ARENA    VARCHAR(100),
	ATTENDANCE    DECIMAL(10,2),
	ATTENDANCE_G    DECIMAL(10,2),
	TEAM    VARCHAR(3),
	SEASON    VARCHAR(10),
	END_SEASON    VARCHAR(4),
	PRIMARY KEY(TEAM, END_SEASON)
);
INSERT INTO Team_Misc_Info VALUES
(24.40,32,50,29,53,-4.29,0.51,-3.78,105.10,109.90,-4.80,88.30,0.31,0.19,0.53,0.48,14.50,28.20,0.24,0.51,13.50,73.00,0.27,"Rose Garden Arena",670778.00,16360.00,"POR","2006-07",2007),
(26.40,39,43,36,46,-1.57,0.38,-1.19,104.80,106.50,-1.70,90.20,0.29,0.19,0.52,0.48,13.60,29.10,0.21,0.50,13.20,74.70,0.21,"Ford Center",731165.00,17954.00,"NOK","2006-07",2007),
(26.70,27,55,26,56,-5.11,0.09,-5.02,105.60,111.40,-5.80,88.50,0.30,0.18,0.52,0.47,12.80,30.30,0.22,0.53,14.20,73.40,0.26,"The Palace of Auburn Hills",768826.00,18752.00,"DET","2009-10",2010),
(24.40,15,50,16,49,-8.71,0.59,-8.12,105.20,113.80,-8.60,100.30,0.26,0.35,0.54,0.50,13.20,21.50,0.21,0.55,13.70,76.40,0.19,"Chase Center",614176.00,18064.00,"GSW","2019-20",2020),
(28.70,50,32,55,27,5.09,-0.02,5.07,110.00,104.50,5.50,91.70,0.30,0.23,0.55,0.52,12.90,26.80,0.22,0.48,12.10,76.30,0.21,"AT&T Center",741676.00,18090.00,"SAS","2009-10",2010),
(26.00,23,59,24,58,-6.66,0.34,-6.32,102.20,109.00,-6.80,98.50,0.27,0.30,0.53,0.49,15.20,25.40,0.20,0.52,13.50,77.10,0.24,"Talking Stick Resort Arena",701405.00,17107.00,"PHO","2015-16",2016),
(30.90,50,32,48,34,2.29,-0.57,1.73,101.10,98.50,2.60,87.10,0.30,0.22,0.52,0.47,13.70,24.30,0.23,0.46,15.30,72.70,0.21,"AmericanAirlines Arena",678186.00,16541.00,"MIA","2000-01",2001),
(27.90,43,39,39,43,-0.85,-0.38,-1.23,104.90,105.70,-0.80,97.40,0.29,0.31,0.54,0.50,14.20,23.60,0.21,0.51,13.80,76.10,0.18,"Philips Arena",654306.00,15959.00,"ATL","2016-17",2017),
(25.40,20,62,19,63,-8.76,0.72,-8.04,100.50,109.50,-9.00,96.30,0.27,0.13,0.51,0.47,14.30,26.80,0.20,0.50,11.90,73.70,0.21,"KeyArena at Seattle Center",547556.00,13355.00,"SEA","2007-08",2008),
(26.60,53,19,50,22,6.24,-0.26,5.97,111.10,105.00,6.10,100.90,0.26,0.42,0.57,0.54,13.10,21.30,0.21,0.50,14.60,76.70,0.20,"Scotiabank Arena",633456.00,19796.00,"TOR","2019-20",2020),
(23.40,17,65,19,63,-9.21,0.28,-8.93,104.50,113.70,-9.20,99.60,0.27,0.33,0.53,0.49,12.40,22.10,0.20,0.53,11.70,76.10,0.20,"Madison Square Garden (IV)",779087.00,19002.00,"NYK","2018-19",2019),
(23.50,24,58,31,51,-3.41,-0.29,-3.70,103.20,106.90,-3.70,92.00,0.34,0.20,0.53,0.48,15.40,27.00,0.26,0.50,14.50,73.80,0.28,"TD Banknorth Garden",690576.00,16843.00,"BOS","2006-07",2007),
(24.10,40,42,37,45,-1.51,0.13,-1.39,108.30,109.90,-1.60,93.60,0.32,0.15,0.54,0.49,13.70,31.30,0.23,0.52,13.20,73.30,0.20,"FedEx Forum",552914.00,13486.00,"MEM","2009-10",2010),
(24.00,19,63,19,63,-9.34,0.73,-8.61,105.90,115.10,-9.20,100.50,0.26,0.34,0.55,0.51,13.80,20.50,0.20,0.55,13.50,72.50,0.24,"Talking Stick Resort Arena",627023.00,15293.00,"PHO","2018-19",2019),
(25.70,32,50,34,48,-2.61,0.28,-2.33,108.10,110.80,-2.70,96.70,0.27,0.32,0.54,0.50,12.90,24.40,0.21,0.52,13.00,72.70,0.21,"Madison Square Garden (IV)",790801.00,19288.00,"NYK","2008-09",2009);
