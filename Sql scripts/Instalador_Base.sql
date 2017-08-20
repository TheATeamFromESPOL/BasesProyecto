drop database if exists TireTec; -- Borra la base de datos si existe

create database if not exists TireTec; -- Crea la base si no existe

use TireTec; -- Selecciona la base a usar

-- drop table if exists producto,proveedor,cliente,inventario,ordenventa,ordencompra,detallecompra,detalleventa;

create table usuario (
	usuario varchar(20) not null,
    clave varchar(20) not null,
    primary key (usuario)
);

insert into usuario
values ('admin','1234');

create table Producto (
	IdProducto int not null Auto_increment,
    NombreProducto varchar(50) not null,
    PrecioPublico float(5,2) not null,
    PrecioMayorista float(5,2) not null,
    Descripcion varchar(255) Default 'No hay descripción',
    PRIMARY KEY(IdProducto),
    check (PrecioPublico > 0),
    check (PrecioMayorista > 0)
);

create table Pais(
	IdPais int not null auto_increment,
    NombrePais varchar(255) not null,
    primary key (IdPais)
);

insert into Pais(NombrePais) values ('Ecuador'),('Chile'),('Perú'),('Colombia'),('Brazil'),('Argentina');

create table Ciudad(
	IdCiudad int not null auto_increment,
    NombreCiudad varchar(255) not null,
    IdPais int not null,
    primary key(IdCiudad),
    foreign key(IdPais) references Pais(IdPais)
);

insert into Ciudad(NombreCiudad,IdPais) values ('Guayaquil',1),('Quito',1),('Santiago',2),('Temuco',2);

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
    Ruc varchar(15),
    Pasaporte varchar(30),
    Nombres varchar(255) not null,
    Apellidos varchar(255) not null,
    Direccion varchar(255),
    Email varchar(255),
    TipoCliente varchar(10) not null default 'MINORISTA',
    primary key(Cedula),
    check (TipoCliente='MAYORISTA' or TipoCliente='MINORISTA')
);

create table Inventario (
	IdInventario int not null,
    IdProducto int not null,
    Stock int not null,
    Observaciones varchar(255),
    primary key(IdInventario),
    foreign key(IdProducto) references Producto(IdProducto)
);

create table OrdenVenta (
	IdOrdenVenta int not null,
    Usuario varchar(20) not null,
    IdCliente varchar(255) not null,
    TotalVenta float(10,2) not null,
    Fecha Date,
    Hora time,
    primary key (IdOrdenVenta),
    foreign key (Usuario) references usuario(usuario),
    foreign key (IdCliente) references Cliente(Cedula)
);

create table OrdenCompra (
	IdOrdenCompra int not null,
    IdProveedor int not null,
    TotalCompra float(10,2) not null,
    Fecha date,
    hora time,
    primary key (IdOrdenCompra),
    foreign key (IdProveedor) references Proveedor(IdProveedor)
);

create table DetalleCompra (
	IdDetalleCompra int not null,
    IdOrdenCompra int not null,
    IdProducto int not null,
    Precio float(5,2) not null,
    Cantidad int not null,
    primary key (IdDetalleCompra),
    foreign key (IdOrdenCompra) references OrdenCompra(IdOrdenCompra),
	foreign key (IdProducto) references Producto(IdProducto)
);

create table DetalleVenta (
	IdDetalleVenta int not null,
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
                                    in pais varchar(50), 
                                    in ciudad varchar(50))
begin
	insert into Proveedor(NombreProveedor,Telefono,Email,Direccion,Pais,Ciudad)
    values(nombre,telefono,email,direccion,pais,ciudad);
end$$
delimiter ;

delimiter $$
create procedure insertarCliente (in Cedula varchar(10),
								  in Ruc varchar(15),
                                  in Pasaporte varchar(30),
                                  in Nombres varchar(255),
                                  in Apellidos varchar(255),
                                  in Direccion varchar(255),
                                  in Email varchar(255),
                                  in TipoCliente varchar(10))
begin
	insert into Cliente(cedula,Ruc,Pasaporte,Nombres,Apellidos,Direccion,Email,TipoCliente)
    values(cedula,Ruc,Pasaporte,Nombres,Apellidos,Direccion,Email,TipoCliente);
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
    from clientes;
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
    where p.NomPais = nompais
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


insert into proveedor(NombreProveedor) values ('hue');
insert into proveedor(NombreProveedor) values ('JAJA');
insert into proveedor(NombreProveedor) values ('lol');