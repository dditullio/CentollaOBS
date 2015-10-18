set @idmarea=9;
delete from capturas
where idcaptura < 10000000 and idlance in (select idlance
from lances where idmarea=@idmarea);
delete from muestras
where idmarea=@idmarea;
delete from envios_email
where idmarea=@idmarea;
delete from factores_conversion
where idmarea=@idmarea;
delete from marcas
where idmarea=@idmarea;
delete from produccion
where idmarea=@idmarea;
delete from productos
where idmarea=@idmarea;
delete from lances
where idmarea=@idmarea;
delete from carnadas
where idmarea=@idmarea;
delete from mareas
where idmarea=@idmarea;
delete from generador_ids;
