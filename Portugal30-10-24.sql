SELECT * FROM portugal.cidades;

alter table cidades;
rename table codicopostal to Codico_Postal;
select * from portugal.Codico_Postal;
alter table Codico_postal rename column Area to Area_KM2;
select * from portugal.Codico_Postal;
select Area_KM2 from codico_postal avg;
select avg(Area_KM2) as MediaArea from codico_postal;

select Nome, Codigo_Postal, area_km2 from codico_postal where Area_KM2 >80;

select Codigo_Postal,Nome,area_km2,População,Distrito from codico_postal where Codigo_postal = 7830;