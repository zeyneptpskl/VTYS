create database school_library;

use school_library;
create table uyeler(
uyeNo int not null Primary Key identity(1,1),
uyeAdi nvarchar(50) not null,
uyeSoyadi nvarchar(50) not null,
eposta nvarchar(100) not null,
cinsiyet char(2),
telefon int
);

use school_library;
create table adresler(
adresNo int not null Primary Key identity(1,1),
sehir nvarchar(50) ,
mahalle nvarchar(100),
binaNo int,
cadde nvarchar(200),
ulke nvarchar(50),
postaKodu int,
);


create table kutuphane(
kutuphaneNo int not null identity(1,1) PRIMARY KEY,
kutuphaneIsmi nvarchar(150),
aciklama nvarchar(500),
adresNo int constraint FK_adresler_kutuphane
FOREIGN KEY(adresNo) references adresler(adresNo)
);
select * from kutuphane

ALTER TABLE UYELER ADD adresNo int
constraint FK_uyeler_adres
FOREIGN KEY (adresNo)
references ADRESLER (adresNo);

create table emanet(
emanetNo int not null identity(1,1) PRIMARY KEY,
emanetTarihi datetime,
teslimTarihi datetime,
uyeNo int constraint FK_uye_emanet
FOREIGN KEY(uyeNo) references uyeler(uyeNo),

kutuphaneNo int constraint FK_kutuphane_emanet
FOREIGN KEY(kutuphaneNo) references kutuphane(kutuphaneNo),

ISBN nvarchar(50) constraint FK_kitap_emanet
FOREIGN KEY(ISBN) references kitaplar(ISBN)
);

create table kitaplar(
ISBN nvarchar(50) not null PRIMARY KEY,
kitapAdi nvarchar(100),
sayfaSayisi int,
yayinTarihi datetime
);

create table yazarlar(
yazarNo int not null primary key identity(1,1),
yazarAdi nvarchar(50) not null,
yazarSoyadi nvarchar(50) not null
);

create table kategoriler(
kategoriNo int not null primary key identity(1,1),
kategoriAdi nvarchar(50)not null
);

create table bulunur1(
miktar int not null primary key identity(1,1),
kutuphaneNo int constraint FK_kutuphane_bulunur1 foreign key(kutuphaneNo) references kutuphane(kutuphaneNo),
ISBN nvarchar(50) constraint FK_kitaplar_bulunur1 foreign key(ISBN) references kitaplar(ISBN),
);

create table yazar(
yazarNo int not null primary key identity(1,1),
yazarNumber int constraint FK_yazarlar_yazar foreign key(yazarNumber) references yazarlar(yazarNumber),
ISBN nvarchar(50) constraint FK_kitap_yazar foreign key(ISBN) references kitaplar(ISBN),
);

create table bulunur2(
bulunurNo int not null primary key identity(1,1),
kategoriNo int constraint FK_kategoriler_bulunur2 foreign key(kategoriNo) references kategoriler(kategoriNo),
ISBN nvarchar(50) constraint FK_kitaplar_bulunur2 foreign key(ISBN) references kitaplar(ISBN),
);