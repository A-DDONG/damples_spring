create database tourdb;
use tourdb;
CREATE TABLE tbl_tour (
	tour_code VARCHAR(5) PRIMARY KEY,
    tour_category VARCHAR(20),
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
CREATE TABLE tbl_image (
	image_code VARCHAR(10) primary KEY,
    image_name VARCHAR(50) 
);
select * from tbl_tour;
select * from tbl_tour where tour_code='A0001';

select * from events;

INSERT INTO events (date, event_info) VALUES ('2023-08-01', '고서포도축제');
INSERT INTO events (date, event_info) VALUES ('2023-10-01', '가로수사랑음악회');
INSERT INTO events (date, event_info) VALUES ('2023-10-15', '대숲맑은 담양한우축제');
INSERT INTO events (date, event_info) VALUES ('2023-10-25', '창평전통음식축제');
INSERT INTO events (date, event_info) VALUES ('2023-12-25', '담양산타축제');
delete from events where id=19;