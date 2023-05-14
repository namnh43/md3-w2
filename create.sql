create database nhapxuathang;
use nhapxuathang;

create table vattu (
    id int not null unique primary key auto_increment,
    vattu_ms varchar(20),
    vattu_ten varchar(20),
    vattu_donvi varchar(20),
    vattu_giatien int
);
insert into vattu (vattu_ms, vattu_ten, vattu_donvi, vattu_giatien) VALUES
                ('ms01','vat tu 1','chiec',1000),
                ('ms02','vat tu 2','chiec',2000),
                ('ms03','vat tu 3','chiec',4000),
                ('ms04','vat tu 4','chiec',5000),
                ('ms05','vat tu 5','chiec',9000);
create table tonkho (
    id int not null unique primary key auto_increment,
    vattu_id int,
    foreign key (vattu_id) references vattu(id),
    soluongdau int,
    soluongnhap int,
    soluongxuat int,
    check ( tonkho.soluongdau + tonkho.soluongnhap >= tonkho.soluongxuat)
);
insert into tonkho (vattu_id, soluongdau, soluongnhap, soluongxuat) VALUES
                    (1,100,200, 150),
                    (2,200,100,50),
                    (3,500,0,250),
                    (4,1000,2000,2500),
                    (5,0,1000,1000);

create table nhacungcap (
    id int not null unique primary key auto_increment,
    nhacungcap_maso varchar(20),
    nhacungcap_ten varchar(20),
    nhacungcap_diachi varchar(20),
    nhacungcap_sdt varchar(20)
);
insert into nhacungcap (nhacungcap_maso, nhacungcap_ten, nhacungcap_diachi, nhacungcap_sdt) VALUES
                        ('ncc_01','ncc1','vietnam','0987654321'),
                        ('ncc_02','ncc2','thailand','0987654322'),
                        ('ncc_03','ncc3','china','0987654323');

create table dondathang (
    id int not null unique primary key auto_increment,
    dathang_madon varchar(20),
    dathang_date DATETIME,
    dathang_ncc int,
    foreign key (dathang_ncc) references nhacungcap(id)
);
insert into dondathang (dathang_madon, dathang_date, dathang_ncc) VALUES
                      ('madon_01','2008-11-11',1),
                      ('madon_02','2008-11-09',2),
                      ('madon_03','2008-10-29',3);

create table phieunhap (
   id int not null unique primary key auto_increment,
   phieunhap_maso varchar(20),
   phieunhap_ngaynhap datetime,
   phieunhap_donhang int,
   foreign key (phieunhap_donhang) references dondathang(id)
);

insert into phieunhap (phieunhap_maso, phieunhap_ngaynhap, phieunhap_donhang)  values
                       ('phieunhap_01','2008-11-20',1),
                       ('phieunhap_02','2008-11-25',3),
                       ('phieunhap_03','2008-11-26',2);

create table phieuxuat (
                           id int not null unique primary key auto_increment,
                           phieuxuat_maso varchar(20),
                           phieuxuat_ngayxuat varchar(20),
                           phieuxuat_tenkhachhang varchar(20)
);
insert into phieuxuat (phieuxuat_maso, phieuxuat_ngayxuat, phieuxuat_tenkhachhang) VALUES
                       ('phieuxuat_01', '2008-12-01','khach hang 01'),
                       ('phieuxuat_02', '2008-12-02','khach hang 02'),
                       ('phieuxuat_03', '2008-12-03','khach hang 03');

create table chitietdonhang (
                                id int not null unique primary key auto_increment,
                                chitietdonhang_donhangid int,
                                chitietdonhang_vattuid int,
                                chitietdonhang_soluong int,
                                foreign key (chitietdonhang_donhangid) references dondathang(id),
                                foreign key (chitietdonhang_vattuid) references vattu(id)
);
insert into chitietdonhang (chitietdonhang_donhangid, chitietdonhang_vattuid, chitietdonhang_soluong) VALUES
                                      (1,1,100),
                                      (1,2,200),
                                      (1,3,300),
                                      (2,1,500),
                                      (2,2,600),
                                      (3,1,1000),
                                      (3,3,500);
create table chitietphieunhap (
                                  id int not null unique primary key auto_increment,
                                  chitietphieunhap_phieunhapid int,
                                  chitietphieunhap_vattuid int,
                                  chitietphieunhap_soluong int,
                                  chitietphieunhap_dongia int,
                                  chitietphieunhap_ghichu varchar(20),
                                  foreign key (chitietphieunhap_phieunhapid) references phieunhap(id),
                                  foreign key (chitietphieunhap_vattuid) references vattu(id)
);
insert into chitietphieunhap (chitietphieunhap_phieunhapid, chitietphieunhap_vattuid, chitietphieunhap_soluong, chitietphieunhap_dongia, chitietphieunhap_ghichu) VALUES
                          (1,1,100,1000,'ghi chu 1'),
                          (1,2,200,2000,'ghi chu 2'),
                          (1,3,300,3000,'ghi chu 3'),
                          (2,4,200,2000,'ghi chu 4'),
                          (2,5,300,4000,'ghi chu 5'),
                          (3,2,400,5000,'ghi chu 6'),
                          (3,3,500,2000,'ghi chu 7');

create table chitietphieuxuat (
                                  id int not null unique primary key auto_increment,
                                  chitietphieuxuat_phieuxuatid int,
                                  chitietphieuxuat_vattuid int,
                                  chitietphieuxuat_soluong int,
                                  chitietphieuxuat_dongia int,
                                  chitietphieuxuat_ghichu varchar(20),
                                  foreign key (chitietphieuxuat_phieuxuatid) references phieuxuat(id),
                                  foreign key (chitietphieuxuat_vattuid) references vattu(id)
);

insert into chitietphieuxuat (chitietphieuxuat_phieuxuatid, chitietphieuxuat_vattuid, chitietphieuxuat_soluong, chitietphieuxuat_dongia, chitietphieuxuat_ghichu) VALUES
                        (1,1,100,300,'ghi chu 1'),
                        (1,3,300,320,'ghi chu 1'),
                        (1,5,500,450,'ghi chu 1'),
                        (2,1,100,370,'ghi chu 1'),
                        (2,3,300,300,'ghi chu 1'),
                        (3,1,100,300,'ghi chu 1');
