CREATE TABLE tb_user (
	username VARCHAR(64) NOT NULL PRIMARY KEY,
	password CHAR(32) NOT NULL,
	email VARCHAR(64), 
	regip VARCHAR(16),
	regtime INTEGER,
	lastip VARCHAR(16),
	lasttime INTEGER,
	scores integer,
	points integer);

CREATE TABLE tb_log (
	username VARCHAR(64),
	eventip VARCHAR(16),
	eventtime INTEGER,
	eventtype INTEGER);