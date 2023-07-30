CREATE DATABASE tourDB;
DROP TABLE tbl_tour;
USE tourDB;
CREATE TABLE tbl_tour (
	tour_code VARCHAR(5) PRIMARY KEY,
    tour_category VARCHAR(20),
	sub_category VARCHAR(20),
    main_category VARCHAR(20),
    tour_name VARCHAR(50),
    tour_addr VARCHAR(125),
    tour_time VARCHAR(200),
    tour_rtime VARCHAR(23),
    tour_tel VARCHAR(15),
    tour_notic VARCHAR(200),
    tour_page VARCHAR(100),
    tour_fee VARCHAR(200),
    tour_info VARCHAR(300),
    tour_imgcode VARCHAR(5),
    tour_x_coord int NULL,
    tour_y_coord int NULL
);
SELECT * FROM tbl_tour;
DROP TABLE tbl_tour;
SELECT * FROM tbl_tour WHERE main_category = '핫플' AND sub_category = 'all'