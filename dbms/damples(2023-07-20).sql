CREATE DATABASE tourDB;
DROP TABLE tbl_tour;
USE tourDB;
CREATE TABLE tbl_tour (
	tour_code VARCHAR(5) PRIMARY KEY,
    tour_category VARCHAR(20),
    sub_category VARCHAR(20),
    main_category VARCHAR(25),
    tour_name VARCHAR(50),
    tour_addr VARCHAR(125),
    tour_time VARCHAR(200),
    tour_rtime VARCHAR(23),
    tour_tel VARCHAR(15),
    tour_notic VARCHAR(200),
    tour_page VARCHAR(100),
    tour_fee VARCHAR(200),
    tour_info VARCHAR(300),
    tour_imgcode VARCHAR(5)
);

DROP TABLE tbl_tour;

SELECT * FROM tbl_tour;		
SELECT * FROM tbl_tour WHERE main_category='hotplace' ORDER BY sub_category, tour_code;
SELECT * FROM tbl_tour WHERE tour_code = 'A0001';
show databases;

CREATE TABLE tbl_image (
	image_code VARCHAR(10) primary KEY,
    image_name VARCHAR(50) 
);
SELECT * FROM tbl_image;
ALTER TABLE tbl_image
ADD image_data LONGBLOB;
ALTER TABLE tbl_tour
ADD CONSTRAINT f_imgcode
FOREIGN KEY (tour_imgcode)
references tbl_image (image_code);

CREATE TABLE events (
	id INT PRIMARY KEY auto_increment,
    date DATE NOT NULL,
    event_info VARCHAR(255) NOT NULL
);
INSERT INTO events (date, event_info) VALUES ('2023-04-30', '선재생일');
INSERT INTO events (date, event_info) VALUES ('2023-06-03', '선재');
INSERT INTO events (date, event_info) VALUES ('2023-07-04', '안돼');
INSERT INTO events (date, event_info) VALUES ('2023-07-05', '안바꿔줘');
INSERT INTO events (date, event_info) VALUES ('2023-07-06', '돌아가');
INSERT INTO events (date, event_info) VALUES ('2023-07-27', '이벤트');
INSERT INTO events (date, event_info) VALUES ('2023-07-27', '두번째');
INSERT INTO events (date, event_info) VALUES ('2023-07-27', '세번째');
INSERT INTO events (date, event_info) VALUES ('2023-07-27', '네번째');
INSERT INTO events (date, event_info) VALUES ('2023-07-28', 'Event 2');
INSERT INTO events (date, event_info) VALUES ('2023-07-28', 'ENTJ 는 건방져도 돼');
INSERT INTO events (date, event_info) VALUES ('2023-07-29', 'Event 3');
INSERT INTO events (date, event_info) VALUES ('2023-08-02', '힘내');
INSERT INTO events (date, event_info) VALUES ('2023-08-04', '진정해');
INSERT INTO events (date, event_info) VALUES ('2023-08-15', '화내면안돼');
INSERT INTO events (date, event_info) VALUES ('2023-06-15', '강유은짱');
INSERT INTO events (date, event_info) VALUES ('2023-11-28', '유은탄신일');
SELECT * FROM events;
TRUNCATE TABLE events;

CREATE TABLE posts (
    seq INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    file_path VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    views INT DEFAULT 0
);
SELECT * FROM posts;
SELECT COUNT(*) FROM tbl_books WHERE
b_name LIKE concat('%','부자','%') OR
b_name LIKE concat('%','행복','%') OR
b_name LIKE concat('%','부동산','%');

SELECT * FROM tbl_books WHERE
b_name LIKE concat('%','부자','%') OR
b_name LIKE concat('%','행복','%') OR
b_name LIKE concat('%','부동산','%');
 