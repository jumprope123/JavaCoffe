-- review
create table Review(
    rno int primary key auto_increment,
    title varchar(100) not null ,
    userid varchar(16) not null ,
    regdate timestamp default current_timestamp,
    views int default 0,
    thumbs int default 0,
    contents text not null,
    fnames varchar(1000),
    fsizes varchar(1000),
    uuid varchar(20)
);

-- crud
insert into Review (title, userid, contents, fnames, fsizes, uuid, regdate) values ();

select rno, title, userid, regdate, views, thumbs from Review order by rno desc ;

select * from Review where rno = ?;

select rno from Review order by rno desc limit 0,1;

select AUTO_INCREMENT-1 rno from information_schema.TABLES where TABLE_NAME = 'Review';