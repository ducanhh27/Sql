/*Tạo database */
create database school;
use school
/*Tạo Bảng */
CREATE TABLE SinhVien (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birthday DATE,
    email VARCHAR(100)
);
/*Thêm thông tin vào bảng */
insert into SinhVien(id,full_name,birthday,email)
values(7,'Nguyen Duc','1991-09-27','Mai@gmail.com')

);
/*Đổi tên cột name thành full_name */
sp_rename 'SinhVien.name', 'full_name', 'COLUMN';
);
/*Hiển thị tất cả sinh viên */
select *
from SinhVien

/*Hiển thị tất cả sinh viên sau 1995 */
select full_name,email
from SinhVien
where birthday > '1995-12-31'
order by birthday DESC

/*Cập nhật và xóa dữ liệu */
Update SinhVien
set email =NULL
where full_name LIKE 'Nguyen%';

Delete from SinhVien
where birthday <'1992-01-01'

/*Tạo và sử dụng khóa ngoại */
CREATE TABLE Khoahoc (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);

INSERT INTO Khoahoc (id,name, description)
VALUES  (1,'Toán', 'Học toán'),
		(2,'Lý', 'Học lý'),
		(3,'Hóa','Học hóa'),
		(4,'Sinh','Học sinh');

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES SinhVien(id),
    FOREIGN KEY (course_id) REFERENCES Khoahoc(id),
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO enrollments (student_id, course_id)
VALUES(1, 1), (1, 2), (2, 3), (3, 1),(3, 4)

SELECT s.full_name, c.name AS course_name
FROM SinhVien s
INNER JOIN enrollments e ON s.id = e.student_id
INNER JOIN Khoahoc c ON e.course_id = c.id;