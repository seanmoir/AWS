/* Basic small table to hold tasks
    ID - incremental unique integer
    task - task name UNIQUE
*/
CREATE DATABASE todo;
USE todo;
CREATE USER 'webuser'@'%' IDENTIFIED BY 'insecure_db_pw';
GRANT ALL PRIVILEGES ON todo.* TO 'webuser'@'%';

CREATE TABLE todo_list (
    id int PRIMARY KEY AUTO_INCREMENT,
    task varchar(255) UNIQUE NOT NULL
);

INSERT INTO todo_list(task) VALUES ('test');
INSERT INTO todo_list(task) VALUES ('abcd');
INSERT INTO todo_list(task) VALUES ('sample');
INSERT INTO todo_list(task) VALUES ('data');