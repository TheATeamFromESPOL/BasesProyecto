drop database if exists TireTec; -- Borra la base de datos si existe

create database if not exists TireTec; -- Crea la base si no existe

use TireTec; -- Selecciona la base a usar

drop table if exists producto,proveedor,cliente,inventario,ordenventa,ordencompra,detallecompra,detalleventa;

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

create table Proveedor (
	IdProveedor int not null Auto_increment,
    NombreProveedor varchar(50) unique not null,
    Telefono varchar(30),
    Email varchar(255),
    Direccion varchar(255),
    Pais varchar(50) Default 'Ecuador',
    Ciudad varchar(50),
    primary key(IdProveedor)
);

create table Cliente (
	Cedula varchar(10) not null,
    Ruc varchar(15),
    Pasaporte varchar(30),
    Nombres varchar(255) not null,
    Apellidos varchar(255) not null,
    Direccion varchar(255),
    Email varchar(255),
    TipoCliente varchar(10) not null,
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
    IdCliente varchar(255) not null,
    TotalVenta float(10,2) not null,
    Fecha Date,
    Hora time,
    primary key (IdOrdenVenta),
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

insert into producto(NombreProducto,PrecioPublico,PrecioMayorista,Descripcion) values
	('Leche en polvo',3.60,3.05,'Producto lácteo en polvo listo para mezclar con agua caliente y servir'),
    ('Comida para perro BuenCan',4.66,4.05,'Cachorros - Razas Grandes');

