CREATE TABLE tb_login (
	cookie CHAR(32) NOT NULL PRIMARY KEY,
	uid INTEGER NOT NULL,
	expire INTEGER NOT NULL,
	KEY (expire));