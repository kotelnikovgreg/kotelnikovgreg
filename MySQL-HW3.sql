DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;


DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(100),
	lastname VARCHAR(100),
	email VARCHAR(100) UNIQUE,
	phone BIGINT UNSIGNED UNIQUE,
	password_hash VARCHAR(256),
	INDEX idx_users_username(firstname, lastname)
);


# 1 X 1
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles(
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	gender CHAR(1),
	hometown VARCHAR(200),
	birthday DATETIME,
	created_at DATETIME DEFAULT NOW()
);
# 1 X M
#ALTER TABLE profiles ADD CONSTRAINT fk_profiles_user_id;
#FOREIGN KEY (user_id) REFERENCES users(id);


DROP TABLE IF EXISTS massages;
CREATE TABLE massages(
	id SERIAL,
	for_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	created_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (for_user_id) REFERENCES users(id),
	FOREIGN KEY (to_user_id) REFERENCES users(id),
);


DROP TABLE IF EXISTS friend_requests;
CREATE TABLE friend_requests(
	initiator_user_id BIGINT UNSIGNED NOT NULL,
	target_user_id BIGINT UNSIGNED NOT NULL,
	status ENUM('requested', 'approved', 'declined', 'unfriended')
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
	PRIMARY KEY (initiator_user_id, target_user_id),
	FOREIGN KEY (initiator_user_id) REFERENCES users(id),
	FOREIGN KEY (target_user_id) REFERENCES users(id),
	CHECK (initiator_user_id != target_user_id)
);

# M X M




