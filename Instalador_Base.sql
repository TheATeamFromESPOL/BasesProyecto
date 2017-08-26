drop database if exists TireTec; -- Borra la base de datos si existe

create database if not exists TireTec; -- Crea la base si no existe

use TireTec; -- Selecciona la base a usar

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

insert into usuario values ('admin','1234');
insert into Usuario (usuario, clave) values ('cbewsey0', 'w6fJSNq');
insert into Usuario (usuario, clave) values ('jdabinett1', '7b9COoHa');
insert into Usuario (usuario, clave) values ('vgamlyn2', '9Gpah5X');
insert into Usuario (usuario, clave) values ('hramel3', 'S62JxgJ');
insert into Usuario (usuario, clave) values ('nyurocjkin4', 'nHs9FC');
insert into Usuario (usuario, clave) values ('arechert5', 'fC7160W8OLP');
insert into Usuario (usuario, clave) values ('chabbema6', 'F2QnyZ6KOS');
insert into Usuario (usuario, clave) values ('fhugk7', '8bqWQS');
insert into Usuario (usuario, clave) values ('cfritchly8', '3BIhwMXf0');
insert into Usuario (usuario, clave) values ('ebichard9', 'vMA4WOvk0aH');
insert into Usuario (usuario, clave) values ('cbenardettea', '6hOvgqHVw');
insert into Usuario (usuario, clave) values ('cpoltoneb', 'oEZjde3');
insert into Usuario (usuario, clave) values ('htzarc', 'J0xLpX');
insert into Usuario (usuario, clave) values ('mechallied', '6ULxZWQ');
insert into Usuario (usuario, clave) values ('mcambelle', 'KSbHlxd2');
insert into Usuario (usuario, clave) values ('jpechf', 'jnVmdU');
insert into Usuario (usuario, clave) values ('idixceeg', 'OKjW0sYz');
insert into Usuario (usuario, clave) values ('mqualtroughh', 'CDNaDU');
insert into Usuario (usuario, clave) values ('dmessieri', 'lEVNpK1');

insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Desconocido', 76.73, 0, 'Desconocido');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Mat Penstemon', 76.73, '65.22', 'congue eget semper rutrum nulla nunc purus phasellus in felis');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Chinese-quince', 29.84, '25.36', 'congue risus semper porta volutpat quam');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Daniellia', 71.81, '61.04', 'pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Minitongue', 56.61, '48.12', 'nisi nam ultrices libero non');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Minidoka Beardtongue', 89.36, '75.96', 'libero nullam sit amet turpis elementum ligula vehicula consequat morbi');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Beaked Agrimony', 16.56, '14.08', 'augue quam sollicitudin vitae consectetuer');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Buck-horn Cholla', 62.87, '53.44', 'non pretium quis lectus suspendisse potenti in eleifend');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Intermediate Woodfern', 37.76, '32.10', 'venenatis lacinia aenean sit amet justo morbi ut');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Heller''s Bird''s-foot Trefoil', 34.04, '28.93', 'luctus et ultrices posuere cubilia curae');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Nailwort', 16.06, '13.65', 'quam sapien varius ut blandit non interdum in ante vestibulum');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Florida Yellow Flax', 62.71, '53.30', 'vivamus tortor duis mattis egestas metus');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Desert-thorn', 33.6, '28.56', 'convallis morbi odio odio elementum eu');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Vetch', 60.65, '51.55', 'pede venenatis non sodales sed tincidunt eu felis');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Strawberry Raspberry', 25.47, '21.65', 'pede morbi porttitor lorem id ligula');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Tiplant', 69.99, '59.49', 'enim sit amet nunc viverra dapibus nulla suscipit ligula');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Maronea Lichen', 37.07, '31.51', 'nisl ut volutpat sapien arcu sed augue aliquam erat volutpat');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Hybrid Oak', 44.67, '37.97', 'et commodo vulputate justo in blandit ultrices enim lorem');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Distinct Hawthorn', 83.0, '70.55', 'ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Hybrid Violet', 13.34, '11.34', 'molestie lorem quisque ut erat curabitur gravida');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Wart Lichen', 25.0, '21.25', 'ridiculus mus vivamus vestibulum sagittis sapien cum');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Piedmont Staggerbush', 26.58, '22.59', 'erat vestibulum sed magna at');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Hoary Tansyaster', 68.19, '57.96', 'convallis nulla neque libero convallis eget eleifend luctus');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Phascum Moss', 80.35, '68.30', 'vestibulum proin eu mi nulla ac');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Common Snowberry', 68.18, '57.95', 'id turpis integer aliquet massa id lobortis convallis tortor');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Laurel Magnolia', 63.31, '53.81', 'amet consectetuer adipiscing elit proin interdum mauris non');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Cutleaf Blazingstar', 67.74, '57.58', 'primis in faucibus orci luctus et ultrices posuere');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Brachymenium Moss', 23.03, '19.58', 'lorem integer tincidunt ante vel ipsum praesent blandit');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Hairawn Muhly', 5.51, '4.68', 'vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Jamaican Nightshade', 32.15, '27.33', 'quis lectus suspendisse potenti in');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Tufted Alpine Saxifrage', 10.42, '8.86', 'ultrices posuere cubilia curae donec pharetra magna vestibulum');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Mcconnell''s Poppy', 4.06, '3.45', 'pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Utah Columbine', 60.39, '51.33', 'condimentum curabitur in libero ut massa volutpat');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Canada Yew', 50.29, '42.75', 'at nunc commodo placerat praesent blandit nam nulla integer');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Fabronia Moss', 90.54, '76.96', 'nulla suscipit ligula in lacus curabitur at ipsum ac');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Branched Indian Clover', 34.6, '29.41', 'sit amet consectetuer adipiscing elit proin risus praesent');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Lindheimer''s Milkvetch', 1.05, '0.89', 'ligula in lacus curabitur at ipsum ac tellus semper interdum');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Puerto Rico St. Johnswort', 78.27, '66.53', 'mi integer ac neque duis bibendum morbi');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Small Limestone Moss', 7.87, '6.69', 'diam vitae quam suspendisse potenti nullam porttitor lacus at turpis');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Papillose Sphagnum', 56.86, '48.33', 'orci pede venenatis non sodales');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Arkansas River Feverfew', 82.34, '69.99', 'dui proin leo odio porttitor id');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Awnless Beardgrass', 26.15, '22.23', 'luctus nec molestie sed justo');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Oracle Oak', 52.63, '44.74', 'condimentum curabitur in libero ut massa volutpat convallis morbi');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Hairy False Goldenaster', 53.36, '45.36', 'nullam molestie nibh in lectus');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Notchleaf Clover', 49.42, '42.01', 'ultrices erat tortor sollicitudin mi');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Chestnut Rose', 87.23, '74.15', 'ut volutpat sapien arcu sed augue');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Idaho Sedge', 5.05, '4.29', 'mus etiam vel augue vestibulum rutrum');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Lichenothelia Lichen', 4.19, '3.56', 'lacus morbi sem mauris laoreet ut rhoncus');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Coralbells', 50.54, '42.96', 'quis justo maecenas rhoncus aliquam lacus morbi quis');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Grassland Beggarticks', 35.76, '30.40', 'ultrices libero non mattis pulvinar nulla pede ullamcorper');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Manybranched Pepperweed', 20.94, '17.80', 'phasellus sit amet erat nulla tempus vivamus in');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('El Pulguero Flatsedge', 80.51, '68.43', 'duis mattis egestas metus aenean fermentum donec ut mauris eget');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Wilson''s Clusterpea', 1.63, '1.39', 'cursus vestibulum proin eu mi');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Pringle''s Speargrass', 23.9, '20.32', 'consequat dui nec nisi volutpat eleifend donec');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Willowleaf Aster', 84.67, '71.97', 'sem praesent id massa id');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Indian Cucumber', 85.13, '72.36', 'justo maecenas rhoncus aliquam lacus morbi');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Campo Clarkia', 92.74, '78.83', 'sit amet nunc viverra dapibus nulla suscipit ligula in');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Dotted Lichen', 96.15, '81.73', 'placerat ante nulla justo aliquam quis turpis eget elit sodales');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Lace Grass', 21.95, '18.66', 'platea dictumst aliquam augue quam sollicitudin vitae');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Purple Amaranth', 65.72, '55.86', 'quisque erat eros viverra eget');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Agardh Lupine', 39.66, '33.71', 'at ipsum ac tellus semper');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Bog Yelloweyed Grass', 37.99, '32.29', 'non lectus aliquam sit amet diam in magna bibendum');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Douglas'' Bladderpod', 69.78, '59.31', 'felis sed interdum venenatis turpis enim blandit mi in');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Yager''s Woollystar', 18.89, '16.06', 'ut odio cras mi pede malesuada in imperdiet et commodo');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Premna', 1.48, '1.26', 'consequat metus sapien ut nunc');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Blemished Lichen', 8.02, '6.82', 'in felis donec semper sapien a libero nam dui');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Puerto Rico Mountainbay', 49.35, '41.95', 'commodo vulputate justo in blandit ultrices enim lorem');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Tumamoca', 55.35, '47.05', 'luctus et ultrices posuere cubilia curae');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Pseudobryum Moss', 82.86, '70.43', 'erat id mauris vulputate elementum nullam varius nulla facilisi');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Widehead Groundsel', 80.14, '68.12', 'sollicitudin mi sit amet lobortis sapien sapien non mi integer');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Caribbean Tree Destroyer', 95.07, '80.81', 'integer ac leo pellentesque ultrices mattis odio');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Siberian Pea-tree', 20.69, '17.59', 'aliquam erat volutpat in congue etiam justo etiam');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Sensitive Partridge Pea', 60.33, '51.28', 'pellentesque volutpat dui maecenas tristique est et tempus semper est');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Bertero''s Mistletoe', 14.07, '11.96', 'eu est congue elementum in');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('False Toadflax', 52.87, '44.94', 'in faucibus orci luctus et ultrices posuere');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Gairdner''s Beardtongue', 41.77, '35.50', 'eget eleifend luctus ultricies eu nibh');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Chihuahuan Snoutbean', 76.17, '64.74', 'odio elementum eu interdum eu tincidunt in leo maecenas pulvinar');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Asiatic Witchweed', 59.18, '50.30', 'habitasse platea dictumst etiam faucibus cursus');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Largeflower Goldenweed', 93.61, '79.57', 'enim sit amet nunc viverra dapibus nulla');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Yellow Foxglove', 83.33, '70.83', 'amet turpis elementum ligula vehicula consequat');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Hybrid Walnut', 93.06, '79.10', 'potenti in eleifend quam a odio in hac habitasse');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Pyp Grass', 99.85, '84.87', 'volutpat erat quisque erat eros viverra eget congue');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Giant Bristlegrass', 70.72, '60.11', 'pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Spiderlily', 30.44, '25.87', 'magna vulputate luctus cum sociis natoque penatibus et magnis dis');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('King''s Compact Sandwort', 4.17, '3.54', 'nulla neque libero convallis eget eleifend');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Weigela', 84.18, '71.55', 'at dolor quis odio consequat varius integer ac leo pellentesque');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Chañar', 5.05, '4.29', 'suscipit ligula in lacus curabitur at');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Cypress-knee Helmet Orchid', 82.86, '70.43', 'amet eleifend pede libero quis orci nullam');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Sordid Pepperweed', 78.13, '66.41', 'velit donec diam neque vestibulum eget');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Steyermark''s Trimezia', 87.82, '74.65', 'risus auctor sed tristique in tempus sit');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Weaselsnout', 95.58, '81.24', 'pellentesque eget nunc donec quis orci eget orci vehicula');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Slender Bottle-washers', 69.1, '58.73', 'nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Little Deserttrumpet', 43.39, '36.88', 'pede justo lacinia eget tincidunt eget tempus');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Rattlebox', 59.23, '50.35', 'sed vestibulum sit amet cursus');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Gibbs'' Milkvetch', 22.22, '18.89', 'tortor quis turpis sed ante vivamus tortor duis');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Prairie Straw Sedge', 38.06, '32.35', 'velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Purple Deadnettle', 89.58, '76.14', 'cras in purus eu magna vulputate');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Benjamin Franklin Bush', 45.8, '38.93', 'pede libero quis orci nullam');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Gongolin', 68.64, '58.34', 'sit amet erat nulla tempus');
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Dwarf Crownbeard', 23.78, '20.21', 'luctus et ultrices posuere cubilia');

insert into Pais (NombrePais) values ('Ecuador');
insert into Pais (NombrePais) values ('Peru');
insert into Pais (NombrePais) values ('Colombia');
insert into Pais (NombrePais) values ('Chile');
insert into Pais (NombrePais) values ('Argentina');
insert into Pais (NombrePais) values ('Panama');

insert into Ciudad (NombreCiudad, IdPais) values ('Praia das Maçãs', 3);
insert into Ciudad (NombreCiudad, IdPais) values ('Pravdinsk', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Jiudian', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Simpang', 6);
insert into Ciudad (NombreCiudad, IdPais) values ('Västerås', 5);
insert into Ciudad (NombreCiudad, IdPais) values ('Tuofeng', 4);
insert into Ciudad (NombreCiudad, IdPais) values ('Pajić Polje', 4);
insert into Ciudad (NombreCiudad, IdPais) values ('Gunjur Kuta', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Dajing', 5);
insert into Ciudad (NombreCiudad, IdPais) values ('Deir Ḥannā', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Dikou', 3);
insert into Ciudad (NombreCiudad, IdPais) values ('Bolesławiec', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Mont-Royal', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Al Hilāliyya', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Dziergowice', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Tiouli', 4);
insert into Ciudad (NombreCiudad, IdPais) values ('Borzęta', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Jiefang', 6);
insert into Ciudad (NombreCiudad, IdPais) values ('Qādirpur Rān', 5);
insert into Ciudad (NombreCiudad, IdPais) values ('Dungloe', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Bojadła', 5);
insert into Ciudad (NombreCiudad, IdPais) values ('Fenglin', 5);
insert into Ciudad (NombreCiudad, IdPais) values ('Baffa', 6);
insert into Ciudad (NombreCiudad, IdPais) values ('Magbay', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Cầu Gồ', 4);
insert into Ciudad (NombreCiudad, IdPais) values ('Guohua', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Askim', 6);
insert into Ciudad (NombreCiudad, IdPais) values ('Sūrān', 6);
insert into Ciudad (NombreCiudad, IdPais) values ('Dajabón', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Liancheng', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Xigou', 3);
insert into Ciudad (NombreCiudad, IdPais) values ('Kirkton', 6);
insert into Ciudad (NombreCiudad, IdPais) values ('Nova Iguaçu', 6);
insert into Ciudad (NombreCiudad, IdPais) values ('Ciseuseupan', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Juliaca', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Podgornaya', 6);
insert into Ciudad (NombreCiudad, IdPais) values ('Komendantsky aerodrom', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Oro Verde', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Ibung', 3);
insert into Ciudad (NombreCiudad, IdPais) values ('Ängelholm', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Labrador', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Dawusu', 5);
insert into Ciudad (NombreCiudad, IdPais) values ('Tangjin', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Korsun’-Shevchenkivs’kyy', 6);
insert into Ciudad (NombreCiudad, IdPais) values ('Calaya', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Legionowo', 4);
insert into Ciudad (NombreCiudad, IdPais) values ('Moussoro', 4);
insert into Ciudad (NombreCiudad, IdPais) values ('San Jose', 4);
insert into Ciudad (NombreCiudad, IdPais) values ('Rainis', 3);
insert into Ciudad (NombreCiudad, IdPais) values ('Ashton', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Waru', 4);
insert into Ciudad (NombreCiudad, IdPais) values ('Rukungiri', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Verdun', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Diamantino', 3);
insert into Ciudad (NombreCiudad, IdPais) values ('Jurangjero', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Gaspra', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Stettler', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Xiaxindian', 4);
insert into Ciudad (NombreCiudad, IdPais) values ('Polevskoy', 3);
insert into Ciudad (NombreCiudad, IdPais) values ('Pocsi', 4);
insert into Ciudad (NombreCiudad, IdPais) values ('Jinzhou', 5);
insert into Ciudad (NombreCiudad, IdPais) values ('Strumica', 3);
insert into Ciudad (NombreCiudad, IdPais) values ('San Pedro', 6);
insert into Ciudad (NombreCiudad, IdPais) values ('Varniai', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Santo Niño', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Rozhdestveno', 5);
insert into Ciudad (NombreCiudad, IdPais) values ('Zaindainxoi', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Majalengka', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Oslo', 3);
insert into Ciudad (NombreCiudad, IdPais) values ('Kalino', 3);
insert into Ciudad (NombreCiudad, IdPais) values ('Nanding', 5);
insert into Ciudad (NombreCiudad, IdPais) values ('Talnakh', 6);
insert into Ciudad (NombreCiudad, IdPais) values ('Midland', 6);
insert into Ciudad (NombreCiudad, IdPais) values ('Xuri', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Kadugedong', 3);
insert into Ciudad (NombreCiudad, IdPais) values ('Changkeng', 6);
insert into Ciudad (NombreCiudad, IdPais) values ('Marignane', 4);
insert into Ciudad (NombreCiudad, IdPais) values ('Čačak', 3);
insert into Ciudad (NombreCiudad, IdPais) values ('Shancheng', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Lyozna', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Contraalmirante Cordero', 4);
insert into Ciudad (NombreCiudad, IdPais) values ('Kstovo', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Casais Baleal', 6);
insert into Ciudad (NombreCiudad, IdPais) values ('Anguil', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Matam', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Al Quwaysimah', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Nancheng', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Moriguchi', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Merdeka', 6);
insert into Ciudad (NombreCiudad, IdPais) values ('Oula Xiuma', 4);
insert into Ciudad (NombreCiudad, IdPais) values ('Fermont', 3);
insert into Ciudad (NombreCiudad, IdPais) values ('Spas-Klepiki', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Wojnicz', 1);
insert into Ciudad (NombreCiudad, IdPais) values ('Pátmos', 3);
insert into Ciudad (NombreCiudad, IdPais) values ('Sant Cugat Del Valles', 3);
insert into Ciudad (NombreCiudad, IdPais) values ('Shiyun', 5);
insert into Ciudad (NombreCiudad, IdPais) values ('San Diego', 2);
insert into Ciudad (NombreCiudad, IdPais) values ('Shatou', 3);
insert into Ciudad (NombreCiudad, IdPais) values ('Sulaco', 4);
insert into Ciudad (NombreCiudad, IdPais) values ('Jönköping', 1);

insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Desconocido', '0000000000000', 'Desconocido', 'Desconocido', 1, 1);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Collier Group', '1-(650)782-8457', 'cbuckbee0@wp.com', '64 Leroy Hill', 3, 21);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Boyer LLC', '380-(304)169-1482', 'alowndes1@e-recht24.de', '58 Bobwhite Point', 6, 95);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Halvorson Group', '86-(188)747-0037', 'mcankett2@hud.gov', '36136 East Parkway', 3, 51);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Prosacco, Harris and Bergstrom', '242-(658)396-1936', 'nmontes3@exblog.jp', '452 Heath Crossing', 2, 49);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Sanford, Ullrich and Gorczany', '242-(697)812-7053', 'imorten4@com.com', '3 Gina Circle', 1, 88);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Toy, Zieme and Walter', '351-(437)147-4919', 'gwelbeck5@washington.edu', '650 Kennedy Road', 6, 60);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Spencer, Conroy and Bergnaum', '62-(418)706-4599', 'jdwire6@nsw.gov.au', '665 Declaration Park', 5, 82);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Stiedemann Group', '380-(872)114-1704', 'qeverall7@w3.org', '6 Maple Wood Court', 5, 48);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Kihn-Bogisich', '86-(185)552-0666', 'jtuplin8@1688.com', '5271 Bashford Alley', 6, 56);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Hilpert, Kuhic and McGlynn', '57-(660)947-4123', 'nmedgwick9@indiegogo.com', '316 Amoth Drive', 2, 57);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Thompson, Hills and Nitzsche', '420-(996)121-9365', 'hmeekingsa@newsvine.com', '531 Meadow Ridge Terrace', 6, 93);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Klocko LLC', '1-(860)491-3750', 'tgeerb@theguardian.com', '322 Logan Parkway', 6, 20);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Stanton-Graham', '60-(118)224-1393', 'rcriellyc@phoca.cz', '775 Sutherland Circle', 1, 94);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Herman, Braun and Schmidt', '7-(481)877-9021', 'tschuchmacherd@php.net', '7 Alpine Circle', 6, 47);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Wilderman-Monahan', '1-(501)293-9755', 'sdunse@google.pl', '77230 Mosinee Pass', 3, 42);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Friesen, Mann and Sanford', '46-(525)542-2423', 'rtomalaf@alibaba.com', '406 Schurz Center', 3, 19);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Sipes, Heller and O''Keefe', '254-(791)445-2813', 'kravelg@gizmodo.com', '9 Hazelcrest Drive', 1, 42);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Cummerata and Sons', '63-(368)765-1951', 'vpiscoh@xrea.com', '6164 Warrior Junction', 4, 12);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Jacobi, Gutmann and Daniel', '55-(498)558-9707', 'hcoselyi@howstuffworks.com', '8444 Del Sol Point', 1, 5);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Cronin and Sons', '351-(153)463-4640', 'ldakej@nsw.gov.au', '2092 Continental Center', 6, 44);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Padberg-Feil', '86-(750)191-8545', 'dridwoodk@meetup.com', '66341 Arrowood Plaza', 5, 51);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Skiles Group', '62-(258)511-6734', 'jbarnhaml@simplemachines.org', '59 Dexter Street', 5, 77);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Pacocha and Sons', '63-(926)179-1986', 'tbanvillem@state.tx.us', '57557 Darwin Avenue', 2, 61);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Schuppe-Casper', '31-(930)993-3510', 'kpiscon@telegraph.co.uk', '1 Dennis Lane', 6, 99);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Auer Group', '48-(429)560-2288', 'kalasdairo@huffingtonpost.com', '011 Lukken Plaza', 3, 78);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Rutherford Group', '269-(220)483-6786', 'sstrikerp@patch.com', '3 Menomonie Center', 5, 19);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Sanford-D''Amore', '62-(908)461-6697', 'rgostickq@google.ru', '79878 Oriole Trail', 6, 14);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Kub Inc', '33-(552)950-1347', 'cburetr@cloudflare.com', '6 Roth Crossing', 5, 19);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Schaefer-Turner', '52-(768)588-9124', 'wfiddys@imageshack.us', '77 Lakewood Road', 2, 60);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Ruecker, Buckridge and Hane', '7-(544)449-0605', 'mmithont@mtv.com', '54 Coolidge Center', 2, 31);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Hermiston, Gulgowski and Nikolaus', '387-(632)791-8851', 'mmosbyu@rakuten.co.jp', '2 Dawn Road', 2, 42);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Tromp, O''Hara and Mohr', '351-(802)656-5825', 'ahallv@hp.com', '2 Pleasure Plaza', 1, 54);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Corwin-Kling', '94-(927)812-8793', 'ccicchitellow@sakura.ne.jp', '0 Muir Place', 2, 23);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Rogahn, Hickle and Bartell', '1-(123)765-1110', 'singmanx@etsy.com', '9 Dovetail Parkway', 6, 1);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Doyle-Wilderman', '7-(709)115-1033', 'ccunneyy@opera.com', '5505 Lotheville Junction', 2, 14);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Greenfelder-Barrows', '57-(972)914-1092', 'lalyokhinz@sourceforge.net', '995 Maywood Street', 2, 64);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Hoppe, Keebler and McDermott', '93-(860)552-8577', 'sdionisii10@edublogs.org', '65684 Stuart Plaza', 5, 48);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Vandervort-Olson', '62-(577)326-2574', 'hiuorio11@altervista.org', '38377 Fisk Terrace', 5, 92);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Doyle-Walker', '86-(375)136-4657', 'lsouthway12@xrea.com', '26550 Kennedy Way', 2, 18);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Conroy Inc', '33-(842)482-0588', 'lbackshell13@theatlantic.com', '7 Veith Terrace', 5, 92);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Luettgen Inc', '62-(886)498-4717', 'uedinboro14@wired.com', '497 Stuart Crossing', 6, 25);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Lemke, Daniel and Adams', '86-(126)774-2007', 'ntock15@cloudflare.com', '733 Sutteridge Parkway', 5, 98);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Howell, Shields and Stiedemann', '994-(426)765-5650', 'hdaily16@clickbank.net', '844 Iowa Place', 6, 23);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Denesik and Sons', '7-(946)487-8426', 'rclausner17@deviantart.com', '6440 Delladonna Trail', 2, 96);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Beier-Marvin', '55-(481)103-2525', 'chughlin18@pbs.org', '579 Bay Street', 5, 95);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Quigley Group', '86-(504)792-1137', 'fbaroc19@eepurl.com', '16671 Longview Street', 2, 97);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Weber Inc', '64-(300)817-8438', 'sbeardsell1a@state.gov', '2 Sutherland Way', 5, 51);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Strosin LLC', '1-(260)171-2833', 'jsherville1b@stumbleupon.com', '9 Eliot Place', 4, 86);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Sanford-Cole', '503-(396)358-9616', 'kperot1c@spotify.com', '51 Sachs Park', 2, 65);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Russel, Leannon and Legros', '57-(394)780-6534', 'mfearn1d@cyberchimps.com', '515 Londonderry Park', 5, 18);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Hilll-Eichmann', '46-(249)542-1622', 'asurgey1e@wired.com', '3 Anhalt Junction', 4, 30);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Conn-Beier', '63-(408)624-8401', 'cdoumerque1f@joomla.org', '2 Loomis Center', 1, 91);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Hammes, Lubowitz and Gislason', '509-(849)319-4240', 'mneem1g@nature.com', '446 Tony Trail', 3, 18);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Wolff Inc', '86-(203)397-1833', 'dgentery1h@amazonaws.com', '6252 Everett Street', 6, 22);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Ziemann Group', '66-(268)760-2514', 'bcharter1i@biglobe.ne.jp', '76312 Green Ridge Plaza', 6, 43);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Harvey, Armstrong and Thiel', '62-(387)674-8779', 'rkevlin1j@unc.edu', '2864 Waubesa Crossing', 1, 90);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Harris-Goldner', '93-(820)245-4252', 'gdinsey1k@stumbleupon.com', '47 Glacier Hill Park', 5, 41);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Wiza and Sons', '7-(547)581-4512', 'ococke1l@tuttocitta.it', '123 Blue Bill Park Alley', 3, 46);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Batz-Hodkiewicz', '57-(996)419-4447', 'roshee1m@creativecommons.org', '54 Milwaukee Plaza', 3, 95);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Schmidt, Gutkowski and Schoen', '1-(312)423-9599', 'rrousell1n@ning.com', '5486 Loomis Pass', 3, 1);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Leannon, Turcotte and Orn', '55-(348)164-9128', 'crable1o@squidoo.com', '32 Utah Drive', 1, 94);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Osinski and Sons', '62-(561)871-0406', 'ddumsday1p@myspace.com', '861 Pawling Lane', 6, 93);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Mante, Langworth and Gleichner', '63-(495)247-5135', 'sluno1q@youtu.be', '8 Rusk Point', 5, 32);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Romaguera LLC', '967-(782)112-4747', 'kpettet1r@t.co', '88300 Dorton Circle', 3, 49);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Blick, Rau and Kihn', '258-(814)932-9354', 'nmacane1s@yelp.com', '3860 Schmedeman Hill', 6, 48);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Thompson Inc', '351-(859)442-0956', 'kwynch1t@nhs.uk', '74347 Erie Crossing', 2, 84);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Stanton LLC', '48-(123)365-2810', 'opurveys1u@jugem.jp', '7773 Loftsgordon Center', 1, 48);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Lubowitz and Sons', '51-(158)666-8899', 'adenk1v@ed.gov', '52 Kipling Street', 3, 59);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Schultz-Pfeffer', '86-(581)295-5053', 'elatorre1w@ow.ly', '832 Butterfield Crossing', 6, 63);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Boyle Group', '7-(493)887-3320', 'mhandman1x@arstechnica.com', '7122 Eastwood Trail', 2, 4);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Balistreri, Nitzsche and Hayes', '62-(431)245-8841', 'ccrippell1y@auda.org.au', '2 Fuller Circle', 5, 27);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Sauer, Reilly and Rogahn', '7-(467)980-8515', 'traulstone1z@redcross.org', '4 Karstens Drive', 2, 44);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Wintheiser-Schmitt', '48-(433)827-6273', 'greynard20@army.mil', '294 Myrtle Drive', 2, 20);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Paucek-Mohr', '86-(556)946-0976', 'ijakubovicz21@jugem.jp', '1822 Butterfield Pass', 3, 69);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Kessler and Sons', '227-(877)598-6487', 'rfarnsworth22@deliciousdays.com', '11 Gale Junction', 3, 41);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Okuneva Group', '62-(468)526-6048', 'sjurczak23@lulu.com', '5782 Mockingbird Point', 6, 84);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Lueilwitz and Sons', '63-(456)716-2638', 'eashbe24@google.cn', '7 Dapin Alley', 5, 12);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('O''Keefe-Bins', '1-(314)474-7923', 'jmccunn25@google.cn', '0135 Roxbury Junction', 4, 74);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Romaguera, Jacobson and Schimmel', '1-(918)604-8964', 'celiesco26@123-reg.co.uk', '95609 Warbler Junction', 5, 63);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Kris-Miller', '86-(509)502-9819', 'bkerrane27@google.cn', '920 Monument Street', 4, 87);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Cassin, Daniel and Brown', '48-(966)128-0871', 'nstellman28@wsj.com', '83699 Truax Circle', 3, 74);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Kozey, Rogahn and Mann', '351-(647)148-1810', 'rpicott29@g.co', '333 Coleman Place', 5, 44);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Stehr and Sons', '86-(343)609-7235', 'lcrippell2a@comcast.net', '83 Golden Leaf Lane', 5, 64);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Harris Group', '54-(375)384-2126', 'wlegendre2b@theguardian.com', '9 Ruskin Alley', 3, 12);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Bernhard and Sons', '380-(946)273-1250', 'cstracey2c@zdnet.com', '0483 Morrow Terrace', 3, 74);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Klocko, Quigley and Turner', '62-(833)626-6115', 'afripp2d@xinhuanet.com', '895 Farmco Street', 5, 84);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Braun-Shields', '352-(286)878-4182', 'ucraigs2e@mail.ru', '23 Lindbergh Way', 4, 38);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Wisozk LLC', '54-(903)589-7738', 'fwhittington2f@nasa.gov', '27 Morningstar Way', 3, 82);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Wiegand-Kunde', '63-(768)546-0235', 'cfoxwell2g@yandex.ru', '49735 Main Junction', 4, 38);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Lockman, Beer and Davis', '62-(286)646-8749', 'kjoskowicz2h@twitpic.com', '23637 Orin Avenue', 4, 20);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Satterfield, Lind and Gleichner', '63-(236)744-7316', 'gavo2i@japanpost.jp', '57 Moose Avenue', 2, 58);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Bailey-O''Hara', '48-(907)563-6049', 'htomasian2j@studiopress.com', '27117 Washington Road', 1, 18);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Macejkovic, Ortiz and Friesen', '1-(188)150-9155', 'sbattin2k@symantec.com', '6 Marcy Plaza', 2, 48);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Littel Inc', '86-(103)821-4081', 'acreboe2l@ihg.com', '884 Shopko Point', 2, 68);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Fadel, Mills and Weissnat', '27-(183)520-1527', 'ldounbare2m@narod.ru', '22 Laurel Road', 6, 30);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Hudson LLC', '86-(357)706-7582', 'ebugdall2n@ihg.com', '3 Garrison Street', 1, 28);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Bartell LLC', '216-(392)702-1963', 'kcollett2o@ow.ly', '23225 Quincy Crossing', 1, 63);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Stamm Group', '63-(498)504-2395', 'bbattson2p@i2i.jp', '966 Canary Crossing', 5, 15);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Hayes, Abernathy and Dibbert', '962-(313)293-6624', 'esmithen2q@pcworld.com', '51904 Heath Point', 2, 93);
insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Ullrich, Kunze and Kreiger', '62-(987)281-2509', 'htart2r@deviantart.com', '45 Springs Drive', 2, 7);

insert into Producto_Proveedor (IdProducto, IdProveedor) values (97, 48);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (81, 41);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (21, 73);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (37, 22);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (50, 33);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (42, 32);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (46, 8);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (3, 3);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (35, 88);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (15, 43);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (78, 50);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (85, 47);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (94, 13);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (28, 1);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (92, 31);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (20, 64);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (89, 91);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (15, 5);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (27, 89);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (64, 11);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (75, 5);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (48, 58);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (44, 89);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (1, 30);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (35, 41);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (81, 85);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (31, 22);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (60, 30);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (79, 38);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (19, 24);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (72, 2);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (10, 87);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (13, 78);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (67, 70);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (76, 49);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (62, 33);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (33, 29);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (89, 52);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (6, 80);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (69, 100);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (65, 42);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (22, 80);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (63, 80);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (55, 33);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (41, 24);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (81, 75);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (80, 4);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (55, 68);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (78, 71);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (67, 55);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (24, 68);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (10, 75);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (58, 46);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (12, 74);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (28, 17);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (11, 63);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (94, 37);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (57, 14);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (93, 50);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (94, 100);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (99, 33);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (6, 80);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (89, 21);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (92, 42);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (7, 79);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (53, 58);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (52, 81);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (80, 26);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (64, 41);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (39, 78);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (31, 54);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (63, 56);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (71, 2);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (23, 81);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (38, 77);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (73, 52);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (93, 55);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (11, 65);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (28, 96);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (81, 21);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (82, 74);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (91, 38);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (13, 45);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (9, 35);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (41, 66);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (34, 96);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (79, 96);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (8, 22);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (71, 13);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (9, 32);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (62, 33);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (16, 52);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (25, 31);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (18, 93);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (6, 99);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (95, 75);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (84, 52);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (6, 86);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (90, 100);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (27, 50);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (31, 100);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (37, 15);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (25, 7);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (96, 54);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (2, 62);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (64, 95);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (98, 84);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (60, 16);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (17, 29);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (21, 45);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (8, 67);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (77, 79);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (57, 98);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (89, 73);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (22, 71);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (26, 44);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (31, 45);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (12, 3);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (22, 89);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (12, 89);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (76, 63);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (80, 45);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (7, 56);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (95, 32);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (10, 21);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (32, 62);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (62, 30);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (99, 14);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (57, 50);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (99, 25);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (41, 27);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (54, 48);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (18, 47);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (14, 44);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (76, 80);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (4, 86);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (63, 83);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (71, 33);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (43, 72);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (43, 54);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (7, 73);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (91, 41);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (22, 64);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (76, 38);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (45, 63);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (14, 59);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (86, 42);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (45, 65);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (90, 34);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (29, 28);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (2, 8);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (84, 3);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (95, 69);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (32, 4);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (58, 42);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (54, 23);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (7, 10);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (7, 24);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (45, 80);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (17, 33);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (73, 43);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (43, 100);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (33, 100);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (89, 66);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (71, 86);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (11, 64);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (55, 30);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (52, 33);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (80, 27);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (9, 74);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (55, 32);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (74, 96);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (58, 7);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (37, 71);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (60, 61);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (32, 68);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (65, 83);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (39, 59);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (17, 1);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (24, 87);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (76, 58);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (28, 77);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (75, 100);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (40, 58);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (50, 86);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (96, 65);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (21, 83);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (78, 30);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (91, 64);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (96, 24);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (24, 10);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (75, 1);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (3, 67);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (58, 25);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (22, 14);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (80, 19);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (66, 65);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (30, 92);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (28, 60);
insert into Producto_Proveedor (IdProducto, IdProveedor) values (91, 70);

insert into cliente values ('0000000000','Desconocido','Desconocido', 'Desconocido', 'Desconocido', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('3605716040', 'Aleece', 'Pollock', '2 Eagle Crest Hill', 'apollock0@china.com.cn', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('3857218867', 'Sabina', 'Delacour', '590 Bay Junction', 'sdelacour1@ted.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('9066770130', 'Cicily', 'Hackin', '7809 Blackbird Way', 'chackin2@elpais.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('2399253187', 'Llywellyn', 'Croucher', '2214 South Trail', 'lcroucher3@zimbio.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('0276749068', 'Mort', 'Cufflin', '85 Mendota Court', 'mcufflin4@google.cn', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('0107013040', 'Dulcia', 'Wilson', '335 Nevada Trail', 'dwilson5@ox.ac.uk', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('4416070789', 'Ekaterina', 'Schouthede', '712 Meadow Vale Alley', 'eschouthede6@dailymotion.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('1873695272', 'Cindy', 'Wipper', '42004 Bluejay Crossing', 'cwipper7@techcrunch.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('6497778083', 'Andrea', 'Dufoure', '85413 Sommers Parkway', 'adufoure8@example.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('8682248249', 'Devin', 'Dowson', '0110 Hermina Way', 'ddowson9@vkontakte.ru', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('5024113748', 'Lester', 'Hepher', '4 Hoepker Lane', 'lhephera@whitehouse.gov', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('1554523395', 'Anabal', 'Ridger', '59679 Golf Course Circle', 'aridgerb@mail.ru', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('5499713004', 'Suzann', 'Graham', '0914 Nevada Drive', 'sgrahamc@hexun.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('0526243247', 'Lindsy', 'Moquin', '99957 Arkansas Hill', 'lmoquind@slate.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('8714754519', 'Jasmine', 'Martello', '94486 Namekagon Drive', 'jmartelloe@mediafire.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('6352829767', 'Yulma', 'Ghidoni', '964 Clarendon Alley', 'yghidonif@reference.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('3190734738', 'Thibaut', 'Hast', '0034 Mayfield Center', 'thastg@blogger.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('3571545018', 'Millie', 'Toomey', '70837 Vera Drive', 'mtoomeyh@infoseek.co.jp', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('7082252583', 'Rufus', 'Pash', '5 Cody Street', 'rpashi@bloomberg.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('4812361799', 'Demetris', 'Ibarra', '76 Grover Plaza', 'dibarraj@redcross.org', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('6076555665', 'Fey', 'Frearson', '48 Jenna Park', 'ffrearsonk@census.gov', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('5044891492', 'Winni', 'Waren', '61379 Little Fleur Drive', 'wwarenl@storify.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('5474194646', 'Ashleigh', 'Labarre', '23012 International Crossing', 'alabarrem@vk.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('0797635299', 'Natala', 'Brookwell', '856 Kipling Plaza', 'nbrookwelln@salon.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('2797980924', 'Tymon', 'Edgeson', '314 Myrtle Center', 'tedgesono@bizjournals.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('5553942925', 'Charlena', 'Romeo', '97879 Reinke Pass', 'cromeop@de.vu', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('2693420617', 'Linzy', 'Batecok', '7684 Pearson Circle', 'lbatecokq@mail.ru', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('3609628117', 'Nikki', 'Krystek', '36385 Norway Maple Plaza', 'nkrystekr@ebay.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('8427241329', 'Biddie', 'Marcham', '0 Norway Maple Way', 'bmarchams@ebay.co.uk', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('2862376689', 'See', 'Burbury', '6451 Green Circle', 'sburburyt@pbs.org', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('2378687902', 'Luther', 'Elfe', '68 Basil Park', 'lelfeu@psu.edu', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('5631458614', 'Meggi', 'Duesberry', '5161 Melody Avenue', 'mduesberryv@webs.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('7315837502', 'Boy', 'Vogel', '24 Scoville Drive', 'bvogelw@infoseek.co.jp', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('0696962839', 'Rooney', 'Rubinsztein', '6566 Esch Park', 'rrubinszteinx@digg.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('5512574682', 'Armand', 'Mager', '19 Clyde Gallagher Avenue', 'amagery@purevolume.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('1788448597', 'Mick', 'Sayse', '8454 Lien Crossing', 'msaysez@cbslocal.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('5492324261', 'Gard', 'Chiechio', '7 Duke Avenue', 'gchiechio10@state.tx.us', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('6988661028', 'Field', 'Cockshott', '5745 Nevada Center', 'fcockshott11@bloglines.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('7466805460', 'Mame', 'Cargill', '8797 Gale Alley', 'mcargill12@biglobe.ne.jp', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('3859910099', 'Veda', 'Disbrow', '2944 Dorton Pass', 'vdisbrow13@elpais.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('4632831007', 'Adams', 'Woolaston', '249 Cordelia Junction', 'awoolaston14@i2i.jp', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('4601666916', 'Emmi', 'Ludovico', '8 Miller Alley', 'eludovico15@spotify.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('1887628116', 'Emmalynne', 'Brodbin', '4782 Saint Paul Center', 'ebrodbin16@zimbio.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('0986490097', 'Amie', 'Torr', '2282 Ramsey Trail', 'atorr17@plala.or.jp', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('0562377715', 'Milty', 'Vint', '6 Bultman Lane', 'mvint18@shinystat.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('7364067217', 'Agretha', 'Draaisma', '77964 Arizona Road', 'adraaisma19@nasa.gov', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('0444331972', 'Agnes', 'Vokins', '3678 Jenifer Court', 'avokins1a@studiopress.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('3983313653', 'Ailina', 'McDonnell', '3 Londonderry Alley', 'amcdonnell1b@blogtalkradio.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('1774663519', 'Rocky', 'Haken', '98457 Summer Ridge Circle', 'rhaken1c@cam.ac.uk', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('3793413545', 'Debee', 'Hylton', '9961 Mallard Drive', 'dhylton1d@networkadvertising.org', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('4213222671', 'Clarance', 'Brade', '20 Johnson Lane', 'cbrade1e@ucla.edu', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('7547924132', 'Randal', 'Kollaschek', '4 Forest Plaza', 'rkollaschek1f@go.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('1877546974', 'Melany', 'Huge', '279 Graedel Avenue', 'mhuge1g@nps.gov', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('8984400602', 'Markus', 'Carmel', '62 Moulton Circle', 'mcarmel1h@virginia.edu', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('9396490625', 'Van', 'Rennock', '91 Annamark Lane', 'vrennock1i@jugem.jp', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('6169690744', 'Syd', 'Gremane', '2 Schlimgen Street', 'sgremane1j@admin.ch', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('1809526868', 'Derry', 'Leteurtre', '07783 Lerdahl Crossing', 'dleteurtre1k@who.int', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('1042026099', 'Yancy', 'Rubinlicht', '93765 Sunnyside Alley', 'yrubinlicht1l@reuters.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('1835498482', 'Dulciana', 'Ricciardi', '45 Oak Point', 'dricciardi1m@ucoz.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('6848945856', 'Myrilla', 'Shaddick', '0 Jackson Way', 'mshaddick1n@1688.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('6904797423', 'Jania', 'Balnave', '12 Lunder Trail', 'jbalnave1o@foxnews.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('6005881043', 'Genna', 'Switzer', '8 Canary Court', 'gswitzer1p@deliciousdays.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('0270502524', 'Fredericka', 'Eldon', '548 Macpherson Junction', 'feldon1q@studiopress.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('3117958852', 'Ransom', 'Blaker', '49065 Nevada Hill', 'rblaker1r@sfgate.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('3876767402', 'Jeanie', 'Coo', '56276 Manufacturers Drive', 'jcoo1s@sbwire.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('3738263796', 'Jarrad', 'Sheal', '158 Coolidge Lane', 'jsheal1t@businesswire.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('8034414793', 'Ringo', 'Duffett', '22 Upham Terrace', 'rduffett1u@cbc.ca', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('7058380103', 'Natale', 'Dri', '6128 Goodland Parkway', 'ndri1v@privacy.gov.au', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('6998620735', 'Bengt', 'Cadany', '629 Tennyson Point', 'bcadany1w@hatena.ne.jp', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('4598815947', 'Marcy', 'Tackley', '6817 Vermont Alley', 'mtackley1x@auda.org.au', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('3923565912', 'Chiquita', 'Kinney', '694 Caliangt Lane', 'ckinney1y@latimes.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('0213985100', 'Wiley', 'Sawdy', '32 Victoria Place', 'wsawdy1z@dmoz.org', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('1574927821', 'Jess', 'Leamon', '15 Lillian Place', 'jleamon20@unc.edu', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('9531706912', 'Slade', 'Foden', '63709 Delladonna Crossing', 'sfoden21@flickr.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('9040324064', 'Abran', 'Hodgins', '5 Ridgeview Place', 'ahodgins22@tripadvisor.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('6505432332', 'Bryce', 'Shallo', '5038 Melody Point', 'bshallo23@example.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('4095482778', 'Lowell', 'Calender', '2218 Superior Place', 'lcalender24@apache.org', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('4239336175', 'Kristy', 'Dredge', '31956 Eastlawn Court', 'kdredge25@photobucket.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('6658218036', 'Deeann', 'Asbrey', '833 Meadow Ridge Street', 'dasbrey26@huffingtonpost.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('0089974644', 'Avigdor', 'McNamee', '31186 Declaration Parkway', 'amcnamee27@weather.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('8310969445', 'Ernie', 'Laingmaid', '0 Sheridan Crossing', 'elaingmaid28@smh.com.au', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('6694855253', 'Pincas', 'Iwanicki', '87188 Portage Hill', 'piwanicki29@topsy.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('4123111402', 'Waylen', 'Whatsize', '27 Katie Way', 'wwhatsize2a@nymag.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('0782397955', 'Gib', 'Blemings', '9 Boyd Plaza', 'gblemings2b@t-online.de', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('7362343878', 'Karrie', 'Trayton', '54013 Kingsford Parkway', 'ktrayton2c@tmall.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('6756907036', 'Wolfie', 'Meconi', '61102 Cambridge Street', 'wmeconi2d@kickstarter.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('9500305020', 'Melamie', 'McCracken', '5 Superior Road', 'mmccracken2e@over-blog.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('1869028455', 'Sarine', 'Nendick', '7 Gina Junction', 'snendick2f@netlog.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('6603289767', 'Constantina', 'Swatton', '379 Bowman Trail', 'cswatton2g@example.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('1925338589', 'Celine', 'Trustie', '1 Harbort Hill', 'ctrustie2h@uiuc.edu', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('1270667583', 'Yuma', 'Sheppey', '26 Valley Edge Parkway', 'ysheppey2i@oakley.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('3338792036', 'Vilhelmina', 'Balogun', '84 Mifflin Circle', 'vbalogun2j@oracle.com', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('6747111874', 'Sammy', 'Barrow', '1331 Kropf Trail', 'sbarrow2k@biglobe.ne.jp', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('2583665262', 'Gaye', 'Scholfield', '28136 Golden Leaf Way', 'gscholfield2l@dmoz.org', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('7895104622', 'Jonah', 'Messier', '56 Stephen Avenue', 'jmessier2m@mit.edu', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('3484937818', 'Bonnie', 'Eckert', '597 Lotheville Trail', 'beckert2n@naver.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('4548095909', 'Earvin', 'Leborgne', '0 Bowman Drive', 'eleborgne2o@businesswire.com', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('8378095761', 'Matti', 'Brahams', '056 Vera Terrace', 'mbrahams2p@cpanel.net', 'MAYORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('8667904689', 'Efren', 'Le Quesne', '12 Norway Maple Terrace', 'elequesne2q@creativecommons.org', 'MINORISTA');
insert into Cliente (Cedula, Nombres, Apellidos, Direccion, Email, TipoCliente) values ('8223601885', 'Katharina', 'Headings', '3485 Birchwood Lane', 'kheadings2r@usda.gov', 'MAYORISTA');

insert into Inventario (IdProducto, Stock) values (1, 550);
insert into Inventario (IdProducto, Stock) values (2, 996);
insert into Inventario (IdProducto, Stock) values (3, 390);
insert into Inventario (IdProducto, Stock) values (4, 944);
insert into Inventario (IdProducto, Stock) values (5, 809);
insert into Inventario (IdProducto, Stock) values (6, 345);
insert into Inventario (IdProducto, Stock) values (7, 600);
insert into Inventario (IdProducto, Stock) values (8, 263);
insert into Inventario (IdProducto, Stock) values (9, 868);
insert into Inventario (IdProducto, Stock) values (10, 674);
insert into Inventario (IdProducto, Stock) values (11, 439);
insert into Inventario (IdProducto, Stock) values (12, 528);
insert into Inventario (IdProducto, Stock) values (13, 622);
insert into Inventario (IdProducto, Stock) values (14, 138);
insert into Inventario (IdProducto, Stock) values (15, 539);
insert into Inventario (IdProducto, Stock) values (16, 943);
insert into Inventario (IdProducto, Stock) values (17, 371);
insert into Inventario (IdProducto, Stock) values (18, 499);
insert into Inventario (IdProducto, Stock) values (19, 564);
insert into Inventario (IdProducto, Stock) values (20, 694);
insert into Inventario (IdProducto, Stock) values (21, 530);
insert into Inventario (IdProducto, Stock) values (22, 183);
insert into Inventario (IdProducto, Stock) values (23, 216);
insert into Inventario (IdProducto, Stock) values (24, 566);
insert into Inventario (IdProducto, Stock) values (25, 277);
insert into Inventario (IdProducto, Stock) values (26, 440);
insert into Inventario (IdProducto, Stock) values (27, 578);
insert into Inventario (IdProducto, Stock) values (28, 50);
insert into Inventario (IdProducto, Stock) values (29, 579);
insert into Inventario (IdProducto, Stock) values (30, 392);
insert into Inventario (IdProducto, Stock) values (31, 300);
insert into Inventario (IdProducto, Stock) values (32, 708);
insert into Inventario (IdProducto, Stock) values (33, 664);
insert into Inventario (IdProducto, Stock) values (34, 221);
insert into Inventario (IdProducto, Stock) values (35, 937);
insert into Inventario (IdProducto, Stock) values (36, 990);
insert into Inventario (IdProducto, Stock) values (37, 443);
insert into Inventario (IdProducto, Stock) values (38, 556);
insert into Inventario (IdProducto, Stock) values (39, 876);
insert into Inventario (IdProducto, Stock) values (40, 427);
insert into Inventario (IdProducto, Stock) values (41, 272);
insert into Inventario (IdProducto, Stock) values (42, 352);
insert into Inventario (IdProducto, Stock) values (43, 5);
insert into Inventario (IdProducto, Stock) values (44, 873);
insert into Inventario (IdProducto, Stock) values (45, 67);
insert into Inventario (IdProducto, Stock) values (46, 842);
insert into Inventario (IdProducto, Stock) values (47, 888);
insert into Inventario (IdProducto, Stock) values (48, 482);
insert into Inventario (IdProducto, Stock) values (49, 651);
insert into Inventario (IdProducto, Stock) values (50, 229);
insert into Inventario (IdProducto, Stock) values (51, 274);
insert into Inventario (IdProducto, Stock) values (52, 119);
insert into Inventario (IdProducto, Stock) values (53, 173);
insert into Inventario (IdProducto, Stock) values (54, 152);
insert into Inventario (IdProducto, Stock) values (55, 382);
insert into Inventario (IdProducto, Stock) values (56, 358);
insert into Inventario (IdProducto, Stock) values (57, 934);
insert into Inventario (IdProducto, Stock) values (58, 25);
insert into Inventario (IdProducto, Stock) values (59, 13);
insert into Inventario (IdProducto, Stock) values (60, 172);
insert into Inventario (IdProducto, Stock) values (61, 270);
insert into Inventario (IdProducto, Stock) values (62, 10);
insert into Inventario (IdProducto, Stock) values (63, 987);
insert into Inventario (IdProducto, Stock) values (64, 15);
insert into Inventario (IdProducto, Stock) values (65, 509);
insert into Inventario (IdProducto, Stock) values (66, 809);
insert into Inventario (IdProducto, Stock) values (67, 253);
insert into Inventario (IdProducto, Stock) values (68, 830);
insert into Inventario (IdProducto, Stock) values (69, 922);
insert into Inventario (IdProducto, Stock) values (70, 413);
insert into Inventario (IdProducto, Stock) values (71, 43);
insert into Inventario (IdProducto, Stock) values (72, 1);
insert into Inventario (IdProducto, Stock) values (73, 973);
insert into Inventario (IdProducto, Stock) values (74, 471);
insert into Inventario (IdProducto, Stock) values (75, 818);
insert into Inventario (IdProducto, Stock) values (76, 207);
insert into Inventario (IdProducto, Stock) values (77, 979);
insert into Inventario (IdProducto, Stock) values (78, 312);
insert into Inventario (IdProducto, Stock) values (79, 357);
insert into Inventario (IdProducto, Stock) values (80, 736);
insert into Inventario (IdProducto, Stock) values (81, 182);
insert into Inventario (IdProducto, Stock) values (82, 671);
insert into Inventario (IdProducto, Stock) values (83, 708);
insert into Inventario (IdProducto, Stock) values (84, 178);
insert into Inventario (IdProducto, Stock) values (85, 225);
insert into Inventario (IdProducto, Stock) values (86, 405);
insert into Inventario (IdProducto, Stock) values (87, 773);
insert into Inventario (IdProducto, Stock) values (88, 88);
insert into Inventario (IdProducto, Stock) values (89, 193);
insert into Inventario (IdProducto, Stock) values (90, 32);
insert into Inventario (IdProducto, Stock) values (91, 564);
insert into Inventario (IdProducto, Stock) values (92, 42);
insert into Inventario (IdProducto, Stock) values (93, 589);
insert into Inventario (IdProducto, Stock) values (94, 199);
insert into Inventario (IdProducto, Stock) values (95, 15);
insert into Inventario (IdProducto, Stock) values (96, 520);
insert into Inventario (IdProducto, Stock) values (97, 113);
insert into Inventario (IdProducto, Stock) values (98, 597);
insert into Inventario (IdProducto, Stock) values (99, 700);
insert into Inventario (IdProducto, Stock) values (100, 550);

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
