USE c_cs108_pfarejow;
  
DROP TABLE IF EXISTS users;
 -- remove table if it already exists and start from scratch

CREATE TABLE users (
	user_id INT UNSIGNED AUTO_INCREMENT,
    email VARCHAR(255),
    password VARCHAR(255),
    salt VARCHAR(255)
    name VARCHAR(255),
    admin_privilege BOOL,
    PRIMARY KEY (user_id)
);

DROP TABLE IF EXISTS admins;

CREATE TABLE admins (
	user_id INT UNSIGNED AUTO_INCREMENT,
    email VARCHAR(255),
    password VARCHAR(255),
    salt VARCHAR(255)
    name VARCHAR(255),
    admin_privilege BOOL,
    PRIMARY KEY (user_id)
);

DROP TABLE IF EXISTS friends;

CREATE TABLE friends(
	user_id_1 INT(16) UNSIGNED,
	user_id_2 INT(16) UNSIGNED
);

DROP TABLE IF EXISTS friend_requests;

CREATE TABLE friend_requests (
	user_id_1 INT(16) UNSIGNED,
	user_id_2 INT(16) UNSIGNED
);