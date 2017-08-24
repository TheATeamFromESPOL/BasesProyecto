drop database if exists TireTec; -- Borra la base de datos si existe

create database if not exists TireTec; -- Crea la base si no existe

use TireTec; -- Selecciona la base a usar

-- drop table if exists producto,proveedor,cliente,inventario,ordenventa,ordencompra,detallecompra,detalleventa;

create table usuario (
	usuario varchar(20) not null,
    clave varchar(20) not null,
    primary key (usuario)
);

create table Producto (
	IdProducto int not null Auto_increment,
    NombreProducto varchar(50) unique not null,
    PrecioPublico float(5,2) not null,
    PrecioMayorista float(5,2) not null,
    Descripcion varchar(255) Default 'No hay descripción',
    PRIMARY KEY(IdProducto),
    check (PrecioPublico > 0),
    check (PrecioMayorista > 0)
);

create table Pais(
	IdPais int not null auto_increment,
    NombrePais varchar(255) unique not null,
    primary key (IdPais)
);

create table Ciudad(
	IdCiudad int not null auto_increment,
    NombreCiudad varchar(255) not null,
    IdPais int not null,
    primary key(IdCiudad),
    foreign key(IdPais) references Pais(IdPais)
);

create table Proveedor (
	IdProveedor int not null Auto_increment,
    NombreProveedor varchar(50) unique not null,
    Telefono varchar(30),
    Email varchar(255),
    Direccion varchar(255),
    Pais int,
    Ciudad int,
    primary key(IdProveedor),
    foreign key(Pais) references Pais(IdPais),
    foreign key(Ciudad) references Ciudad(IdCiudad)
);

create table Producto_Proveedor(
	Id int not null auto_increment,
    IdProducto int not null,
    IdProveedor int not null,
    primary key (Id),
    foreign key(IdProducto) references Producto(IdProducto),
    foreign key(IdProveedor) references Proveedor(IdProveedor)
);

create table Cliente (
	Cedula varchar(10) not null,
    Nombres varchar(255) not null,
    Apellidos varchar(255) not null,
    Direccion varchar(255),
    Email varchar(255),
    TipoCliente varchar(10) not null default 'MINORISTA',
    primary key(Cedula),
    check (TipoCliente='MAYORISTA' or TipoCliente='MINORISTA')
);

create table Inventario (
	IdInventario int not null auto_increment,
    IdProducto int not null unique,
    Stock int not null,
    primary key(IdInventario),
    foreign key(IdProducto) references Producto(IdProducto)
);

create table OrdenVenta (
	IdOrdenVenta int not null auto_increment,
    IdCliente varchar(255) not null,
    TotalVenta float(10,2) not null,
    Fecha Date,
    Hora time,
    primary key (IdOrdenVenta),
    foreign key (IdCliente) references Cliente(Cedula)
);

create table OrdenCompra (
	IdOrdenCompra int not null auto_increment,
    IdProveedor int not null,
    TotalCompra float(10,2) not null,
    Fecha date,
    hora time,
    primary key (IdOrdenCompra),
    foreign key (IdProveedor) references Proveedor(IdProveedor)
);

create table DetalleCompra (
	IdDetalleCompra int not null auto_increment,
    IdOrdenCompra int not null,
    IdProducto int not null,
    Precio float(5,2) not null,
    Cantidad int not null,
    primary key (IdDetalleCompra),
    foreign key (IdOrdenCompra) references OrdenCompra(IdOrdenCompra),
	foreign key (IdProducto) references Producto(IdProducto)
);

create table DetalleVenta (
	IdDetalleVenta int not null auto_increment,
    IdOrdenVenta int not null,
    IdProducto int not null,
    Precio float(5,2) not null,
    Cantidad int not null,
    primary key (IdDetalleVenta),
    foreign key (IdOrdenVenta) references OrdenVenta(IdOrdenVenta),
	foreign key (IdProducto) references Producto(IdProducto)
);

delimiter $$
create procedure insertarProducto (in nombre varchar(255),
								   in precioP float(5,2),
								   in precioM float(5,2), 
                                   in descri varchar(255))
begin
	insert into Producto(nombreproducto,preciopublico,preciomayorista,descripcion)
    values(nombre,precioP,precioM,descri);
end$$
delimiter ;

delimiter $$
create procedure insertarProveedor (in nombre varchar(255),
									in telefono varchar(30),
                                    in email varchar(255),
                                    in direccion varchar(255), 
                                    in pais int, 
                                    in ciudad int)
begin
	insert into Proveedor(NombreProveedor,Telefono,Email,Direccion,Pais,Ciudad)
    values(nombre,telefono,email,direccion,pais,ciudad);
end$$
delimiter ;

delimiter $$
create procedure insertarCliente (in Cedula varchar(10),
                                  in Nombres varchar(255),
                                  in Apellidos varchar(255),
                                  in Direccion varchar(255),
                                  in Email varchar(255),
                                  in TipoCliente varchar(10))
begin
	insert into Cliente(cedula,Nombres,Apellidos,Direccion,Email,TipoCliente)
    values(cedula,Nombres,Apellidos,Direccion,Email,TipoCliente);
end$$
delimiter ;

delimiter $$
create procedure visualizarProductos()
begin
	select *
    from producto;
end$$
delimiter ;

delimiter $$
create procedure visualizarClientes()
begin
	select *
    from cliente;
end$$
delimiter ;

delimiter $$
create procedure visualizarProveedores()
begin
	select *
    from proveedor;
end$$
delimiter ;

delimiter $$
create procedure ListarProductosDisponibles()
begin
	select p.NombreProducto, sum(i.Stock)
    from producto p join inventario i on p.IdProducto=i.IdProducto
    group by p.IdProducto
    order by p.NombreProducto;
end$$
delimiter ;

delimiter $$
create procedure ListarProveedores()
begin
	select NombreProveedor
    from Proveedor
    order by NombreProveedor;
end$$
delimiter ;

delimiter $$
create procedure ListarProveedoresFiltro(in cadena varchar(255))
begin
	select NombreProveedor
    from Proveedor
    where NombreProveedor like concat('%',cadena,'%')
    order by NombreProveedor;
end$$
delimiter ;

delimiter $$
create procedure ListarProducto(in nombrePro varchar(255))
begin
	select *
    from producto
    where NombreProducto = nombrePro and IdProducto!=1;
end$$
delimiter ;

delimiter $$
create procedure ListarProductoConCadena(in cadena varchar(255))
begin
	select NombreProducto
    from producto
    where NombreProducto like concat('%',cadena,'%') and IdProducto!=1;
end$$
delimiter ;

delimiter $$
create procedure ProductosConCadena(in cadena varchar(255))
begin
	select *
    from producto
    where NombreProducto like concat('%',cadena,'%') ;
end$$
delimiter ;

delimiter $$
create procedure ProveedorConCadena(in cadena varchar(255))
begin
	select *
    from proveedor
    where NombreProveedor like concat('%',cadena,'%') ;
end$$
delimiter ;

delimiter $$
create procedure ClienteConCadena(in cadena varchar(255))
begin
	select *
    from cliente
    where Cedula like concat('%',cadena,'%') ;
end$$
delimiter ;

delimiter $$
create procedure CargarPaises()
begin
	select NombrePais
    from Pais
    order by NombrePais;
end$$
delimiter ;

delimiter $$
create procedure CargarCiudadesPorPais(in nompais varchar(255))
begin
	select c.NombreCiudad
    from Ciudad c join Pais p on c.IdPais=p.IdPais
    where p.NombrePais = nompais
    order by c.NombreCiudad;
end$$
delimiter ;

delimiter $$
create function acceder(usuario varchar(20), contra varchar(20)) returns varchar(20) deterministic
begin
	declare encontrado varchar(20) default "";
	
	select u.usuario into encontrado
    from usuario u
    where u.usuario = usuario and u.clave=contra;
    
    return encontrado;
end$$
delimiter ;

delimiter $$
create function obtenerIdPais(nomPais varchar(255)) returns int deterministic
begin
	declare encontrado int;
	
	select IdPais into encontrado
    from Pais
    where NombrePais = nomPais;
    
    return encontrado;
end$$
delimiter ;

delimiter $$
create function obtenerIdCiudad(nomCiudad varchar(255),nomPais varchar(255)) returns int deterministic
begin
	declare encontrado int;
	
	select c.IdCiudad into encontrado
    from Ciudad c Join Pais p On c.IdPais = p.IdPais
    where p.NombrePais = nomPais and c.NombreCiudad = nomCiudad;
    
    return encontrado;
end$$
delimiter ;

delimiter $$
create function obtenerIdProducto(nomProd varchar(255)) returns int deterministic
begin
	declare encontrado int;
	
	select IdProducto into encontrado
    from producto
    where NombreProducto = nomProd;
    
    return encontrado;
end$$
delimiter ;

delimiter $$
create procedure obtenerNombreProducto(in id int)
begin
	select NombreProducto
    from producto
    where IdProducto = id;
end$$
delimiter ;

delimiter $$
create function obtenerIdProveedor(nomProv varchar(255)) returns int deterministic
begin
	declare encontrado int;
	
	select IdProveedor into encontrado
    from proveedor
    where NombreProveedor = nomProv;
    
    return encontrado;
end$$
delimiter ;

delimiter $$
create procedure eliminarProducto (in nombreProd varchar(255))
begin
	delete from producto where NombreProducto = nombreProd ;
end$$
delimiter ;

delimiter $$
create procedure insertarProd_Prov (in idProd int, 
                                    in idProv int)
begin
	insert into producto_proveedor(IdProducto,IdProveedor)
    values(idProd,idProv);
end$$
delimiter ;

delimiter $$
create procedure buscarProductoPorId(in idprod int)
begin
	select NombreProducto,PrecioPublico,PrecioMayorista,Descripcion
    from producto
    where IdProducto = idprod;
end$$
delimiter ;

delimiter $$
create procedure buscarProductoPorNombre(in nomprod varchar(255))
begin
	select NombreProducto,PrecioPublico,PrecioMayorista,Descripcion
    from producto
    where NombreProducto = nomprod;
end$$
delimiter ;

delimiter $$
create procedure modificarProductoPorId(in idprod int,in nomprod varchar(50),in prepub float(5,2), in premay float(5,2),in descr varchar(255))
begin
	update Producto
    set NombreProducto = nomprod,PrecioPublico = prepub, PrecioMayorista = premay, Descripcion = descr
    where IdProducto = idprod;
end$$
delimiter ;

delimiter $$
create procedure modificarProductoPorNombre(in nomviejo varchar(50),in nomprod varchar(50),in prepub float(5,2), in premay float(5,2),in descr varchar(255))
begin
	update Producto
    set NombreProducto = nomprod,PrecioPublico = prepub, PrecioMayorista = premay, Descripcion = descr
    where NombreProducto = nomviejo;
end$$
delimiter ;

delimiter $$
create procedure eliminarProductoPorId(in idProd int)
begin
	delete from producto where IdProducto = idProd;
end$$
delimiter ;

delimiter $$
create procedure insertarOrdenCompra(in id int,in total float)
begin
	insert into ordencompra(IdProveedor,TotalCompra,Fecha,hora)
    values (id,total,curdate(),curtime());
end$$
delimiter;

delimiter $$
create procedure insertarOrdenVenta(in id varchar(10),in total float)
begin
	insert into OrdenVenta(IdCliente,TotalVenta,Fecha,hora)
    values (id,total,curdate(),curtime());
end$$
delimiter;

delimiter $$
create procedure obtenerIdUltimaCompra()
begin
	select IdOrdenCompra
    from OrdenCompra
    order by IdOrdenCompra desc
    limit 1;
end$$
delimiter ;

delimiter $$
create procedure obtenerIdUltimaVenta()
begin
	select IdOrdenVenta
    from OrdenVenta
    order by IdOrdenVenta desc
    limit 1;
end$$
delimiter ;

delimiter $$
create procedure insertarDetalleCompra(in idcompra int,in idProd int,in precio float(5,2),in cant int)
begin
	insert into detallecompra(IdOrdenCompra,IdProducto,Precio,Cantidad)
    values (idcompra,idProd,precio,cant);
end$$
delimiter;

delimiter $$
create procedure insertarDetalleVenta(in idventa int,in idProd int,in precio float(5,2),in cant int)
begin
	insert into detalleventa(IdOrdenVenta,IdProducto,Precio,Cantidad)
    values (idventa,idProd,precio,cant);
end$$
delimiter;

delimiter $$
create procedure nombrePaisCiudad(in city int, in country int)
begin
	select pa.NombrePais, c.NombreCiudad
    from ciudad c join pais pa on c.IdPais=pa.IdPais
    where c.IdCiudad = city and pa.IdPais=country;
end$$
delimiter ;

delimiter $$
create procedure eliminarProveedorPorNombre (in nombreProv varchar(255))
begin
	delete from proveedor where NombreProveedor = nombreProv ;
end$$
delimiter ;

delimiter $$
create procedure eliminarProveedorPorId(in idProv int)
begin
	delete from proveedor where IdProveedor = idProv;
end$$
delimiter ;

delimiter $$
create procedure buscarProveedorPorId(in idprov int)
begin
	select NombreProveedor,Telefono,Email,Direccion,Pais,Ciudad
    from proveedor
    where IdProveedor = idprov;
end$$
delimiter ;

delimiter $$
create procedure modificarCliente(in ced int,in nomcli varchar(50),in apcli varchar(50), in dir varchar(255),in emai varchar(255),in tipo varchar(255))
begin
	update cliente
    set Nombres = nomcli,Apellidos = apcli, Direccion = dir, Email = emai, TipoCliente=tipo
    where Cedula = ced;
end$$
delimiter ;

delimiter $$
create procedure buscarCliente(in cedClien varchar(255))
begin
	select Nombres,Apellidos,Direccion,Email,TipoCliente
    from cliente
    where Cedula = cedClien;
end$$
delimiter ;

delimiter $$
create procedure eliminarCliente (in cedCli varchar(255))
begin
	delete from cliente where Cedula = cedCli ;
end$$
delimiter ;

delimiter $$
create procedure buscarProveedorPorNombre(in nomprov varchar(255))
begin
	select NombreProveedor,Telefono,Email,Direccion,Pais,Ciudad
    from proveedor
    where NombreProveedor = nomprov;
end$$
delimiter ;

delimiter $$
create procedure modificarProveedorPorId(in idprov int,in nomprov varchar(50),in telef varchar(50), in emai varchar(50),in dir varchar(255),in pai int, in ciu int)
begin
	update proveedor
    set NombreProveedor = nomprov,Telefono = telef, Email = emai, Direccion = dir, Pais = pai, Ciudad =ciu 
    where IdProveedor = idprov;
end$$
delimiter ;

delimiter $$
create procedure modificarProveedorPorNombre(in nomviejo varchar(50),in nomprov varchar(50),in telef varchar(50), in emai varchar(50),in dir varchar(255),in pai int, in ciu int)
begin
	update proveedor
    set NombreProveedor = nomprov,Telefono = telef, Email = emai, Direccion = dir, Pais = pai, Ciudad =ciu 
    where NombreProveedor = nomviejo;
end$$
delimiter ;

delimiter $$
create procedure stockProducto(in idprod int)
begin
	select i.stock
    from producto p Join inventario i on p.IdProducto=i.IdInventario
    where p.IdProducto = idprod;
end$$
delimiter ;

delimiter $$
create procedure obtenerProveedoresDeProductoPorId(in idprod int)
begin
	select f.NombreProveedor
    from producto p Join (
		select pp.IdProducto,pv.NombreProveedor
        from proveedor pv join producto_proveedor pp on pv.IdProveedor = pp.IdProveedor
        where pp.IdProducto = idprod
	) f on f.IdProducto = p.IdProducto;
end$$
delimiter ;

delimiter $$
create procedure obtenerProveedoresDeProductoPorNombre(in nomProd varchar(255))
begin
	select f.NombreProveedor
    from producto p Join (
		select pp.IdProducto,pv.NombreProveedor
        from proveedor pv join producto_proveedor pp on pv.IdProveedor = pp.IdProveedor
	) f on f.IdProducto = p.IdProducto
    where p.NombreProducto = nomprod;
end$$
delimiter ;

delimiter $$
create procedure obtenerIdProductoProveedor(in idprod int,in idProv int)
begin
	select id
    from producto_proveedor
    where IdProducto=idprod and IdProveedor=idprov;
end$$
delimiter ;

delimiter $$
create procedure cargarOrdenesCompra()
begin
	select Fecha,hora,TotalCompra
    from OrdenCompra;
end$$
delimiter ;

delimiter $$
create procedure cargarOrdenesVenta()
begin
	select Fecha,Hora,TotalVenta
    from OrdenVenta;
end$$
delimiter ;

delimiter $$
create procedure actualizarStock(in idprod int,in cant int)
begin
	update inventario
    set stock = cant
    where IdProducto = idprod;
end$$
delimiter ;

delimiter $$
create procedure productosSinStock()
begin
	select a.NombreProducto,a.Descripcion,b.NombreProveedor,b.Direccion,b.Telefono
    from (
		select p.IdProducto, p.NombreProducto,p.Descripcion
		from inventario i Join Producto p on i.IdProducto=p.IdProducto
		where i.Stock=0 and i.idProducto!=1) a 
		join(
			select pv.IdProducto,prov.NombreProveedor,prov.Direccion,prov.Telefono
            from producto_proveedor pv Join proveedor prov on pv.IdProveedor=prov.IdProveedor) b
		on a.IdProducto = b.IdProducto;
end$$
delimiter ;

delimiter $$
create procedure top10ProductosMasVendidos()
begin
	select p.NombreProducto,sum(dv.cantidad)
    from Producto p Join detalleventa dv on p.IdProducto = dv.IdProducto
    group by p.NombreProducto
    limit 10;
end$$
delimiter ;

delimiter $$
create procedure top10clientes()
begin
	select c.Nombres,c.Apellidos,c.email,sum(ov.TotalVenta)
    from Cliente c Join OrdenVenta ov on c.Cedula = ov.IdCliente
    group by c.Nombres,c.Apellidos,c.email;
end$$
delimiter ;

delimiter $$
create procedure top10clientesMasFrecuentes()
begin
	select c.Nombres,c.Apellidos,c.email,count(ov.IdOrdenVenta)
    from Cliente c Join OrdenVenta ov on c.Cedula = ov.IdCliente
    group by c.Nombres,c.Apellidos,c.email;
end$$
delimiter ;

delimiter $$
create trigger eliminarDatosRelacionadoAProducto
before delete on producto
for each row
begin
	delete from producto_proveedor where producto_proveedor.IdProducto = OLD.IdProducto;
    delete from inventario where inventario.IdProducto = OLD.IdProducto;
    update detallecompra set IdProducto = 1 where IdProducto = OLD.IdProducto;
    update detalleventa set IdProducto = 1 where IdProducto = OLD.IdProducto;
end$$
delimiter ;

delimiter $$
create trigger eliminarDatosRelacionadoACliente
before delete on Cliente
for each row
begin
    update ordenventa set IdCliente=1 where IdCliente = OLD.cedula;
end$$
delimiter ;

delimiter $$
create trigger eliminarDatosRelacionadoAProveedor
before delete on Proveedor
for each row
begin
	delete from producto_proveedor where producto_proveedor.IdProveedor = OLD.IdProveedor;
    update ordencompra set IdProveedor=1 where IdProveedor = OLD.IdProveedor;
end$$
delimiter ;

delimiter $$
create trigger eliminarDatosRelacionadoACompra
before delete on ordencompra
for each row
begin
	delete from detallecompra where detallecompra.IdOrdenCompra = OLD.IdOrdenCompra;
end$$
delimiter ;

delimiter $$
create trigger eliminarDatosRelacionadoAVenta
before delete on ordenventa
for each row
begin
	delete from detalleventa where detalleventa.IdOrdenVenta = OLD.IdOrdenVenta;
end$$
delimiter ;

delimiter $$
create trigger incrementarInventario
after insert on detallecompra
for each row
begin
	declare stockAntiguo int;
    
    select Stock into stockAntiguo
    from inventario
    where IdProducto = NEW.IdProducto;
    
	update inventario
    set stock = NEW.Cantidad+stockAntiguo
    where IdProducto = NEW.IdProducto;
end $$
delimiter ;

delimiter $$
create trigger generarInventario
after insert on producto
for each row
begin
	insert into Inventario(IdProducto,Stock) values (NEW.IdProducto,0);
end$$
delimiter ;

delimiter $$
create trigger decrementarInventario
after insert on detalleventa
for each row
begin
	declare stockAntiguo int;
    
    select Stock into stockAntiguo
    from inventario
    where IdProducto = NEW.IdProducto;
    
	update inventario
    set stock = stockAntiguo - NEW.Cantidad
    where IdProducto = NEW.IdProducto;
end$$
delimiter ;

insert into usuario
values ('admin','1234');

insert into Producto(NombreProducto,PrecioPublico,PrecioMayorista,Descripcion) values 
('Desconocido',0,0,'Desconocido'),
('Tubo para llanta',4.30,4.02,'Tubo inflable para llanta de auto.'),
('Parche para tubo',0.30,0.25,'Parche para tapar las fugas de aire de los tubos'),
('volante',0.60,0.75,'Para manejar :)');

insert into Pais(NombrePais) values 
('Desconocido'),
('Ecuador'),
('Chile');

insert into Ciudad(NombreCiudad,IdPais) values
('Desconocido',1), 
('Guayaquil',2),
('Quito',2),
('Santiago',3),
('Temuco',3);

insert into proveedor(NombreProveedor,Telefono,Email,Direccion,Pais,Ciudad) values 
('Desconocido','000 000 000','desconocido','desconocido',1,1),
('Ferrinsa S.A.', '555 333 444','Ferrinsa@outlook.com','Cuenca y la 567',1,1),
('Tu mami', '555 555 555','TuMAMITA@outlook.com','Cuenca y la 567',1,1);

insert into cliente values 
('0000000000','Desconocido','Desconocido', 'Desconocido', 'Desconocido', 'MINORISTA'),
('0930224308','Luis Ángel','Arízaga Díaz', 'El Recreo 4ta Etapa MZ.458 V.27', 'larizaga@espol.edu.ec', 'MINORISTA');

insert into producto_proveedor(IdProducto,IdProveedor) values 
(2,3),
(2,2),
(3,2),
(4,2),
(4,3);

update inventario set stock = 500 where idProducto=2;
update inventario set stock = 500 where idProducto=3;

select *
from inventario;
