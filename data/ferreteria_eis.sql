CREATE DATABASE ferreteria_eis;

USE ferreteria_eis;

CREATE TABLE users(
    username varchar(20) NOT NULL PRIMARY KEY,
    password varchar(32) NOT NULL,
    privilege integer NOT NULL DEFAULT -1,
    status integer NOT NULL DEFAULT 1,
    name varchar(150) NOT NULL,
    email varchar(100) NOT NULL,
    other_data varchar(50) NOT NULL,
    user_hash varchar(32) NOT NULL,
    change_pwd integer NOT NULL DEFAULT 1,
    created timestamp NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE sessions(
    session_id char(128) UNIQUE NOT NULL,
    atime timestamp NOT NULL default current_timestamp,
    data text
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE logs( 
    id_log integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username varchar(20) NOT NULL,
    ip varchar(16) NOT NULL,
    access timestamp NOT NULL,
    FOREIGN KEY (username) REFERENCES users(username)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO users (username, password, privilege, status, name, email, other_data, user_hash, change_pwd)
VALUES ('admin',MD5(concat('admin', 'kuorra_key')), 0, 1, 'Admin', 'admin@gmail.com','TIC:SI', MD5(concat('admin', 'kuorra_key', '2016/06/04')), 0),
('guess',MD5(concat('guess', 'kuorra_key')), 1, 1, 'Guess', 'guess@gmail.com','TIC:SI', MD5(concat('guess', 'kuorra_key','2016/06/04')), 0);


Create table if not exists clientes(
id_clientes		int(5)	    	not null		auto_increment		primary key,
nombre 			varchar(20)		not null,
ape_pat 			varchar(30) 	not null,
ape_mat 			varchar(30) 	not null,
telefono			varchar(10)		not null,
email				varchar(50)		not null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into clientes (nombre, ape_pat, ape_mat, telefono, email) values
('Esteban', 'Islas', 'Santos', '7757578912', 'steph@steph.com'),
('Andrea', 'Serrano', 'Guerrero', '7717023678', 'andy@andy.com');


SELECT * FROM users;
SELECT * FROM sessions;

create user 'steph'@'localhost' IDENTIFIED BY 'steph.2019';
Grant ALL PRIVILEGES ON ferreteria_eis.* TO'steph'@'localhost';
FLUSH PRIVILEGES;
