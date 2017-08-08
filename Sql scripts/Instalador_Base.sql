create database if not exists TireTec;

use TireTec;

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

-- drop database TireTec