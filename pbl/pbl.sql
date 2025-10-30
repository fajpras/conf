
create database Status;
use Status;

create table user( 
nama varchar(20) not null, foto varchar(255), cover varchar(255), email varchar(30) not null unique, password varchar(30) not null, primary key (nama));



create table status(
statusId int not null, link varchar(255) not null, date datetime not null, place varchar(255) not null, text varchar(255) not null, username varchar(30) not null, primary key(statusId), foreign key (username) references user(nama) on delete cascade);

create table comment(commenId int not null,
parent int not null, text varchar(255) not null, tanggal date, primary key (commenId), foreign key (parent) references status(statusId) on delete cascade );



INSERT INTO user  VALUES
('Bintang', 'bintang.jpg', 'cover1.jpg', 'bintang@gmail', 'passw123'),
('Alya', 'alya.png', 'cover2.jpg', 'alya@gmail', 'qweq'),
('Rizky', 'rizky.jpeg', 'cover3.jpg', 'rizky@gmial', '9009'),
('Nadia', 'nadia.jpg', 'cover4.jpg', 'nadia@gmial', 'nafid'),
('Dimas', 'dimas.png', 'cover5.jpg', 'dimas@gmail', 'diman'),
('Siti', 'siti.jpg', 'cover6.jpg', 'siti@gmial', '243'),
('rido', 'rido.jpeg', 'coverrido.jpg', 'rido@gmial', '9fwee'),
('Andi', 'andipo.jpeg', 'andi.jpg', 'andi@gmial', 'gwge'),
('kuman', 'kumaAn.jpeg', 'kuman.jpg', 'kuman@gmial', '0ioho'),
('varika', 'fqfwf.jpeg', 'vewf.jpg', 'vvwef@gmial', 'fewf');



INSERT INTO status  VALUES
(1, 'contoh.com', '2025-10-30 09:15:00', 'Jakarta', 'Hari 1 di kantor', 'Bintang'),
(2, 'contoh.com', '2025-10-30 10:05:00', 'Bandung', 'ngeteh enak juga', 'Alya'),
(3, 'contoh.com', '2025-10-29 18:40:00', 'Surabaya', 'ngoding seru', 'Rizky'),
(4, 'contoh.com', '2025-10-29 21:10:00', 'Yogyakarta', 'sunset di jawa', 'Nadia'),
(5, 'contoh.com', '2025-10-28 14:25:00', 'Malang', 'akhirnya selesai', 'Dimas'),
(6, 'contoh.com', '2025-10-28 19:55:00', 'Semarang', 'filem nya seru banget', 'Siti'),
(7, 'contoh.com', '2025-10-27 08:30:00', 'Depok', 'joging di hari apa', 'Bintang'),
(8, 'contoh.com', '2025-10-27 11:10:00', 'Bali', 'enak libuaran kemana', 'kuman'),
(9, 'contoh.com', '2025-10-29 11:23:00', 'Demak', 'sawah hijau', 'varika'),
(10, 'contoh.com', '2025-10-28 12:10:00', 'Batam', 'Ada jembatn barelang', 'rido');

INSERT INTO comment  VALUES
(1, 1, 'kanto aku juga', '2025-10-31'),
(2, 1, 'Setuju banget sama ini.', '2025-10-31'),
(3, 2, 'ngeteh apa sis!', '2025-10-31'),
(4, 2, 'neng keni enak', '2025-10-31'),
(5, 3, 'mata mu.', '2025-10-30 12:45:00'),
(6, 3, 'Mantap, lanjutkan!', '2025-10-30'),
(7, 4, 'Postingan ini bikin semangat.', '2025-10-30'),
(8, 4, 'jawa mana ni?', '2025-10-30'),
(9, 5, 'keren dimas', '2025-10-29'),
(10, 5, 'hebat dimas.', '2025-10-29');
