use Northwind

--select komutu
select 3
--üç farklı olarak getirir
select 3,5,7
--bütün tabloyu getirsin
select * from Urunler
--Personeller tablosundaki ad ve soyadı getirsin.
select adi,soyadi from Personeller

--alias(atama)
select 3 as değer
select 'gençay' adı, 'yıldız' soyadı

--boşluk karakteri olan alias atama
select 1453 [İstanbul'un Fethi]

--boşluk karakteri olan tabloyu sorgulama
select * from [Satis Detaylari]

--kolonları birleştirme
select Adi+' '+Soyadi[Personel Bilgileri] from Personeller

--farklı tipteki kolonları birleştirme
select Adi+' '+convert(nvarchar, IseBaslamaTarihi) from Personeller
 

 --where(şart)
 
 --personeller tablosunda şehri 'London' olan verileri listeleyelim.
 select * from Personeller where Sehir='London'

 --personeller tablosuna bağlı çalıştığı kişi sayısı 5'ten küçük olan verileri listeleyelim.
 select * from Personeller where BagliCalistigiKisi<5

 --and operatörü(ve)
 --personeller tablosunda şehri London ve ülkesi UK olan verileri listeleyelim.
 select*from Personeller where Sehir='London' and Ulke='UK'

 --or öperatörü(veya)
--personeller tablosunda UnvanEki 'Mr' olan veya şehri 'Seattle' oaln verileri listeleyelim.
select *from Personeller where UnvanEki='Mr' or Sehir='Seattle'

--karışık tabloları
--personeller tablosundaki Robert King'in tüm verilerini listeleyelim.
select * from Personeller where Adi='Robert' and Soyadi='King'

--personel id'si 5 olan kişiyi getir
select * from Personeller where PersonelID=5


--<> eşit değilse
-- = eşitse
-->= büyük veya eşitse
--<= küçük veya eşitse

--fonksiyon sonuçlarını şart olarak kullanmak.

--1993 yılında işe girenleri verisini listeleyelim.
select * from Personeller where YEAR(IseBaslamaTarihi)=1993

--doğum günü ayın 29'u olmayan personellerin verisini listeleyelim
select * from Personeller where DAY(DogumTarihi)<>29 

--doğum yılı 1950 ile 1965 arasında olan personellerin verisini listeleyelim.
select * from Personeller where YEAR(DogumTarihi)>1950 and YEAR(DogumTarihi)<1965 

--yaşadığı şehrin adını London,Tacoma,Kirkland olan personellerin adını listeleyelim.
select * from Personeller where Sehir='London' or Sehir='Tacoma' or Sehir='Kirkland'

--between(arasında)

--doğum tarihi 1950 ile 1965 arasında olanları listeledik
select * from Personeller where YEAR(DogumTarihi) between 1950 and 1965

--in(içinde)

--birden fazla or yazmak yerine tek 'in' ile birden fazlasını kapsamış oldu
select * from Personeller where Sehir in ('London','Tacoma','Kirkland')

--Like Operatörü
--%(Genel önemli değil)
--_(Özel önemli değil)


--%(Genel önemli değil)
--içinde baş harfi j olan personellerin adının verisini listeleyelim.
select * from Personeller where adi Like 'j%';

--isminin son harfi y olan personellerin adını ve soyadını yazdıralım
select adi,soyadi from Personeller where adi Like '%y'

--isminin 3 harfi sonunda olan 'ert' olan personeli getirelim.
select * from Personeller where Adi Like'ert%'

--isminin ilk harfi r son harfi t olan personeli getirelim.
select * from Personeller where adi like'r%t'

--içinde an geçen personellerin adını yazdıralım.
select * from Personeller where Adi like '%an%'

--isminin baş harfi n olan ve içinde an geçen personeli yazdıralım.
select * from Personeller where Adi like 'n%an%'

--_(Özel önemli değil)
--isminin ilk harfi a,ikincisi önemli değil ve üçüncüsü d olan personeli listeleyelim.
select * from Personeller where adi Like'a_d%'

--[](ya da)operatörü
--isminin ilk harfi n veya m veya r olan personelleri listeleyin
select * from Personeller where adi Like '[nmr]%'

--[*-*](alfabetik arasında)operatörü
--isminin baş harfi a ile k arasında alfabetik sıraya göre herhangi bir harf olan personellerin adını yazdıralım.
select adi from Personeller where adi like'[a-k]%'

--[^*](Değil)operatörü
--isminin baş harfi a olmayan personelleri getirelim.
select * from personeller where adi Like '[^a]%'

--Escape(kaçış)karakteri nasıl sağlarız
--[] ile, Escape komutu ile

select * from Personeller where adi Like '[_]%'

select * from Personeller where adi Like '?_%' Escape '?'

--AGGREGATE FONKSİYONLAR
--AVG,MAX,MİN,COUNT,SUM

--AVG:ORTALAMA ALIR
select AVG(PersonelID) as 'Personel Id ortalaması' from Personeller

--MAX:EN BÜYUK DEĞER
select MAX(PersonelID) as'En büyük Personel Id' from Personeller

--MİN:EN KÜÇÜK DEĞER
select MIN(PersonelID) as'En küçük Personel Id' from Personeller

--COUNT:TOPLAM SAYISINI VERİR
Select COUNT(*) from Personeller
select COUNT(Adi) as'Personel Adı toplam sayısı' from Personeller

--SUM:TOPLAMINI VERİR
SELECT SUM(NakliyeUcreti)as 'Nakliye Ücreti toplamı' from Satislar



--STRİNG FONKSİYONLARI
--LEFT,RIGHT,UPPER,LOWER,SUBSTRİNG,LTRİM,RTRİM,REVERSE,REPLACE,CHARINDEX

--left:sol (baştan) getirilen sayıda karakteri getirir.
select left(adi,2) from Personeller

--right:sağ(sondan) getirilen sayıda karakteri getirir.
select right(soyadi,3) as'Soyadi' from Personeller

--upper:büyük harfe çevirir.
select upper(adi) from Personeller

--lower:küçük harfe çevirir
select lower(soyadi) from Personeller

--substring:belirtilen indexten itibaren belirtilen sayıda karakter girer.
select SUBSTRING(adi,3,2) from Personeller

--ltrim:soldan boşlukları keser.
select LTRIM('      mert') 

--rtrim:sağdaki boşlukları keser.
select RTRIM('        yılmaz')

--reverse:tersten yaptırır.
select REVERSE(adi) from Personeller

--replace:belirtilen ifadeyi, belirtilen ifade ile değiştirir.
select REPLACE('benim adım mert','mert','kürşad')

--charindex:beliritlen karakterin veri içinde sıra numaraını verir.
select MusteriAdi, CHARINDEX('',MusteriAdi) as'Sıra Numarası' from Musteriler
select MusteriAdi,CHARINDEX('r',MusteriAdi) from Musteriler

--Müşteriler tablosunun MüşteriAdı kolonundan sadece adlarını çekelim.
select SUBSTRING(MusteriAdi,0, CHARINDEX(' ',MusteriAdi))as 'İsim çekme' from Musteriler

--Müşteriler tablosunun MüşteriAdı kolonundan sadece soyadlarını çekelim.
select SUBSTRING(MusteriAdi,CHARINDEX(' ',MusteriAdi),	
LEN(MusteriAdi) - (CHARINDEX(' ',MusteriAdi) -1)) as 'Soyisim çekme' from Musteriler

--INT(SAYISAL) FONKSİYONLAR
--PI,SIN,POWER,ABS,RAND,FLOOR

--PI:pi sayısını verir
select PI()

--SIN:sinüs sayısını verir.
SELECT SIN(90)

--POWER:Üs alır.
SELECT POWER(4,3)

--ABS:Mutlak değer alır.
SELECT ABS(12)

--RAND:0-1 arasında rastgele sayı üretir.
SELECT RAND()

--FLOOR:Yuvarlama yapar.
SELECT FLOOR(RAND()*100)



--TARİHSEL FONKSİYONLAR:
--GETDATE,DATEADD,DATEDIFF,DATEPART

--GETDATE:Anlık tarihi vermektedir.
Select Getdate()

--DateAdd:Verilen tarihe verildiği kadar gün,ay,yıl ekler.
select dateadd(day,999,getdate())
select dateadd(month,999,getdate())
select dateadd(year,999,getdate())

--datediff:iki geçen gün,ay,yıl arasındaki farkı hesaplar.
select DATEDIFF(day,'05.09.1992',getdate())
select DATEDIFF(month,'05.09.1992',getdate())
select DATEDIFF(year,'05.09.1992',getdate())

--datepart:verilen tarihin,haftanın,ayın yahut kaçıncı yıl olduğunu hesaplar
select datepart(dw,getdate())
select datepart(month,getdate())
select datepart(year,getdate())


--TOP KOMUTU:
SELECT TOP 3 * FROM PERSONELLER

--DİSTİNCT KOMUTU:
select distinct sehir from personeller

--GROUP BY:
SELECT KategoriID,Count(*) FROM Urunler GROUP BY KategoriID

--Personel Id kaç satış yaptı
select PersonelID,count(*) from Satislar Group By PersonelID

--Personel Id'lerinin nakliye ücreti ne kadardır?
select PersonelID ,sum(NakliyeUcreti) from Satislar Group By PersonelID

--Group By İşleminde Where şartını nasıl kullanırız.
--WHERE ŞARTI GROUP BY KISMINDAN ÖNCE GELİR
SELECT KategoriID,Count(*) FROM Urunler Where KategoriID>=5 GROUP BY KategoriID

--HAVİNG KOMUTU:
--GROUP BY KISMINDAN SONRA DA YAZILIR
SELECT KategoriID,Count(*) FROM Urunler Where KategoriID>=5 GROUP BY KategoriID having count(*)>6

--tabloları yan yana birleştirme
select * from personeller
select * from satislar

select * from personeller,satislar

select Personeller.PersonelID, satislar.MusteriID from Personeller,Satislar

select p.PersonelID, s.MusteriID from Personeller p,Satislar s

select * from personeller p,satislar s where p.PersonelID = s.PersonelID


--INNER JOIN KULLANIMI(iki tabloyu ilişkisel birleştirme amaçlı kullanılır)
select * from personeller p inner join satislar s on p.PersonelID=s.PersonelID

--ürünler ve kategoriler tablosunu birleştir(hangi ürün hangi kategoride)
select u.UrunAdi from Kategoriler k Inner join Urunler u on k.KategoriID= u.KategoriID

--where komutunun kullanımı örneği Beverages kategorisindeki ürünlerim.
select u.UrunAdi from Kategoriler k Inner join Urunler u on k.KategoriID= u.KategoriID 
where k.KategoriAdi='Beverages'

--Beverages kategorisindeki ürünlerimin sayısı kaçtır(Urunler,Kategoriler)
select count(*) as'kaç tane beverages var' from Kategoriler,Urunler where KategoriAdi='Beverages'

select count(*) as'kaç beverages vardır' from Urunler u Inner join Kategoriler k on k.KategoriID=u.KategoriID
where k.KategoriAdi='Beverages' -- bu benim yaptığım olan

select count(u.UrunAdi) as'kaç beverages var' from Kategoriler k Inner join Urunler u on k.KategoriID=u.KategoriID
where k.KategoriAdi='Beverages' --bu hocanın yaptığı olan

--hangi satışı hangi çalışanım yapmış(satışlar,personeller)
select * from satislar
select * from personeller

select s.satisID, p.Adi+' '+p.Soyadi as 'hangi çalışanım 'from Satislar s Inner join Personeller p on s.PersonelID=p.PersonelID

--faks numarası "null olmayan" tedarikçilerden alınan ürünler nelerdir?(Urunler,Tedarikçiler)
select * from urunler
select * from Tedarikciler where Faks not in('null')

select u.UrunAdi from Urunler u inner join Tedarikciler t on u.TedarikciID=t.TedarikciID
where t.Faks not in('null') -- bu da benim yaptığım

select u.UrunAdi from Urunler u inner join Tedarikciler t on u.TedarikciID=t.TedarikciID
where t.Faks is not null -- hoca yaptı

select u.UrunAdi from Urunler u inner join Tedarikciler t on u.TedarikciID=t.TedarikciID
where t.Faks <>'null' -- hoca yaptı 2

--Inner Join'de Personellerin bağlı olarak çalıştığı kişileri listele
select * from personeller
select p1.Adi, p2.Adi from Personeller p1 inner join Personeller p2 on p1.BagliCalistigiKisi=p2.PersonelID

--Inner Join'de Group By Kullanımı 
select count(*) as'kaç kategori id var' from Kategoriler group by KategoriID

--HANGİ PERSONELİN (ADI VE SOYADI İLE BİRLİKTE), TOPLAM KAÇ ADET SATIŞ YAPMIŞ, SATIŞ ADEDİ 100'DEN FAZLA OLANLAR VE PERSONELİN
--ADININ BAŞ HARFİ M olan kayıtlar gelsin.(Personeller,satışlar)

select * from satislar
select * from personeller

select p.Adi+' '+p.Soyadi AS'ADI VE SOYADI',count(s.SatisID) AS'KAÇ SATIŞ OLDU' from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID
where p.Adi like'm%' group by p.Adi+' '+p.SoyAdi having count(s.SatisID)>100

--hangi personelim toplam kaç satış yapmış(satışlar,personeller)
select p.Adi as'personel adı',count(s.SatisID) as'kaç satış yaptı' from Personeller p inner join satislar s on p.PersonelID=s.PersonelID
group by p.Adi

--en çok satışı hangi personelim yapmıştır(satışlar,personeller)
select p.Adi as'personel adı',count(s.SatisID) as'kaç satış yaptı' from Personeller p inner join satislar s on p.PersonelID=s.PersonelID
group by p.Adi order by count(s.SatisID) desc

--adında a harfi olan personellerin satisid'si 1050'den büyük olan satışlarının toplam tutarını (miktar*birimfiyat)
--ve bu satışların hangi tarihte gerçekleştirildiğini listele(Personeller,Satışlar,[Satış Detayları])
select * from satislar
select * from personeller
select *from [Satis Detaylari]
select sum(sd.BirimFiyati*sd.Miktar),s.SatisTarihi from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID
inner join [Satis Detaylari] sd on sd.SatisID=s.SatisID where p.Adi like '%a%' and s.SatisID>1050 group by s.SatisTarihi

--dml(data manipulation language)
--insert,update,delete,select

--Insert
select * from Personeller
Insert into Personeller Values('Yılmaz','Mert','Yazılım ve Veritabanı Uzmanı','YM','1999.09.02',GETDATE(),'Bursa','Bursa','Marmara','16000',
'Türkiye','032111111',null,null,null,null,null)
--otomatik artan(identity) kolonlara değer gönderilmez
--not null olan kolonlara boş bırakılamayacağından dolayı mutlaka değer girilmelidir.
--kolonun kabul ettiği veri tipi ve karakter uzunluğunda kayıt yapılabilir.
--tablodaki seçilen yahut bütün kolonlara değer gönderileceği belirtilip, gönderilmezse hata verir

--pratik kullanım
--tablo adı,kolonlar,değerler
insert into Personeller(soyadi,adi) values('Yıldız','Gençay')

--tablo oluşturacağız
create table OrnekPersoneller(
Adi nvarchar(max),
Soyadi nvarchar(max)
)
--tabloya yeni kolon adını girdik
alter table OrnekPersoneller add Bolge nvarchar(max)

--[insert komutu ile select sorgusu sonucu gelen verileri farklı tabloya kaydetme]
insert OrnekPersoneller Select Adi,Soyadi from Personeller 
insert OrnekPersoneller Select Bolge from Tedarikciler


--Update
--update[tablo adı] set[kolon adı]=değer
--update sorgusuna where şartını yazmak
update OrnekPersoneller set adi='Mehmet' where adi='Nancy'

--Update yapılarında inner join işlemini kullanarak birden fazla tabloda güncelleme yapmak
update Urunler set UrunAdi=k.KategoriAdi from urunler u inner join Kategoriler k on k.KategoriID=u.KategoriID

--Update sorgusunda SubQuery ile güncelleme yapmak(SubQuery:iç içe sorgu)
update urunler set UrunAdi =(select adi from Personeller where PersonelID=3)

--update sorgusunda top keywordu ile güncelleme yapmak)
update top(30) Urunler set UrunAdi='x'



--Delete
--Delete komutuna where şartını yazmak
delete from urunler where KategoriID=3

--dikkat edilmesi gereken
--delete sorgusuyla tablo içerisindeki tüm verileri silmek.identity kolonunu sıfırlamaz.
--silme işleminden sonra kalan ilk eklenen veride kalındığı yerden devam edilir.

--union:birden fazla girilen select komutunu alt alta göstermeyi sağlar

select adi,soyadi from Personeller
union 
select musteriadi,musteriunvani from Musteriler

--ikiden fazla olacaksa da
select adi,soyadi from Personeller
union 
select musteriadi,musteriunvani from Musteriler
union
select sevkadi,sevkadresi from satislar

--union'da kullanılan tablolara kolon eklenebilir.dikkat edilmesi gereken nokta,yukarıdaki kurallar çerçevesinde
--aşağıya ve yukarıya aynı sayıda kolon girmek gerekir

select adi,soyadi 'Personel' from Personeller
union 
select musteriadi,musteriunvani 'Müşteri' from Musteriler

--DDL(DATA DEFİNİATİON LANGUAGE)
--CREATE,ALTER,DROP
--CREATE YENİ BİR TABLO ADI VEYA YENİ BİR VERİ TABANI OLUŞTURMAYI SAĞLAR
--ALTER YENİ BİR KOLON ADI VE ÖZELLİK GİREBİLİRİZ.
--DROP DİREKT TABLOYU VEYA İÇİNDEKİ KOLON ADIYLA ÖZELLİĞİNİ SİLER.

--yeni bir veri tabanı oluşturup özelliklerini girelim ve açıklamasını yapalım
create database OrnekVeritabani 
On
(
Name='GG', 
Filename='D:\GG.mdf', 
Size=5, 
Filegrowth=3
)
Log
On
(
Name='GG_LOG', 
Filename='D:\GG.ldf', 
Size=5, 
Filegrowth=3
)
Create database OrnekVeritabani
--VERİTABANI FİZİKSEL İSİM
--FİZİKSEL DİZİN
--BAŞLANGIÇ BOYUTUNU MB CİNSİNDEN AYARLADIK 
--VERİTABANI BOYUTU, BAŞLANGIÇ BOYUTUNU GEÇTİĞİ DURUMDA BOYUTUN NE KADAR ARTMASI GEREKTİĞİNİ MB CİNSİNDEN BELİRTMEK

--ALTER İLE DATABASE GUNCELLEME
Alter database OrnekVeritabani
Modify File(
Name='MB',
Size=20
)
--tabloya yeni bir kolon adı ve tipini girmek.
alter table personeller add personeladi nvarchar(50)

--tablodaki kolonu güncellemek
alter table personeller alter column personeladi nvarchar(100)

--alter ile tablodaki bir kolonu silme(ornek tablo tablosundaki kolon adı olan kolon4'ü sil)
alter table ornektablo 
drop column kolon4

--constraints (kısıtlayıcılar) peki bu constraintler nelerdir:
--primary key,unique,not null,default,check,foreign key

--alter ile tabloya constraint ekleme
alter table ornektablo 
add Constraint OrnekConstraint Default 'Boş' for Kolon2

--constraint silme ise
alter table Ornektablo 
drop constraint OrnekConstraint

--sp_rename=tablo adı günceller
SP_RENAME 'OrnekTablo','OrnekTabloYeni'

--sp_rename ile kolon adı güncelleme
SP_RENAME 'OrnekTablo.Kolon1','Kolon1453','Column'

--drop ile tablo adı veri ve veritabanı silme
drop table tabloadi --tablo
drop database tabloadi --veritabanı

--default constraint
alter table OrnekTablo
add constraint tabloadi default -1 for Kolon2
Insert into OrnekTablo(Kolon2) values(0)
Insert into OrnekTablo(kolon2) values('Örnek bir değer')

--check fonksiyonu ve nocheck fonksiyonu

--check fonksiyonu
alter table OrnekTablo 
add Constraint Kolon2Control Check((Kolon2 * 5) % 2 =0)

--with nocheck fonksiyonu
--şu ana kadar olan kayıtları görmezden gelir check constraint uygulatır.
Alter Table OrnekTablo
With Nocheck Add Constraint Kolon2Control Check ((Kolon2*5)%2=0) --içerisinde bölünebilirse tabloya yazdırır.

--primary key özelliği 
alter table OrnekTablo 
Add Constraint PrimaryId Primary Key (Id)
--primary key constraint kullanılan kolon primary key özelliğine sahip olmamalıdır.

--unique birden fazla kayıt girmesini önler, tektir, benzeri yoktur.

alter table OrnekTablo 
Add Constraint OrnekTabloUnique Unique (Tablo2)

--foreign key constraint
Alter Table OrnekTablo 
Add Constraint ForeignKeyOgrenciUniDers Foreign Key(DersID) References Dersler (DersID)

--create table OrnekTablo(
--DersID int foreign key references Dersler(DersID)
--)

--cascade:bir ilişkili tabloda silinme veya güncellenme olursa, ilişkili kolondaki karşılığı da silinir.
alter table OrnekTablo
Add Constraint OrnekTablo2 Foreign Key(DersID) References Dersler(DersID)
on delete cascade
on update cascade

--set null olursa ise ifadede olan değerdeki karşılığı "null" girilir.
alter table OrnekTablo
Add Constraint OrnekTablo2 Foreign Key(DersID) References Dersler(DersID)
on delete set null
on update set null

--set default komutu 
--ana tablodaki kayıt silindiğinde ya da güncellendiğinde,ilişkili kolondaki karşılğına o kolonun default değeri basılır.Bu default değeri
--dediğimiz default tipindedir.Bunu kendimiz düzenleyebiliriz

alter table OrnekTablo
Add Constraint OrnekTablo2 Foreign Key(DersID) References Dersler(DersID)
on delete set default
on update set default

--bu ayarlar verilmediği takdirde "no action" özelliği geçerlidir.


--Transaction Sql(Tsql)

declare @yas tinyint
set @yas=3
print @yas --böyle yazdırılması gerekiyor


--değişkenin değerini okuma
declare @x int
set @x=125
select @x as'sayi' --as(alias):geçici isim

--sorgu sonucu gelen verileri değişkenle elde etme

select * from Personeller

--sorgu sonucu gelen gelen satır sayısı bir adet olmalıdır.
select Adi,SoyAdi from Personeller where PersonelID=1

declare @adi nvarchar,@soyadi nvarchar
select @adi=Adi,@soyadi=SoyAdi from Personeller where PersonelID=1
select @adi,@soyadi

--kolonlardaki verilerin tipleri ne ise o verileri temsil edecek değişkenlerin tipleri de benzer olmalıdır.


--Batch Kavramı Go
Create Database OrnekDatabase
Go
Use OrnekDatabase
Go
Create Table OrnekTablo(
Id int primary key identity(1,1),
kolon1 nvarchar(max),
kolon2 nvarchar(max)
)

--If-Else Yapısı 

--Tek satırlık çalışma 
declare @isim nvarchar(50)
set @isim='Mert'
print(@isim)

if @isim='Murat'
print 'Evet'

else
print 'Hayır'

--begin/end komutu(scope)
declare @sayi1 int=3
declare @sayi2 int=5

if @sayi1<@sayi2
begin
print 'sayı 1 sayı 2 den küçüktür'
select @sayi1 [sayı1], @sayi2[sayı 2]
end
else
begin 
print 'sayı 1 sayı 2 den büyüktür'
select @sayi1 [sayı1], @sayi2[sayı 2]
end


--örnek 1:
--müşteriler tablosunda Amerikalı(USA) müşteri var mı?
select* from musteriler where Ulke='USA'
IF @@ROWCOUNT>0
Print 'evet'
else
print 'hayır'

--adı 'mustafa' soyadı 'kara' olan bir personel var mı ? varsa evet desin. yoksa kaydetsin
declare @adi nvarchar(max)='mustafa',@soyadi nvarchar(max)='kara'

select* from personeller where adi=@adi  and soyadi=@soyadi

if @@rowcount>0
print 'evet var^'

else
begin
print 'hayır yok'
insert into personeller(adi,soyadi) values(@adi,@soyadi)
end


--if --else if --else
declare @madi nvarchar(MAX)='Mert'
declare @yas int=25

if @madi='Mahmut'
print 'adı mahmut'
else if @yas>24
print 'yaşı 24 ten büyük'
else if 3<5
print'küçüktür'
else
print'abc'


--exists fonksiyonu 
if exists(select * from Personeller)
print 'dolu'
else print 'boş'


--while komutu
--100'den küçük olacak şekilde yazdırma
declare @sayac int=0
while @sayac<100
begin
print @sayac
set @sayac=@sayac+1
end

--kopyasını kendim yazdım
--declare @sayacim int=0
--while @sayacim<100
--begin
--print @sayacim
--set @sayacim=@sayacim+1
--end


--break komutu 
declare @sayaclar int=0
while @sayaclar<1000
begin
print @sayaclar
set @sayaclar=@sayaclar+1
if @sayaclar%5=0
break
end

--kopyasını kendimiz yazalım
declare @sayacs int=0
while @sayacs<200
begin
print @sayacs
set @sayacs=@sayacs+1
if @sayacs %5=0
break
end

--case/when/then/else end komutu
select 
UrunAdi as "Ürün Adı",
BirimFiyati as "Birim Fiyatı",
case
when BirimFiyati between 10 and 30 then BirimFiyati * 0.08
when BirimFiyati between 31 and 60 then BirimFiyati * 0.15
when BirimFiyati>=61 then BirimFiyati * 0.25
end as "Tablo Adı"
from Urunler

--normal olan
update urunler set BirimFiyati= BirimFiyati * 0.08 where BirimFiyati between 10 and 30 


--stored procedures(saklı yordamlar)
create proc sp_ornek
(
@Id int --aksi takdirde söylenmezse bu parametrenin yapısı inputtur.
)
as
select * from Personeller where PersonelId =@Id


--bir de biz örneğini yapalım
create proc table_ex
@Id int
as
select * from Musteriler where MusteriID=@Id

--BURADAKİ TEK FARK BİZİM ARAYA Parantez koymamamız oldu parantez ile yaparken tek farkı daha
--okunabilir olmasıdır.

create proc sp_ornek2(
@Id int,
@parametre2 int,
@parametre3 nvarchar(max)
)
as 
select * from Personeller where PersonelId=@Id

--exec:çalıştırmna komutudur.
exec sp_ornek 3
exec sp_ornek2 3,4,'asd'

--geriye değer döndüren yordam 

--@rowcount:yukarda yapılan işlemden kaç satır etkilenmiştir.

create proc urungetir
@fiyat money
as
select * from Urunler where BirimFiyati > @fiyat
return @@rowcount
declare @sonuc int
exec @sonuc = urungetir 40
print cast(@sonuc as nvarchar(max)) + 'adet ürün bu işlemden etkilenmiştir'

--geriye değer döndüren procedure (output)
create proc sp_ornek3(
@Id int, --input değeri
@Adi nvarchar(max) output, --içerdeki değeri dışarıya döndürüyor.
@soyadi nvarchar (max) output
)
as
select @Adi Adi, @Soyadi Soyadi from Personeller where PersonelID=@Id

--kullanımı 
declare @Adi nvarchar(max),@soyadi nvarchar(max)
exec sp_ornek3 1,@Adi output, @Soyadi output
select @Adi+''+@Soyadi 

--Stored Procedures Örneği:
--Genel Örnek:
--dışarıdan aldığı isim,soyisim,şehir bilgilerini personeller tablosunda ilgili kolonlara ekleyen stored procedre'ü yazınız.
create proc sp_personelekle(
@ad nvarchar(max),
@soyad nvarchar(max),
@sehir nvarchar(max)
)
as 
insert Personeller(Adi,Soyadi,Sehir) values(@ad,@soyad,@sehir)
exec sp_personelekle 'Mert','Yılmaz','Bursa'
select *from Personeller


--prosedürlere varsayılan değerler (=)
create proc sp_personelekle2
@ad nvarchar(max) ='adı giriniz',
@soyad nvarchar(max) ='soyadı giriniz',
@sehir nvarchar(max) ='şehir giriniz'
as
insert personeller(adi,soyadi,sehir) values(@ad,@soyad,@sehir)
exec sp_personelekle2 'gökhan', 'aşker','hatay' --varsayılan değerler devreye girdi
exec sp_personelekle2 --normalde olmaz lakin varsayılan değerler devrede
exec sp_personelekle2 'İbrahim' --burada ise adi parametresini ibrahim olarak ekleyecektir.
select*from personeller

--example
create proc sp_personelekle3
@ad nvarchar(50) ='adı giriniz',
@soyad nvarchar(50) ='soyadı giriniz',
@sehir nvarchar(50) ='şehir giriniz'
as
insert personeller(adi,soyadi,sehir) values(@ad,@soyad,@sehir)
exec sp_personelekle3 'gökhan', 'aşker','hatay' --varsayılan değerler devreye girdi
exec sp_personelekle3 --normalde olmaz lakin varsayılan değerler devrede
exec sp_personelekle3 'Murat' --burada ise adi parametresini ibrahim olarak ekleyecektir.
select*from personeller

--exec kullanımı:
exec('select *from personeller')
exec('declare @sayac int=0 print @sayac') --doğru komut kullanımı

--yanlış kullanımı 
exec('declare @sayac int=0')
exec('print @sayac')

--stored procedure içerisinde nesne oluşturma
create proc sp_tabloolustur
(
@tabloadi nvarchar(max),
@kolon1adi nvarchar(max),
@kolon1ozellikleri nvarchar(max),
@kolon2adi nvarchar(max),
@kolon2ozellikleri nvarchar(max)
)
as
exec('
create table'+ @tabloadi +'
(' 
+@kolon1adi+' '+@kolon1ozellikleri+',
'+@kolon2adi+' '+@kolon2ozellikleri+')
')

exec sp_tabloolustur 'OrnekTablo','Id','int primary key identity(1,1)','kolon2','nvarchar(MAX)'

--fonksiyonlar(functions)
--scalar ve inline olmak üzere iki fonksiyona ayrılır.
--scalar:geriye istenilen tipte değer döndüren fonksiyon.
--inline:geriye tablo döndüren fonksiyon.

create function toplam(@sayi1 int, @sayi2 int) returns int
as
begin
return @sayi1+@sayi2
end

--fonksiyon kullanılırken şemasıyla birlikte çağırılmalıdır.
select dbo.toplam(2.5)
print dbo.toplam(10,20)

--Örnek 1:
--"northwind" veritabanında; herhangi bir ürünün %18 kdv dahgil olmak üzere toplam maliyetini getiren fonksiyonu yazalım.
create function Maliyet(@BirimFiyati int, @StokMiktari int) returns nvarchar(max)
as
begin
declare @sonuc int = @BirimFiyati * @StokMiktari * 1.18
return @sonuc
end
select dbo.Maliyet(10,20)

--İnline functions:
create function fc_gonder(@ad nvarchar(20), @soyad nvarchar(20)) returns table
as
return 
select adi,soyadi from Personeller Where Adi=@ad and Soyadi=@soyad
select * from dbo.fc_gonder('nancy','davolio')

--encryption komutu: fonksiyonun kodlarına 2. 3. şahısların erişimini engellemek istiyorsak
--"with encryption" komutunu kullanmalıyız.

create function ornekfonksiyon()returns int
with encryption
as
begin 
return 3 
end

create function ornekfonksiyon2() returns table
with encryption
as
return select * from personeller
end

--computed column:otomatik hesaplanabilir kolonlar.
create function rapor(@kategori nvarchar(max) ,@urunadi nvarchar(max), @birimfiyati int, @stok int) returns nvarchar(max)
as
begin 
declare @cikti nvarchar(max)=@kategori +' kategorisindeki ' 
+ @urunadi + ' ürünün toplam fiyatı ' + CAST(@birimfiyati * 
@stok as nvarchar(max))+ ' dır.'
return @cikti
end

select dbo.Rapor(k.KategoriAdi, u.UrunAdi, u.BirimFiyati, u.HedefStokDuzeyi) from Urunler u
inner join Kategoriler k on u.KategoriID=k.KategoriID


--triggerlar(tetikleyiciler)
--dml:insert,update,delete
--ddl:create,alter,drop devreye giren yapılar.

--trigger tanımlama prototipi
--create trigger [trigger adı]
---on[işlem yapılacak tablo adı] 
--after veya for,delete,update,insert
--as
--[kodlar]

--Dikkat
--tanımlanan triggerlara ilgili tablonun içerisindeki triggers sekmesi altından erişebiliriz.


--Örnek 1:
--tedarikçiler tablosundan bir veri silindiğinde tüm ürünlerin fiyatı otomatik olarak 10 artsın
create trigger triggertedarikciler
on Tedarikciler
after delete
as
Update Urunler set BirimFiyati=BirimFiyati+10
select * from Urunler

delete from Tedarikciler where TedarikciID=31

--ÖRNEK 2:
--tedarikçiler tablosunda bir veri güncellendiğinde, kategoriler tablosunda "meyve kokteyli" adında bir kategori oluşsun.
create trigger trgtedarikguncelle
on Tedarikciler
for update
as
Insert kategoriler(kategoriadi) values('meyve kokteyli')

update Tedarikciler set MusteriAdi='Hilmi' where TedarikciID=29 

SELECT * FROM KATEGORİLER

--Örnek 3:
--Personeller tablosundan herhangi bir kayıt silindiğinde silinen kaydın adı,soyadı,kim tarafından
--ve hangi tarihte silindiği başka bir tabloya kayıt edilsin. Bir nevi log tablosu misali.

create table logtablosu(
id int primary key identity(1,1),
rapor nvarchar(max)
)

create trigger triggerPersoneller
on Personeller
after delete --girmek isteyeceğimiz komut silmedir.
as
declare @adi nvarchar(max),@soyadi nvarchar(max)
select @adi=adi ,@soyadi=soyadi from deleted
Insert logtablosu values('Adı ve Soyadı'+@adi+' '+@soyadi +' olan personel ' + SUSER_SNAME
() + ' tarafından ' +CAST(getdate()as nvarchar(max)) +' tarihinde silinmiştir.')

delete from personeller where PersonelID=17

--Örnek 4:
--Personeller tablosunda update gerçekleştiği anda devreye giren bir log tablosuna ..'Adı olan personel...yeni 
--adıyla değiştirilerek...kullanıcı tarafından...'tarihinde güncellendi' kalıbında rapor yazan trigger'ı yazalım.

create trigger trgpersonellerrapor
on Personeller
after update
as
declare @eskiadi nvarchar(max), @yeniadi nvarchar(max)
select @eskiadi from deleted
select @yeniadi from inserted
Insert logtablosu values('Adı'+ @eskiadi + ' olan personel ' +@yeniadi + ' yeni adıyla değiştirilerek '+ SUSER_SNAME
() + ' kullanıcısı tarafından ' +CAST(getdate()as nvarchar(max)) +' tarihinde güncellenmiştir')

update Personeller set adi='mert' where PersonelID=5

SELECT * FROM PERSONELLER

--Multiple Actions Trigger

create trigger multitrigger
on Personeller
after delete,insert
as
print 'merhaba'

insert personeller(adi,soyadi) values('murat','yıldırım')

delete from personeller where PersonelID=11

--Instead Of Trigger
--dml komutları yapmak yerine şu işlemleri yap demektedir.

--Örnek 5:

--Personeller tablosunda update gerçekleştiği anda yapılacak güncelleştirme yerine bir log tablosuna 
--"Adı... olan personel ...yeni adıyla değiştirilerek... kullanıcı tarafından ... tarihinde güncellenmek istendi." 
--kalıbında rapor yazan trigger yazalım

create trigger trgpersonellerraporInstead
on Personeller
Instead of update 
as
declare @eskiadi nvarchar(max), @yeniadi nvarchar(max)
select @eskiadi from deleted
select @yeniadi from inserted
Insert logtablosu values('Adı'+ @eskiadi + ' olan personel ' +@yeniadi + ' yeni adıyla değiştirilerek '+ SUSER_SNAME
() + ' kullanıcısı tarafından ' +CAST(getdate()as nvarchar(max)) +' tarihinde güncellenmek istendi ')

Update Personeller set Adi='Mertcan' where PersonelID=20

--Örnek 6:
--Personeller tablosundan adı 'Andrew' olan kaydın silinmesini engelleyen ama diğerlerine izin veren trigger'ı yazalım.

create trigger AndrewTrigger
on Personeller
after delete
as
declare @adi nvarchar(max),
select @adi = Adi from deleted
If @adi='Andrew'
Begin
print 'bu kaydı silemezsiniz'
rollback --yapılan tüm işlemleri geri alır. bu da transaction kısmında göreceğimiz kısım olacak.
end

delete from personeller where PersonelID=20

--DDL TRİGGERLAR
create trigger triggerddl
on Database
after drop_table, alter_table, create_function , create_procedure, drop_procedure
as
print 'bu işlem gerçekleştirilemez'
rollback

drop table bolgeler

--trigger'da tabloyu devre dışı ve etkin bırakmak.

--devre dışı:
disable trigger ornektrigger on personeller

--etkin:
enable trigger ornektrigger on personeller

--TRANSACTİON:
--birden çok işlemin bir arada yapıldığı durumlarda eğer parçayı oluşturan işlemlerden herhangi birinde sorun olursa
--tüm işlemi iptal ettirmeye yarar.

--begin tran:işlemi başlatır.
--commit tran: işlemi tamamlar.
--rollback tran:işlemi iptal eder.

--örnek olarak ise:
begin tran kontrol
insert Bolge values(5,'çorum')
commit tran

--isim vermek zorunda da değiliz.

begin tran
declare @i int
delete from Personeller where PersonelID >20
set @i = @@ROWCOUNT
if @i  =1
begin
print ' kayıt silindi '
commit
end
else begin
print ' işlemler geri alındı '
rollback
end


--sql server database yedeği alma ve yükleme
--backup:yedek alma
--restore:geri yükleme

--generate scripts:schema and data 

--en son primary key'i bulma son identity değerini döndürmektedir.
select IDENT_CURRENT('Personeller') as 'isim'
select IDENT_CURRENT('Personeller') + 1

--scope identity ve ident_current komutları
--triggerla kullanılan sorgularla hata çıkarabileceğinden dolayısıyla fazla tercih edilmez.
--ve bunu önlemek için ise scope_identity kullanacağız.

insert Personeller(adi,soyadi) values('muhiddin','kantaron')
select @@IDENTITY

select Personeller (adi,soyadi) values('don','carleone')
select SCOPE_IDENTITY() 

--örnek olarak ise:
create database ornekveritabani
use ornekveritabani

create table ornektablo1(
id int primary key identity,
kolon1 nvarchar(max),
kolon2 nvarchar(max)
)
create table ornektablo2(
id int primary key identity,
kolon1 nvarchar(max),
kolon2 nvarchar(max)
)

create trigger kontrol
on ornektablo1
for insert
as
insert ornektablo2 values('','')

insert ornektablo2 values('1','1')
insert ornektablo2 values('2','2')
insert ornektablo2 values('3','3')
insert ornektablo2 values('4','4')
insert ornektablo2 values('5','5')

insert ornektablo1 values('6','6')

select @@identity
union all
select scope_identity()
union all
select IDENT_CURRENT('ornektablo1')

--identity kolonuna veri eklemek:

create table ornektablo(
id int primary key identity,
kolon1 nvarchar(max),
kolon2 nvarchar(max)
)

insert ornektablo 
default values --otomatik boş değer(null) değerini atamaktadır.

--top keyword'ü ile update işlemi
--select *from veriler
--veriler tablosundaki değer kolonunu id'sini 5 artır.
--örnek: update veriler set deger = deger + 5 where id > 20
--update top(10) veriler set deger=deger -5 where id > 20

--top keyword ile delete işlemi
--id'si 20'den büyük olanları sil.
--delete from veriler where id> 20
--delete from top(5) from veriler

--row_number fonksiyonu:row_number() over ile birşülite kullanılmaktadır.
--prototipi:
--select row_number() over(order by kolonadi) indexer, * from tablo
select row_number() over(order by KategoriAdi) indexer, * from Kategoriler
select row_number() over(order by Adi) indexer, * from Personeller order by PersonelID
--indexer bu konuda bize kolaylık sağlamaktadır.

--gruplamada bu kez ise partition by özelliğini kullanacağız.

--prototipi ise bu şekildedir.
select row_number() over(partition by MusteriID order by OdemeTarihi) indexer, * from Satislar
--buradaki olay ise benzer olanların hepsini bir araya getirmek oldu.

--ansi_nulls komutu:
--where şartlarında kontrol edilen eşitlik yahut eşit değillik durumlarında null değerlerin dikkate alınıp alınmayacağını
--belirlememizi sağlayan bir özelliktir.

--on değeri verilirse 'null' değeri dikkate alınmaz.
--off değeri verilirse 'null' değeri dikkate alınır.

set ansi_nulls off
select * from Personeller where Bolge=null

--Dynamic Data Masking
--gösterilmesi gereken verilerin dışında maskeleme(saklar) yapar.
--default,email ve partial parametresinde çalışmaktadır.

 --default parametresi
 --metinsel:xxxx
 --sayısal:0000
 --tarihsel:01.01.2000 00.00.0000
 --binary: 0-> ASCII

 --email parametresi:
 --'mrtylmz99@hotmail.com' :'xxxx@gmail.com'

 --partial parametresi:
 --partial(3,h,2)

 use ornekveritabani

 create table ogrenciler(
 ogrenci_id int primary key identity,
 adi nvarchar(10) masked with (function='default()') null,
 soyadi nvarchar(10) masked with (function='default()') null,
 memleketi nvarchar(20) masked with(function='default()') null,
 tcno nvarchar(15) masked with (function='default()') null,
 sube nvarchar(10) masked with (function='default()') null,
 email nvarchar(max) masked with(function='email()') null,
 hakkinda nvarchar(max) masked with(function='partial(3,"h",2)') null,
 dogumtarihi datetime masked with (function='default()') null
 )

 insert ogrenciler values('mert','yılmaz','bursa','1234','a','mrtylmz99@hotmail.com','vatan sana canım feda',
 '1999-09-02')
  insert ogrenciler values('zülal','aydın','balıkesir','5678','b','zulal10@hotmail.com','canım balıkesir',
 '1999-02-08')

 select * from ogrenciler

 create user yetkiliuser without login --yetkiliuser isminde bir login oluşturuluyor.
 go
 grant select on ogrenciler to yetkiliuser --yetkiliuser isimli kullanıcıya ogrenciler tablosunda select yetkisi veriliyor.

 execute as user='yetkiliuser' --yetkiliuser ismi kullanıcıdayken
 select *from ogrenciler

 --bu sefer ise alter ile maskelenmiş kolon ekleyeceğiz.

alter table ogrenciler
add ekkolon nvarchar(max) masked with(function='partial(3,"xxx",0)')

execute as user='yetkiliuser'
select * from ogrenciler

--alter ile kolonun maske formatını güncelleme:
alter table ogrenciler
alter column ekkolon add masked with(function='partial(2,"aaa",4)')

execute as user='yetkiliuser'
select * from ogrenciler

--dynamic data masking özelliğini ortadan kaldırma:
alter table ogrenciler
alter column email drop masked --buradaki ogrenciler tablosundaki email kolonunun özelliğini açığa çektik

execute as user='yetkiliuser'
select * from ogrenciler

--burada ise tümüyle kaldıracağız
grant unmask to yetkiliuser

execute as user='yetkiliuser'
select * from ogrenciler

--temporal tables ile raporlama
--burada bir raporlama yapacağımız gereken sırada tabloda mutlaka primary key içermelidir.
--takibi sağlayıp ve kaydı tutacağımız tablomuzun içerisinde bir başlangıç(startdate) ve bir bitiş olan (enddate)
--gibi bir datetime değişkenini içinde tutmamız gerekecektir.
--linked server üzerinde temporal tables kullanılmamaktadır.
--history tablosunda constraint yapılarının hiçbirini kullanamayız.
--eğer bir tabloda temporal tables aktifse o tabloda truncate işlemi uygulanamaz.
--history tablosunda direkt dml işlemleri gerçekleştirilemez.
--temporal tables özelliğinin bulunduğu bir tabloda computed column(hesaplanmış kolon) tanımlanamaz.


--temporal tables oluşturma:

create database yeni_veri
create table ders_kayitlari
(
DersID int primary key identity(1,1),
ders nvarchar(max),
onay bit,
StartDate DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
EndDate DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
PERIOD FOR SYSTEM_TIME(StartDate,EndDate)
)
with (system_versioning = on (history_table = derskayitlarilog))
--eğer history_table özelliği ile history tablosuna isim vermezsek rastgele biçimde bir isim oluşturulur.

--eğer veri yoksa:
alter table ogrenciler
add
StartDate DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
EndDate DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
PERIOD FOR SYSTEM_TIME(StartDate,EndDate)

--eğer veri varsa
alter table derskayitlari
add
StartDate DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
Default CAST('1990-01-01-00:00.00.000000' AS DATETIME2),
EndDate DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
Default CAST('1990-01-01-00:00.00.000000' AS DATETIME2),
PERIOD FOR SYSTEM_TIME(StartDate,EndDate)

--parametrik olarak temporal tabloyu sorgulama
--as of(datetime)
select * from ders_kayitlari
for system_time as of '2016-09-26 06:22:53.543528'
where DersID=3
--TO OLAN KISIM ENDTIME KISMI
select * from ders_kayitlari
for system_time from '2016-09-26 06:22:53.543528' to '2016-09-26 07:49:53.48200110'
where DersID=3

--temporal tabloları listelemek
--ilk yöntem:
select name, OBJECT_ID, temporal_type_desc, history_table_id, object_name(history_table_id)
as
[History Tablo Adı]
from sys tables where object_name (history_table_id) is not null

--ikinci yöntem:
select name, OBJECT_ID, temporal_type_desc, history_table_id, object_name(history_table_id)
as
[History Tablo Adı]
from sys tables where temporal_type_desc ='SYSTEM_VERSIONED_TEMPORAL_TABLE'

--TEMPORAL TABLES KISMINI PASİFİZE ETME:
ALTER TABLE ders_kayitlari set(system_versioning=off) --pasifize hale getirmiş olur.
truncate table ders_kayitlari
drop table ders_kayitlari

--row level security:
--her yetkili kullanıcının sadece kendi yapısını sorgulayabileceği alandır.

create database yenilikler
use yenilikler

create table satislar(
satis_id int primary key identity,
urun nvarchar(max),
adet int,
kullanici nvarchar(max)
)

insert satislar values('aurun',2,'mert'),('burun',3,'hakan'),
('curun',4,'rüstem'),('durun',5,'turgut'),('eurun',6,'eda'),
('furun',7,'nurhan'),('gurun',8,'burcu')

--kullanıcıları oluştur
create user mert without login
create user turgut without login
create user eda without login

--bu kullanıcılara satislar tablosunda select yetikisi verilsin
grant select on Satislar to mert
grant select on Satislar to turgut
grant select on Satislar to eda

--row level security kullanabilmek için inline table value function oluşturmalıyız.
create function rowlevelsecurityfunction (@kullaniciadi as sysname)
returns table
with schemabinding
as
return select 1 rowlevelresult
where @kullaniciadi=USER_NAME()

--şimdi bu fonksiyonu birazdan oluşturacağımız security policy(güvenlik politikası)için
--filter predicate olarak ekliyoruz.yani filtre olarak ayarlıyoruz.

create security policy guvenlikfiltresi
add filter predicate dbo.rowlevelsecurityfunction.Kullanici
on dbo.satislar
with(state=on);

exec as user='mert'
select * from satislar



