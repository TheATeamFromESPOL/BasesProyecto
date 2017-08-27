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
insert into Producto (NombreProducto, PrecioPublico, PrecioMayorista, Descripcion) values ('Hue strife', 25.02, '23.21', 'Huehuehuehue');

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

insert into Proveedor (NombreProveedor, Telefono, Email, Direccion, Pais, Ciudad) values ('Desconocido', '0000000000000', 'Desconocido', 'Desconocido', 1, 14);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Borer LLC', '7-(350)747-4777', 'cbrimner0@europa.eu', '10 Troy Way', 1, 14);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Mitchell and Sons', '30-(934)355-2192', 'lrostron1@sfgate.com', '56 Brentwood Point', 1, 92);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Jakubowski and Sons', '7-(649)693-9604', 'vcoyte2@1und1.de', '92 Lerdahl Alley', 1, 65);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Anderson-Nolan', '1-(336)204-6958', 'npilmoor3@ustream.tv', '42 Lunder Center', 1, 45);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Shanahan-Braun', '7-(538)544-0420', 'ohaslewood4@squidoo.com', '48216 Lake View Center', 1, 93);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('O''Kon LLC', '86-(990)924-8985', 'tantyukhin5@shinystat.com', '8 Roxbury Point', 1, 30);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Lowe-Swaniawski', '55-(385)378-7069', 'tclac6@comsenz.com', '6 Straubel Trail', 1, 14);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Welch Inc', '62-(335)402-8973', 'imesser7@opera.com', '023 Menomonie Alley', 1, 35);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Schaefer, Ferry and Lebsack', '33-(134)362-3747', 'dsaynor8@wix.com', '14493 Warrior Terrace', 1, 53);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('D''Amore-Bartell', '960-(952)107-0694', 'tdelahunty9@hhs.gov', '91 Northland Point', 1, 55);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Mueller-Paucek', '58-(889)666-8105', 'hrooa@thetimes.co.uk', '99 Katie Lane', 1, 55);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Brekke-Kutch', '33-(446)486-7164', 'ugrissb@scientificamerican.com', '715 Northport Junction', 1, 30);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Wunsch Group', '55-(966)939-2395', 'meeftingc@github.com', '3286 Lotheville Junction', 1, 55);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Mitchell Group', '46-(122)391-5497', 'cvandalend@hugedomains.com', '4 Fieldstone Alley', 1, 8);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Eichmann, Ryan and Wolff', '212-(364)841-0609', 'edadde@addthis.com', '9 Lindbergh Road', 1, 93);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Boyer Inc', '86-(572)920-2593', 'lwalkerf@amazon.com', '56160 Hagan Point', 1, 50);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Franecki LLC', '86-(481)840-7989', 'harmfirldg@blogtalkradio.com', '309 Blackbird Park', 1, 50);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Beatty Group', '244-(250)412-2749', 'csharphursth@cbsnews.com', '497 Lotheville Road', 1, 52);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Blanda-Herzog', '93-(986)217-2739', 'bthezei@altervista.org', '6256 Continental Court', 1, 50);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Watsica LLC', '86-(696)235-3847', 'ameecherj@nhs.uk', '53 Shasta Pass', 1, 100);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Schoen Inc', '62-(100)687-6637', 'vmoxleyk@github.io', '3251 Sunfield Trail', 1, 30);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Schimmel Inc', '49-(284)221-7825', 'elambdonl@reddit.com', '6 Hudson Drive', 1, 65);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Reichel LLC', '66-(237)502-0739', 'mjollandm@posterous.com', '75184 Anthes Junction', 1, 15);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Swaniawski-Renner', '86-(730)924-2091', 'vattwooln@google.pl', '5 Coleman Place', 1, 84);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Balistreri Inc', '506-(814)551-8145', 'sdinsello@parallels.com', '88 Nelson Hill', 1, 86);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Gottlieb-Bradtke', '33-(620)226-8557', 'jyushkinp@mac.com', '5 Buell Lane', 1, 24);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Hegmann LLC', '380-(196)450-0440', 'gwitherbyq@123-reg.co.uk', '3 Continental Circle', 1, 35);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Johns-Hayes', '7-(604)418-2276', 'sbranthwaiter@wsj.com', '4635 Lawn Drive', 1, 45);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Botsford, White and Goyette', '62-(105)462-0444', 'rsimonettos@squidoo.com', '7457 Eagle Crest Way', 1, 92);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Friesen, Bergnaum and Ruecker', '509-(813)320-8676', 'kcampanellet@surveymonkey.com', '0019 Fairview Plaza', 1, 35);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Renner, Wunsch and Donnelly', '971-(295)777-8139', 'rpottleu@lycos.com', '89893 Macpherson Street', 1, 34);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('D''Amore-Weissnat', '62-(192)235-7468', 'ajagsonv@home.pl', '20 Beilfuss Drive', 1, 100);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Cassin-Kuhlman', '55-(925)997-9755', 'kameerbegw@mayoclinic.com', '8684 Rutledge Point', 1, 34);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Funk, Marvin and Graham', '86-(671)238-8114', 'sbarrablex@accuweather.com', '011 Loomis Trail', 1, 3);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Parisian-Lubowitz', '7-(404)976-0035', 'rfulmeny@rambler.ru', '83 Village Green Junction', 1, 55);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Sanford, Ward and Macejkovic', '225-(234)631-3576', 'ckillimisterz@tumblr.com', '976 Melby Place', 1, 30);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Block, Morar and Crist', '593-(936)635-4333', 'tglenister10@about.com', '404 Chive Circle', 1, 24);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Bashirian-Morar', '64-(637)475-6910', 'pschustl11@arstechnica.com', '681 Kenwood Alley', 1, 3);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Greenfelder, Adams and Bayer', '251-(257)884-9115', 'gtidbald12@forbes.com', '70960 Kensington Alley', 1, 50);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Lockman and Sons', '30-(383)368-9820', 'nelmhirst13@quantcast.com', '7697 Farragut Point', 1, 20);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Walker Inc', '254-(794)976-8549', 'gconrart14@mapy.cz', '63885 Maryland Alley', 1, 53);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Dooley-Ritchie', '375-(478)521-9345', 'kvick15@seesaa.net', '8 Luster Court', 1, 3);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Haley LLC', '86-(854)666-7375', 'holivo16@lulu.com', '212 Ridge Oak Trail', 1, 35);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Terry and Sons', '62-(873)107-4217', 'npiens17@nationalgeographic.com', '52590 Barnett Road', 1, 15);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Bayer, Mertz and Pacocha', '963-(659)866-7213', 'llishman18@nasa.gov', '590 Homewood Court', 1, 24);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Flatley and Sons', '225-(473)599-7523', 'bgounet19@fastcompany.com', '32 Quincy Center', 1, 84);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Littel, Keebler and Thompson', '46-(921)775-6648', 'acoard1a@google.com', '7 Acker Lane', 1, 34);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Jast LLC', '387-(589)559-8436', 'cbhar1b@bing.com', '234 Straubel Lane', 1, 86);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Wehner-Cronin', '62-(519)333-4657', 'flinder1c@dailymotion.com', '3 Toban Avenue', 1, 57);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Cummerata-King', '86-(402)622-9372', 'elandrean1d@admin.ch', '8823 Eggendart Lane', 1, 24);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Larkin-Welch', '33-(609)170-9796', 'jmcvanamy1e@etsy.com', '73 Tennyson Park', 1, 15);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Legros-Marvin', '86-(672)797-0875', 'cgrasha1f@phoca.cz', '38 Browning Terrace', 1, 34);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Wiegand-Carroll', '86-(858)193-5823', 'sbremeyer1g@latimes.com', '49 Fair Oaks Terrace', 1, 35);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Marquardt, Reichel and Marvin', '20-(357)263-6663', 'msoltan1h@behance.net', '0 Kingsford Terrace', 1, 15);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Mills-Stamm', '7-(322)504-7670', 'czuan1i@digg.com', '663 Nobel Center', 1, 84);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Price, Mann and Rolfson', '420-(650)142-8399', 'sogilby1j@epa.gov', '01 Chinook Junction', 1, 45);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Murphy and Sons', '51-(155)178-5232', 'nbedboro1k@unblog.fr', '57717 Bellgrove Street', 1, 57);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Aufderhar LLC', '86-(688)644-4445', 'pstrutz1l@latimes.com', '6 Nevada Point', 1, 34);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Towne, Stehr and Hudson', '81-(233)545-3731', 'lmellodey1m@indiatimes.com', '0 Bartillon Terrace', 1, 52);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('O''Hara, O''Connell and Batz', '63-(899)807-1119', 'rsever1n@google.co.jp', '270 Pierstorff Lane', 1, 93);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Moen-Christiansen', '7-(535)448-8940', 'mpressey1o@spotify.com', '6062 Chive Park', 1, 86);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Mraz-Kuvalis', '30-(508)112-7822', 'epacker1p@clickbank.net', '19198 Meadow Valley Trail', 1, 84);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Windler-Wyman', '267-(973)593-9064', 'srothon1q@yelp.com', '9784 Schiller Road', 1, 65);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('O''Conner Group', '381-(368)520-8128', 'mlarrat1r@auda.org.au', '52856 Grim Point', 1, 84);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Weber-Koss', '86-(366)114-2423', 'oturban1s@samsung.com', '4 Lotheville Drive', 1, 52);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Leffler-Rippin', '48-(619)672-9617', 'rsnowding1t@mtv.com', '3093 Corben Center', 1, 34);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Parisian, Jaskolski and Dickinson', '256-(356)467-1182', 'cbemwell1u@imdb.com', '36549 West Hill', 1, 86);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Boyer-Klein', '1-(303)879-2826', 'jdedham1v@admin.ch', '53 Alpine Hill', 1, 84);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Orn-Feest', '33-(103)749-4489', 'lkort1w@apple.com', '7576 Macpherson Hill', 1, 14);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Brekke-Kassulke', '593-(357)670-6910', 'tguerriero1x@delicious.com', '9892 Helena Terrace', 1, 15);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Ledner-Schimmel', '7-(334)514-6761', 'jkohrsen1y@cdc.gov', '57 Garrison Terrace', 1, 84);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Runolfsdottir, Klocko and Kemmer', '7-(243)211-3240', 'csmorthit1z@wikispaces.com', '945 Manley Plaza', 1, 30);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Kreiger-Harber', '51-(932)393-5540', 'dkey20@ca.gov', '21030 Dixon Alley', 1, 57);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Predovic-Grant', '7-(840)395-8996', 'gmelton21@godaddy.com', '4 Sugar Crossing', 1, 93);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Von, Nader and Lang', '86-(681)863-5780', 'czielinski22@unesco.org', '2 Del Sol Street', 1, 30);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Feeney LLC', '33-(743)995-5907', 'mborgbartolo23@bravesites.com', '69 Hauk Park', 1, 35);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Hermiston Group', '30-(370)925-0936', 'lquarry24@hibu.com', '2 Lien Park', 1, 45);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Schimmel-Nikolaus', '63-(708)852-1662', 'kcolbourn25@scientificamerican.com', '38120 Blackbird Junction', 1, 57);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Franecki and Sons', '86-(582)940-0256', 'chatch26@hibu.com', '8 Superior Park', 1, 93);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Cremin and Sons', '380-(292)667-7450', 'upirie27@cpanel.net', '2610 Maple Wood Terrace', 1, 84);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Crist-Goyette', '86-(653)953-0545', 'mheningham28@jigsy.com', '4 Holy Cross Street', 1, 93);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('McClure and Sons', '61-(225)626-8324', 'makers29@creativecommons.org', '985 Granby Park', 1, 55);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Goodwin LLC', '57-(638)751-8170', 'jhadwick2a@wix.com', '25 Ridge Oak Way', 1, 34);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Kris Group', '86-(746)409-2405', 'hlombardo2b@sphinn.com', '7 Logan Park', 1, 14);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Reilly Inc', '62-(979)979-1872', 'sbulteel2c@privacy.gov.au', '7688 Kings Parkway', 1, 100);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Armstrong, Murazik and Armstrong', '504-(732)850-6966', 'agomery2d@chron.com', '57 Oneill Street', 1, 86);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Goodwin-Stanton', '58-(607)786-3333', 'qcornfoot2e@hugedomains.com', '57480 Anniversary Place', 1, 84);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Ankunding, Lakin and Jacobson', '62-(200)395-5499', 'ecroutear2f@netvibes.com', '654 Dottie Drive', 1, 52);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Williamson, Leffler and Koelpin', '976-(171)286-4417', 'agallymore2g@hibu.com', '811 Oriole Circle', 1, 30);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Glover, Stroman and Heathcote', '52-(742)176-2183', 'hcraster2h@geocities.com', '09557 Grim Crossing', 1, 45);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Walsh and Sons', '62-(222)244-9967', 'agroves2i@senate.gov', '85985 Carey Point', 1, 34);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Will Inc', '55-(136)989-4591', 'acann2j@chicagotribune.com', '0361 Blackbird Lane', 1, 35);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Jones-Quitzon', '62-(790)767-0268', 'lmckenny2k@narod.ru', '76299 Messerschmidt Street', 1, 20);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Barrows LLC', '64-(855)471-9513', 'nblare2l@youku.com', '82 Mitchell Place', 1, 100);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Corwin Inc', '7-(435)402-9074', 'acran2m@parallels.com', '97497 Trailsway Drive', 1, 50);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Hamill Group', '86-(475)768-9942', 'rjorin2n@moonfruit.com', '7182 Monument Terrace', 1, 52);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Greenfelder LLC', '48-(733)501-2967', 'pdrain2o@businessweek.com', '0 Manitowish Trail', 1, 65);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Yost LLC', '509-(454)919-0687', 'cohdirscoll2p@edublogs.org', '670 Bunting Point', 1, 8);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Jast Group', '95-(658)524-4741', 'lbonafacino2q@ca.gov', '9 Lawn Terrace', 1, 15);
insert into Proveedor (NombreProveedor, Telefono, email, Direccion, Pais, Ciudad) values ('Jasup', '95-(658)524-4741', 'lbonafacino2q@ca.gov', '9 Lawn Terrace', 1, 15);


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
insert into Inventario (IdProducto, Stock) values (66, 0);
insert into Inventario (IdProducto, Stock) values (67, 253);
insert into Inventario (IdProducto, Stock) values (68, 830);
insert into Inventario (IdProducto, Stock) values (69, 922);
insert into Inventario (IdProducto, Stock) values (70, 413);
insert into Inventario (IdProducto, Stock) values (71, 43);
insert into Inventario (IdProducto, Stock) values (72, 1);
insert into Inventario (IdProducto, Stock) values (73, 973);
insert into Inventario (IdProducto, Stock) values (74, 471);
insert into Inventario (IdProducto, Stock) values (75, 0);
insert into Inventario (IdProducto, Stock) values (76, 207);
insert into Inventario (IdProducto, Stock) values (77, 979);
insert into Inventario (IdProducto, Stock) values (78, 0);
insert into Inventario (IdProducto, Stock) values (79, 357);
insert into Inventario (IdProducto, Stock) values (80, 0);
insert into Inventario (IdProducto, Stock) values (81, 182);
insert into Inventario (IdProducto, Stock) values (82, 671);
insert into Inventario (IdProducto, Stock) values (83, 708);
insert into Inventario (IdProducto, Stock) values (84, 0);
insert into Inventario (IdProducto, Stock) values (85, 225);
insert into Inventario (IdProducto, Stock) values (86, 405);
insert into Inventario (IdProducto, Stock) values (87, 773);
insert into Inventario (IdProducto, Stock) values (88, 88);
insert into Inventario (IdProducto, Stock) values (89, 0);
insert into Inventario (IdProducto, Stock) values (90, 32);
insert into Inventario (IdProducto, Stock) values (91, 564);
insert into Inventario (IdProducto, Stock) values (92, 42);
insert into Inventario (IdProducto, Stock) values (93, 589);
insert into Inventario (IdProducto, Stock) values (94, 199);
insert into Inventario (IdProducto, Stock) values (95, 15);
insert into Inventario (IdProducto, Stock) values (96, 0);
insert into Inventario (IdProducto, Stock) values (97, 113);
insert into Inventario (IdProducto, Stock) values (98, 597);
insert into Inventario (IdProducto, Stock) values (99, 700);
insert into Inventario (IdProducto, Stock) values (100, 0);

insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4239336175', 443.24, '2017-04-25', '6:44:17');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0986490097', 32.61, '2017-05-06', '21:16:46');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1835498482', 303.78, '2016-09-22', '17:30:31');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0089974644', 343.04, '2017-03-28', '0:53:45');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3793413545', 203.0, '2017-01-03', '19:22:49');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('6747111874', 324.81, '2017-08-16', '13:55:05');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3571545018', 207.97, '2016-10-03', '9:25:28');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8984400602', 386.62, '2017-05-16', '23:40:58');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0107013040', 256.87, '2017-03-27', '13:54:36');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8682248249', 476.64, '2016-12-21', '5:37:26');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('5631458614', 24.64, '2017-04-19', '18:37:43');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('5499713004', 24.26, '2016-09-09', '10:08:12');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1042026099', 76.94, '2017-07-25', '3:45:32');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0089974644', 348.48, '2016-08-29', '13:31:38');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('7058380103', 191.34, '2017-02-05', '1:15:00');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1835498482', 226.68, '2017-06-07', '9:19:14');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0000000000', 212.88, '2017-05-28', '8:42:05');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3983313653', 239.83, '2017-04-03', '10:59:15');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('6352829767', 147.4, '2016-09-22', '19:08:44');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0000000000', 132.34, '2017-07-08', '17:17:28');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4239336175', 33.67, '2017-03-06', '21:35:20');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3190734738', 457.59, '2017-08-02', '5:44:28');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('2399253187', 412.83, '2016-12-11', '17:04:01');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('5024113748', 165.39, '2017-01-23', '5:32:53');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4632831007', 191.09, '2017-03-06', '5:51:28');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4239336175', 156.68, '2017-04-13', '6:56:27');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('9500305020', 440.57, '2017-03-26', '14:31:14');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('5044891492', 3.52, '2017-08-14', '16:02:43');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3190734738', 448.05, '2016-12-01', '6:42:02');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('6694855253', 294.86, '2017-01-27', '11:51:37');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4548095909', 448.26, '2017-06-06', '12:57:52');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4601666916', 67.46, '2016-12-05', '0:49:05');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0089974644', 351.17, '2017-01-31', '7:39:25');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1788448597', 149.37, '2017-08-15', '13:45:47');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4095482778', 311.01, '2016-09-17', '12:37:06');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('6998620735', 186.95, '2016-11-28', '22:45:19');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8984400602', 431.05, '2017-02-08', '11:37:29');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1554523395', 349.9, '2017-08-25', '6:50:08');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0444331972', 325.63, '2017-01-18', '4:31:38');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3857218867', 199.95, '2017-05-08', '8:29:18');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('2797980924', 293.0, '2017-03-03', '13:03:22');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8378095761', 412.79, '2017-05-03', '10:56:03');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('5474194646', 400.87, '2017-01-02', '1:07:58');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8378095761', 362.47, '2016-12-13', '20:16:49');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('7547924132', 125.24, '2017-06-17', '17:56:38');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3793413545', 61.98, '2017-02-10', '7:15:02');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4213222671', 350.33, '2017-08-16', '6:53:37');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('2797980924', 42.64, '2017-06-18', '8:08:24');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8223601885', 152.48, '2016-12-30', '12:06:43');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8427241329', 165.58, '2017-06-13', '21:03:58');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3983313653', 323.51, '2017-01-27', '9:40:11');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('7547924132', 54.36, '2017-02-06', '9:52:25');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0696962839', 467.56, '2016-12-11', '1:45:49');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0000000000', 370.62, '2017-08-13', '14:30:56');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3857218867', 14.11, '2017-06-05', '15:41:56');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('7058380103', 61.39, '2016-11-21', '8:51:31');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3190734738', 88.87, '2016-12-30', '19:33:21');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0782397955', 13.76, '2017-04-17', '2:02:14');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4416070789', 291.88, '2017-05-03', '7:33:19');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3923565912', 385.43, '2016-12-25', '19:51:49');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1809526868', 159.98, '2016-11-09', '14:50:04');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('7058380103', 266.98, '2017-01-30', '18:05:26');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0797635299', 97.66, '2016-12-15', '16:11:23');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3609628117', 71.19, '2017-01-21', '11:11:54');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4812361799', 95.31, '2017-01-31', '8:18:39');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('7364067217', 366.88, '2017-08-07', '2:03:54');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1925338589', 305.34, '2016-09-22', '20:08:09');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4416070789', 315.63, '2016-11-01', '19:31:29');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0089974644', 63.91, '2016-10-11', '16:57:32');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8223601885', 420.71, '2016-10-07', '11:09:29');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('9500305020', 172.79, '2017-04-22', '3:20:27');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('9066770130', 431.63, '2016-12-17', '20:11:27');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('6904797423', 56.98, '2017-01-30', '4:05:50');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('5512574682', 207.52, '2017-02-23', '20:47:53');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3484937818', 321.09, '2016-11-07', '22:03:32');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3571545018', 255.78, '2017-04-28', '11:35:00');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('5553942925', 417.8, '2017-07-11', '16:49:57');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('5499713004', 19.09, '2017-04-03', '3:30:19');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3605716040', 380.4, '2016-10-03', '2:12:09');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('2378687902', 69.38, '2017-06-01', '8:23:50');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('2797980924', 384.52, '2017-06-06', '6:51:04');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1774663519', 408.02, '2017-04-07', '15:40:47');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('2693420617', 478.79, '2016-10-10', '15:02:19');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('2862376689', 363.39, '2017-05-31', '20:34:56');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4632831007', 456.03, '2016-12-18', '23:16:11');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4601666916', 153.45, '2017-03-29', '3:27:53');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1835498482', 252.18, '2017-02-04', '17:52:10');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4548095909', 210.22, '2017-03-30', '3:37:33');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('2378687902', 309.26, '2016-11-29', '21:41:31');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('5499713004', 247.5, '2017-03-18', '13:59:06');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4812361799', 53.45, '2016-09-29', '11:22:52');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0797635299', 50.46, '2017-03-19', '4:35:22');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8310969445', 313.6, '2017-01-20', '18:14:09');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('5499713004', 382.65, '2016-12-04', '11:35:08');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('7082252583', 17.92, '2016-11-13', '12:41:32');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('7362343878', 133.72, '2017-02-17', '10:41:04');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0270502524', 33.9, '2017-01-03', '11:07:06');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('6998620735', 451.66, '2017-06-26', '1:13:03');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('2399253187', 191.9, '2017-03-04', '17:37:43');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('6694855253', 16.86, '2017-06-24', '5:07:48');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0562377715', 284.13, '2017-02-01', '2:58:29');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('5553942925', 108.19, '2017-03-26', '12:46:43');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('6005881043', 16.81, '2016-12-03', '15:04:48');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3117958852', 14.98, '2017-07-02', '15:00:54');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8714754519', 448.21, '2016-11-10', '2:29:33');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4123111402', 53.86, '2016-11-18', '13:00:31');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('6998620735', 378.03, '2016-10-14', '8:42:34');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('5631458614', 161.02, '2016-10-12', '1:50:22');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8034414793', 187.7, '2016-12-30', '0:14:18');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1835498482', 180.66, '2017-04-26', '2:49:17');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('7364067217', 187.64, '2017-05-30', '5:45:54');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('5553942925', 483.65, '2017-08-03', '4:44:44');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0562377715', 97.42, '2017-01-18', '15:10:23');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8310969445', 139.72, '2016-12-12', '9:21:01');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3859910099', 175.98, '2016-11-14', '5:17:56');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0107013040', 431.19, '2017-01-12', '10:36:57');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3923565912', 165.86, '2016-10-14', '7:23:38');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8714754519', 258.36, '2017-03-28', '12:14:06');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3190734738', 411.77, '2017-02-08', '22:47:38');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('2862376689', 375.0, '2016-08-26', '3:14:30');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4416070789', 113.07, '2016-10-20', '7:51:46');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3484937818', 477.91, '2016-11-10', '18:28:01');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('6005881043', 287.71, '2016-12-04', '9:15:16');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('9066770130', 58.86, '2016-10-26', '7:06:15');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3190734738', 449.74, '2017-05-03', '3:25:28');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1042026099', 422.99, '2017-06-17', '2:46:17');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('5024113748', 55.68, '2016-12-15', '11:00:33');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('7547924132', 172.62, '2017-08-14', '9:12:13');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3571545018', 222.29, '2017-03-29', '13:56:59');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1788448597', 435.85, '2017-05-03', '0:04:34');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('7058380103', 299.67, '2016-10-14', '9:04:11');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1574927821', 219.6, '2017-03-20', '7:29:56');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1774663519', 289.1, '2016-11-30', '9:02:31');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('5512574682', 160.17, '2017-07-27', '8:27:38');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('6603289767', 310.64, '2017-07-17', '14:48:26');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('9396490625', 190.03, '2016-10-05', '2:20:47');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4548095909', 229.25, '2016-09-24', '16:39:32');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8682248249', 471.77, '2017-05-30', '7:36:04');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1554523395', 307.83, '2016-10-12', '3:20:16');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3190734738', 171.45, '2016-12-01', '12:33:39');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('6169690744', 56.2, '2017-04-18', '19:05:53');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8682248249', 497.64, '2017-04-04', '9:45:23');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1788448597', 109.7, '2016-12-26', '8:43:34');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3857218867', 291.27, '2017-01-30', '17:23:56');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('6988661028', 380.99, '2016-10-08', '7:38:43');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('5492324261', 361.84, '2016-10-08', '8:27:00');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0089974644', 209.37, '2017-02-18', '7:10:02');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4095482778', 316.58, '2017-06-02', '7:07:31');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3609628117', 355.56, '2016-10-28', '14:23:35');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3738263796', 484.54, '2017-01-31', '21:13:41');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('9040324064', 96.1, '2017-06-07', '6:30:05');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3609628117', 257.94, '2017-01-09', '5:06:56');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3605716040', 290.11, '2016-12-18', '6:27:22');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1877546974', 267.64, '2016-10-28', '14:25:01');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4095482778', 136.72, '2017-03-04', '2:46:13');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('6005881043', 258.85, '2016-12-27', '16:30:44');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0782397955', 65.78, '2017-08-22', '0:03:25');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1869028455', 236.16, '2017-07-05', '7:45:01');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4213222671', 198.69, '2016-10-15', '10:30:00');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1869028455', 438.36, '2016-11-02', '4:21:22');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4095482778', 355.96, '2017-05-01', '4:19:22');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('7895104622', 482.77, '2016-11-05', '10:35:19');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0270502524', 45.38, '2016-12-21', '21:25:16');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('9500305020', 443.53, '2017-08-18', '5:17:44');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1554523395', 422.29, '2016-12-29', '15:32:44');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1774663519', 407.32, '2017-08-03', '22:53:24');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8682248249', 110.52, '2017-02-17', '23:33:31');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8714754519', 358.38, '2017-07-08', '2:14:10');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8378095761', 286.64, '2017-07-20', '23:50:37');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3876767402', 332.26, '2017-03-18', '15:12:07');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('9040324064', 434.19, '2016-11-03', '3:50:17');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3609628117', 89.11, '2016-12-14', '16:29:42');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('6497778083', 2.51, '2017-02-07', '3:37:06');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4601666916', 101.41, '2016-10-11', '10:16:42');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3793413545', 128.98, '2017-06-27', '10:38:54');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('9500305020', 142.98, '2017-04-28', '5:17:43');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8984400602', 113.14, '2017-04-13', '16:07:59');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3876767402', 291.7, '2017-08-09', '8:24:23');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4123111402', 133.24, '2017-06-29', '12:45:46');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('9040324064', 481.54, '2016-11-28', '18:43:57');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('2797980924', 17.65, '2016-09-09', '10:02:43');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('9396490625', 384.49, '2017-02-07', '9:33:24');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3609628117', 53.95, '2017-02-26', '7:53:33');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1042026099', 293.98, '2017-05-19', '3:41:16');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('6497778083', 423.93, '2016-09-30', '12:37:38');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1877546974', 438.61, '2017-04-27', '19:30:11');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('7315837502', 138.02, '2016-11-17', '12:23:48');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('5499713004', 275.73, '2016-09-05', '19:27:13');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('7364067217', 37.28, '2017-05-08', '17:38:39');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('3338792036', 82.51, '2017-08-20', '16:39:51');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('6169690744', 337.19, '2017-01-14', '7:43:30');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('8223601885', 217.93, '2016-12-23', '11:10:15');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('2583665262', 103.4, '2016-12-04', '13:36:50');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4632831007', 151.52, '2017-02-11', '11:32:29');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1809526868', 393.44, '2016-12-10', '8:51:44');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('0797635299', 332.31, '2017-07-28', '23:00:34');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('7058380103', 69.03, '2016-09-26', '23:28:10');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('5553942925', 423.19, '2017-08-25', '6:42:50');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('4601666916', 435.76, '2017-04-11', '16:10:47');
insert into OrdenVenta (IdCliente, TotalVenta, Fecha, Hora) values ('1809526868', 429.55, '2017-01-17', '23:47:57');

insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (27, 314.12, '2016-12-01', '17:33:53');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (94, 7778.46, '2016-11-12', '14:56:36');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (82, 4399.87, '2017-08-22', '20:44:52');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (72, 3776.12, '2017-01-20', '10:27:04');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (100, 4289.46, '2016-11-16', '18:50:15');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (7, 5044.05, '2017-06-14', '9:17:39');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (75, 7168.47, '2017-03-13', '16:57:14');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (6, 5272.14, '2017-06-04', '16:18:48');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (63, 595.35, '2017-08-05', '21:52:33');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (62, 8793.75, '2016-11-24', '20:55:32');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (65, 302.4, '2016-12-20', '17:12:42');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (39, 9341.61, '2017-08-01', '14:45:12');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (50, 8974.17, '2016-11-08', '8:05:42');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (100, 1571.0, '2017-03-10', '13:21:55');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (84, 3066.64, '2016-12-08', '15:48:26');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (42, 3534.02, '2017-07-06', '9:36:39');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (98, 2938.82, '2017-06-12', '11:08:14');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (66, 3068.82, '2017-03-30', '10:40:56');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (100, 2082.4, '2016-12-26', '10:37:04');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (101, 7301.63, '2017-02-23', '15:35:15');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (14, 4028.16, '2017-05-03', '19:19:58');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (55, 6861.05, '2016-12-05', '21:51:16');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (101, 6599.66, '2017-04-03', '8:52:04');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (81, 7212.56, '2017-05-22', '10:14:05');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (96, 7086.86, '2017-05-24', '11:14:31');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (50, 8185.6, '2017-03-20', '15:06:28');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (77, 3928.63, '2017-04-17', '17:56:31');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (42, 1259.88, '2016-08-25', '17:39:13');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (30, 2247.93, '2017-04-18', '20:53:14');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (31, 9083.42, '2017-08-14', '21:11:46');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (23, 5719.0, '2017-02-14', '9:24:55');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (59, 5902.29, '2017-03-04', '8:55:13');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (60, 3045.57, '2017-02-10', '8:02:52');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (90, 9279.0, '2017-08-03', '15:40:03');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (91, 4142.09, '2017-01-08', '18:41:50');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (78, 217.85, '2017-08-09', '9:02:09');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (55, 4583.12, '2017-04-14', '20:27:24');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (46, 6719.47, '2017-02-22', '8:51:24');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (75, 1734.04, '2017-02-02', '10:45:58');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (47, 2379.02, '2017-02-16', '17:30:04');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (67, 6738.28, '2016-12-20', '20:22:08');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (84, 1690.08, '2017-01-01', '15:51:55');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (46, 41.57, '2017-02-24', '14:13:25');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (60, 3986.47, '2016-11-06', '15:08:17');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (81, 8718.29, '2017-08-23', '12:25:32');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (95, 2246.29, '2016-12-22', '14:02:27');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (19, 8158.88, '2016-12-24', '11:58:15');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (17, 2149.76, '2016-09-22', '10:11:44');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (21, 2058.61, '2016-08-30', '8:53:04');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (27, 6890.62, '2017-07-29', '10:11:19');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (8, 9035.24, '2017-02-01', '18:53:41');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (33, 100.21, '2017-01-14', '11:34:33');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (75, 3394.56, '2017-05-22', '21:32:11');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (38, 7887.24, '2017-03-24', '14:28:53');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (4, 6901.64, '2017-01-12', '12:02:15');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (81, 5278.78, '2016-11-02', '14:12:28');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (100, 1725.93, '2017-06-30', '8:54:18');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (47, 5491.67, '2016-11-05', '10:21:50');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (4, 4397.83, '2017-02-12', '12:39:42');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (54, 8969.92, '2017-07-12', '10:32:08');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (29, 2279.51, '2016-10-26', '21:46:25');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (29, 5346.76, '2017-01-05', '8:34:09');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (24, 8157.51, '2017-01-04', '21:04:17');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (97, 6752.54, '2017-06-28', '8:11:00');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (47, 9208.48, '2017-01-19', '10:31:37');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (87, 8378.65, '2016-10-14', '10:30:33');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (95, 2053.05, '2017-07-03', '21:38:56');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (11, 1686.81, '2017-02-14', '11:33:53');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (89, 8464.83, '2017-07-26', '17:40:07');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (9, 5744.25, '2017-08-15', '19:56:20');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (2, 3467.09, '2017-07-17', '16:39:49');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (58, 8806.77, '2017-07-17', '15:38:07');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (32, 5241.35, '2016-12-30', '14:54:00');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (78, 199.28, '2017-06-01', '14:29:02');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (27, 1508.08, '2016-11-30', '10:12:36');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (88, 7107.29, '2017-03-07', '13:21:38');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (38, 2613.43, '2017-06-14', '18:56:00');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (72, 3881.52, '2017-03-15', '20:55:52');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (14, 5107.9, '2017-03-01', '20:40:07');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (56, 8809.97, '2016-12-18', '16:39:12');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (73, 8340.29, '2016-09-18', '16:32:44');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (35, 988.32, '2016-11-05', '9:09:27');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (22, 8338.69, '2016-09-14', '15:41:57');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (71, 414.45, '2017-06-12', '12:32:33');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (8, 2943.26, '2017-02-10', '18:51:46');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (49, 5712.85, '2016-12-14', '14:51:46');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (33, 4380.15, '2016-11-01', '20:38:48');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (58, 5798.18, '2017-01-31', '14:39:30');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (17, 8089.05, '2017-01-21', '10:31:33');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (78, 6235.22, '2017-06-14', '16:36:36');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (86, 2391.34, '2016-09-20', '13:30:55');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (63, 5307.1, '2016-12-20', '14:43:39');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (100, 9754.77, '2016-12-20', '11:52:58');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (30, 7472.46, '2017-06-25', '13:17:58');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (78, 9657.46, '2016-12-20', '9:43:12');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (39, 218.12, '2017-04-21', '14:13:02');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (14, 8729.31, '2017-01-26', '15:42:55');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (84, 2023.41, '2017-05-04', '10:39:55');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (8, 7695.4, '2016-10-30', '18:03:42');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (32, 4451.18, '2017-04-17', '9:13:49');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (35, 7875.72, '2017-03-20', '21:35:21');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (50, 8688.31, '2016-08-29', '14:24:31');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (22, 9129.2, '2016-09-13', '19:49:12');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (6, 1475.17, '2017-02-19', '21:39:53');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (75, 6162.63, '2017-02-06', '21:28:59');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (17, 3747.97, '2016-10-05', '9:10:02');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (15, 4316.41, '2017-01-22', '19:45:29');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (46, 4618.84, '2017-08-16', '20:25:50');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (40, 6135.08, '2017-06-05', '14:05:42');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (68, 9573.93, '2017-08-20', '21:31:40');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (31, 1045.14, '2017-05-18', '10:07:20');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (26, 848.95, '2017-03-01', '18:55:50');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (66, 6036.83, '2016-09-27', '15:17:39');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (86, 4903.35, '2016-11-20', '11:17:10');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (19, 6803.55, '2016-09-09', '8:00:37');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (3, 2236.84, '2017-01-28', '12:01:54');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (55, 5282.49, '2017-07-03', '13:28:14');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (62, 6281.72, '2017-03-12', '21:06:07');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (19, 8442.49, '2017-07-31', '11:49:53');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (64, 1986.49, '2017-08-09', '21:33:28');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (55, 20.0, '2017-06-23', '10:38:33');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (2, 8337.07, '2016-10-18', '19:26:32');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (60, 5809.09, '2017-03-18', '9:30:46');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (10, 2096.88, '2017-04-29', '12:54:13');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (11, 9286.07, '2017-01-13', '19:19:31');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (58, 5328.18, '2017-05-15', '19:06:42');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (68, 4022.06, '2017-04-01', '16:42:02');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (97, 579.62, '2017-01-16', '20:17:45');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (84, 3659.18, '2016-11-15', '17:26:48');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (81, 8000.26, '2017-04-14', '10:37:49');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (86, 8191.24, '2016-11-10', '10:05:42');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (32, 805.16, '2017-01-25', '12:37:56');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (42, 4259.76, '2016-11-08', '14:49:08');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (34, 1069.97, '2017-08-02', '12:39:24');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (58, 2673.53, '2016-09-18', '21:16:57');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (18, 6607.87, '2017-04-17', '13:49:57');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (73, 4386.43, '2017-02-04', '17:59:28');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (68, 1140.04, '2017-07-09', '11:21:13');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (33, 7871.58, '2017-03-25', '14:57:52');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (19, 3570.89, '2017-01-09', '15:34:26');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (7, 6039.85, '2017-01-28', '8:47:53');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (13, 4458.4, '2017-03-08', '12:55:34');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (53, 6108.23, '2017-06-06', '16:42:57');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (61, 5120.56, '2016-11-20', '14:37:20');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (11, 1431.0, '2016-09-08', '9:36:38');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (52, 419.67, '2016-09-08', '8:33:40');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (38, 8473.67, '2016-12-28', '21:27:11');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (28, 8198.29, '2016-10-26', '18:51:51');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (22, 5353.15, '2017-06-28', '10:06:37');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (85, 2928.77, '2017-05-07', '19:16:53');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (74, 6856.75, '2017-02-20', '10:47:51');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (41, 254.67, '2017-06-24', '20:42:54');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (76, 5920.26, '2017-01-02', '16:30:51');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (51, 5648.77, '2016-12-31', '11:42:10');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (29, 1837.16, '2016-12-17', '17:07:32');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (91, 4223.58, '2017-01-10', '10:40:57');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (41, 4777.35, '2017-08-17', '12:19:31');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (44, 35.06, '2017-01-24', '17:59:53');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (31, 9010.27, '2017-05-06', '14:09:28');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (48, 7099.64, '2017-01-20', '17:51:18');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (18, 3272.99, '2017-06-20', '10:35:46');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (89, 1977.94, '2016-10-10', '13:26:24');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (90, 4971.08, '2017-06-15', '17:28:16');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (56, 8061.98, '2017-03-21', '16:37:56');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (60, 873.81, '2016-09-13', '11:26:25');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (95, 4954.13, '2017-07-13', '12:36:24');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (19, 1184.16, '2016-09-27', '11:44:06');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (90, 3470.01, '2017-06-03', '18:41:16');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (59, 9635.41, '2017-07-03', '16:59:24');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (53, 4411.85, '2016-10-23', '19:08:50');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (86, 6759.07, '2016-09-25', '13:25:43');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (63, 662.99, '2016-09-10', '8:30:07');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (64, 2492.41, '2016-09-25', '12:57:07');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (10, 1727.06, '2016-11-15', '20:19:38');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (50, 2739.23, '2016-10-05', '9:58:44');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (67, 9096.13, '2017-06-01', '9:27:00');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (34, 9483.37, '2017-03-01', '8:47:12');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (85, 7121.39, '2017-04-08', '19:23:00');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (55, 8439.19, '2017-01-27', '12:46:40');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (64, 5342.96, '2017-06-23', '8:33:04');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (35, 8003.16, '2017-05-08', '8:29:36');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (23, 1517.17, '2017-03-15', '17:33:22');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (35, 2755.33, '2016-12-20', '21:12:35');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (17, 9796.53, '2016-11-27', '14:26:58');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (72, 7971.47, '2017-03-01', '18:14:35');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (67, 6834.42, '2017-02-07', '15:23:32');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (93, 7263.33, '2017-04-23', '10:40:59');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (44, 542.5, '2016-11-10', '14:33:08');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (47, 5909.06, '2017-01-21', '18:06:52');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (17, 2818.71, '2017-07-26', '19:59:06');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (65, 6609.41, '2017-07-18', '12:48:14');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (92, 3445.33, '2017-08-22', '8:20:30');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (76, 2031.92, '2017-06-18', '9:07:08');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (43, 4363.27, '2017-01-29', '14:18:25');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (84, 5150.7, '2017-02-13', '14:51:27');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (3, 2553.89, '2016-10-22', '17:13:30');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (63, 7556.58, '2017-02-23', '13:10:24');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (63, 298.47, '2016-11-03', '9:21:42');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (34, 9258.61, '2017-02-27', '17:12:42');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (94, 720.07, '2017-01-09', '14:12:34');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (16, 6877.01, '2017-03-09', '9:54:39');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (78, 434.08, '2017-06-19', '9:11:23');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (19, 6877.9, '2017-03-20', '13:28:35');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (91, 4332.56, '2017-05-24', '12:45:29');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (57, 4501.21, '2017-06-17', '18:55:28');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (19, 8094.36, '2017-06-21', '21:04:11');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (76, 6383.85, '2017-07-11', '18:53:19');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (77, 940.63, '2017-06-02', '17:15:25');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (30, 9547.95, '2017-01-04', '11:42:31');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (52, 5661.22, '2016-09-19', '10:26:07');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (66, 3238.51, '2017-01-03', '8:24:09');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (95, 4053.23, '2017-05-22', '11:44:23');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (44, 6772.12, '2017-03-11', '19:46:05');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (10, 4768.95, '2016-12-27', '18:07:06');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (72, 8595.81, '2017-01-07', '20:04:01');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (35, 5372.92, '2017-04-01', '19:23:17');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (60, 8333.19, '2016-09-02', '9:41:33');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (5, 3340.46, '2017-08-08', '10:17:23');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (33, 2748.9, '2017-01-21', '14:25:36');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (16, 9520.17, '2017-07-06', '11:37:57');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (15, 1701.21, '2016-12-14', '16:46:14');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (32, 9138.3, '2017-01-25', '16:53:34');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (71, 7363.88, '2016-12-07', '10:20:47');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (84, 1357.72, '2017-08-21', '16:17:15');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (73, 4486.44, '2017-07-09', '13:54:54');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (94, 3155.35, '2017-07-11', '9:35:57');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (30, 4719.83, '2017-07-14', '16:39:49');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (98, 8174.32, '2017-05-26', '17:28:26');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (34, 6024.97, '2016-11-01', '8:38:26');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (76, 1886.54, '2017-06-21', '21:19:51');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (64, 2705.18, '2016-11-05', '15:16:08');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (17, 1141.36, '2017-02-15', '8:45:27');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (21, 5848.35, '2016-10-24', '10:21:13');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (71, 1814.46, '2017-02-05', '15:41:56');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (17, 7459.87, '2017-08-24', '10:08:03');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (51, 5382.49, '2017-03-10', '11:50:58');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (61, 8478.92, '2017-04-17', '11:07:24');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (84, 7739.47, '2017-05-15', '14:39:25');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (3, 3051.31, '2016-10-24', '19:52:01');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (26, 4730.69, '2017-05-09', '13:02:37');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (8, 4101.46, '2017-04-15', '15:15:05');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (9, 6478.03, '2017-06-26', '11:50:53');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (89, 97.98, '2017-05-11', '13:24:45');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (91, 3151.0, '2017-06-22', '15:15:59');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (90, 2961.74, '2016-11-30', '13:22:43');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (21, 3338.07, '2017-08-17', '12:57:05');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (38, 7899.88, '2017-07-08', '16:17:35');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (44, 9097.96, '2017-02-04', '9:09:57');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (12, 3700.3, '2017-04-05', '21:42:59');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (72, 9976.78, '2016-09-16', '20:22:40');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (63, 2861.84, '2016-10-07', '21:38:37');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (28, 4863.64, '2017-08-21', '21:21:49');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (38, 5102.76, '2017-01-13', '9:00:56');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (37, 2454.55, '2016-10-24', '21:57:07');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (47, 6771.23, '2016-11-22', '8:02:28');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (86, 2516.01, '2017-07-18', '16:24:51');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (24, 7580.41, '2017-08-24', '17:14:52');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (12, 1591.39, '2016-12-15', '10:25:59');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (43, 805.4, '2017-06-30', '15:59:39');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (5, 5221.74, '2017-03-18', '19:55:13');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (66, 7020.71, '2016-11-19', '17:01:11');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (25, 7652.35, '2017-06-27', '13:09:47');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (84, 4017.56, '2017-06-22', '9:40:27');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (23, 1510.75, '2017-01-25', '20:39:17');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (11, 6188.37, '2016-12-07', '9:05:52');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (15, 1145.61, '2017-01-22', '9:05:16');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (36, 5091.45, '2017-07-15', '18:43:53');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (3, 8538.22, '2017-06-28', '19:04:11');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (84, 6363.97, '2017-06-24', '14:20:51');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (88, 2152.15, '2017-08-09', '11:40:52');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (72, 3890.26, '2017-02-05', '9:50:33');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (40, 5105.24, '2016-12-07', '10:54:52');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (23, 8769.85, '2016-12-19', '17:30:48');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (2, 1294.49, '2017-06-10', '20:45:33');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (78, 1921.24, '2017-02-07', '9:40:54');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (35, 7706.42, '2017-06-04', '15:38:25');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (11, 4840.53, '2016-12-10', '15:45:53');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (99, 8805.85, '2017-01-10', '10:53:33');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (52, 6040.44, '2016-09-03', '12:53:14');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (35, 3949.8, '2017-04-04', '20:36:32');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (85, 9947.52, '2016-11-11', '12:47:17');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (14, 9615.2, '2016-12-02', '11:08:02');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (15, 9195.89, '2017-07-29', '20:17:38');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (99, 315.09, '2017-02-23', '17:26:27');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (64, 1480.21, '2017-07-07', '11:34:55');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (94, 9864.76, '2017-01-15', '12:09:22');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (47, 7923.25, '2017-03-23', '21:53:33');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (29, 589.86, '2017-07-19', '8:58:19');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (69, 3111.12, '2017-03-02', '20:54:28');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (72, 3751.32, '2016-12-06', '13:38:53');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (12, 4654.3, '2017-06-04', '18:05:46');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (44, 942.07, '2017-03-02', '9:06:04');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (18, 8655.29, '2017-05-30', '17:50:42');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (12, 5020.82, '2017-03-29', '14:30:34');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (38, 1521.53, '2016-10-26', '17:12:13');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (40, 276.44, '2017-04-17', '9:58:38');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (87, 2162.34, '2017-03-02', '15:19:21');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (62, 5875.03, '2017-02-17', '20:01:44');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (59, 1635.43, '2017-02-15', '21:46:34');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (10, 6379.0, '2017-05-02', '12:34:03');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (76, 2359.99, '2017-05-16', '18:47:10');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (26, 41.46, '2016-10-22', '21:53:35');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (24, 7661.72, '2017-03-22', '18:22:48');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (34, 5282.76, '2016-10-10', '15:48:03');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (37, 4591.46, '2017-01-04', '21:28:43');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (17, 7364.75, '2016-09-10', '9:00:45');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (84, 6549.14, '2017-02-07', '9:42:13');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (92, 4006.73, '2017-03-25', '17:07:20');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (86, 4852.74, '2017-01-13', '12:21:33');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (85, 4928.81, '2017-02-08', '13:09:31');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (93, 6127.93, '2017-04-21', '18:33:18');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (47, 3552.56, '2016-09-06', '9:50:00');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (33, 7324.82, '2017-07-01', '14:49:26');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (73, 5284.71, '2017-04-07', '16:30:31');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (32, 8787.91, '2016-12-03', '10:54:47');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (45, 1690.35, '2016-08-28', '10:59:57');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (64, 9061.8, '2017-08-23', '11:39:56');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (88, 2502.67, '2017-07-31', '17:01:17');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (17, 8672.35, '2017-03-04', '21:27:20');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (71, 6278.05, '2017-03-28', '12:44:16');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (68, 1906.17, '2017-01-01', '20:52:57');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (52, 5943.24, '2017-02-27', '10:44:30');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (43, 8271.39, '2016-12-19', '11:54:09');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (77, 1102.33, '2017-06-03', '21:06:28');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (96, 3515.33, '2016-09-01', '9:05:36');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (92, 2133.86, '2016-09-14', '15:04:59');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (83, 9353.25, '2017-05-10', '17:36:36');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (25, 7883.15, '2017-08-23', '15:40:08');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (23, 260.36, '2017-02-18', '20:19:41');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (78, 5351.82, '2016-09-25', '12:29:27');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (35, 9936.91, '2017-05-13', '13:10:48');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (11, 7727.86, '2017-08-01', '15:40:03');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (53, 5872.64, '2016-12-02', '13:57:03');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (43, 4268.36, '2016-11-23', '16:13:46');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (63, 1399.92, '2017-02-15', '20:12:23');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (77, 7238.74, '2017-07-31', '19:21:26');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (22, 5335.34, '2017-05-13', '21:50:48');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (44, 6285.51, '2016-10-06', '20:03:50');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (46, 4553.8, '2017-02-17', '14:05:20');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (53, 3766.44, '2017-01-22', '10:38:21');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (50, 6847.38, '2016-11-25', '13:29:40');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (41, 5692.06, '2017-04-17', '12:13:52');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (8, 9110.49, '2016-11-04', '14:37:06');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (90, 7535.15, '2017-04-14', '14:59:02');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (97, 6146.75, '2016-10-23', '19:00:29');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (43, 2606.98, '2016-10-08', '12:35:53');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (20, 645.1, '2017-04-02', '16:11:54');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (35, 5037.71, '2016-12-03', '17:50:44');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (76, 3796.19, '2016-12-15', '15:51:54');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (83, 9144.49, '2016-09-14', '8:02:51');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (3, 9226.71, '2017-05-15', '15:13:57');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (66, 294.95, '2016-09-16', '20:06:57');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (57, 293.71, '2017-07-09', '16:54:11');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (90, 409.89, '2017-01-05', '12:56:57');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (95, 1589.29, '2017-03-02', '9:21:22');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (54, 1493.11, '2016-10-05', '16:32:59');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (50, 1080.47, '2017-06-14', '13:56:15');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (24, 6273.49, '2016-10-29', '9:03:55');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (57, 6037.53, '2017-03-23', '8:48:01');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (36, 2944.34, '2017-02-04', '20:49:12');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (4, 7430.26, '2017-06-30', '13:13:03');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (72, 5480.22, '2017-01-27', '21:30:03');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (76, 3245.01, '2016-10-01', '13:22:49');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (95, 3394.32, '2017-05-01', '19:38:38');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (19, 3354.43, '2017-08-24', '12:16:39');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (14, 8294.62, '2017-04-27', '8:44:20');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (21, 9780.26, '2016-11-28', '19:28:00');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (86, 2779.77, '2016-10-05', '19:18:34');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (53, 3984.14, '2016-09-05', '9:32:20');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (16, 9045.96, '2016-10-21', '21:33:44');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (91, 63.7, '2017-04-23', '12:23:43');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (40, 8575.39, '2017-01-15', '11:06:29');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (30, 732.07, '2017-03-06', '11:39:12');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (41, 1220.21, '2016-10-15', '10:03:13');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (86, 1586.51, '2016-11-28', '12:06:57');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (35, 4725.54, '2016-11-19', '11:22:54');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (91, 3711.07, '2017-03-16', '9:41:26');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (91, 5408.29, '2016-10-22', '11:31:25');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (78, 771.18, '2017-05-07', '14:13:09');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (72, 5553.51, '2017-04-11', '19:42:11');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (25, 599.58, '2017-03-28', '17:13:01');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (5, 2589.05, '2017-04-28', '19:52:57');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (73, 1778.62, '2017-07-28', '10:24:14');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (54, 8357.89, '2017-08-15', '12:04:54');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (99, 9347.12, '2016-09-09', '9:27:54');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (51, 4478.45, '2017-07-23', '18:37:29');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (72, 9730.28, '2016-09-14', '17:17:25');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (48, 9990.92, '2017-03-14', '8:31:24');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (28, 3617.05, '2017-03-09', '15:57:28');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (50, 9941.87, '2016-09-10', '14:47:31');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (75, 6011.73, '2017-05-06', '12:39:18');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (58, 4892.76, '2016-11-08', '10:20:08');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (98, 485.31, '2017-04-04', '8:30:42');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (11, 6883.21, '2017-05-07', '13:09:17');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (34, 1728.27, '2017-04-17', '10:09:01');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (69, 118.09, '2017-02-26', '21:05:26');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (64, 6996.39, '2017-05-02', '8:12:15');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (80, 2491.44, '2016-09-01', '12:00:09');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (54, 3421.86, '2017-06-30', '17:19:57');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (37, 3945.63, '2016-12-02', '18:26:20');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (89, 557.06, '2016-10-07', '16:49:34');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (49, 4025.8, '2017-06-13', '21:58:02');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (10, 5990.65, '2017-03-21', '16:12:51');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (86, 5341.08, '2017-06-20', '16:01:41');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (62, 4534.99, '2017-07-31', '18:10:46');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (94, 7673.47, '2016-11-27', '13:04:46');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (67, 2390.67, '2017-05-29', '8:38:46');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (43, 7026.9, '2017-01-30', '10:07:35');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (101, 444.47, '2016-11-21', '18:17:56');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (75, 1923.07, '2016-10-20', '18:24:23');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (34, 5550.22, '2017-02-08', '10:47:58');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (56, 4100.07, '2016-11-04', '14:31:56');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (89, 4236.59, '2017-06-03', '11:04:32');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (23, 8622.39, '2017-03-21', '13:59:16');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (97, 6632.46, '2017-01-03', '15:40:14');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (68, 211.3, '2017-01-29', '8:52:01');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (28, 4930.23, '2016-10-20', '10:47:00');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (31, 7786.12, '2017-07-10', '14:57:34');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (46, 2065.86, '2017-03-07', '21:26:06');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (19, 7743.62, '2017-01-31', '10:25:40');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (38, 3080.62, '2016-12-10', '9:05:16');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (21, 7245.92, '2016-09-27', '8:23:19');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (9, 5919.37, '2017-03-24', '14:06:57');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (59, 1077.82, '2017-02-03', '14:08:52');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (76, 572.85, '2017-02-28', '15:16:17');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (66, 6241.75, '2016-11-07', '19:31:42');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (44, 9355.8, '2017-03-09', '18:03:40');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (100, 6365.7, '2017-05-31', '8:33:24');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (17, 382.62, '2017-05-17', '9:32:37');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (13, 3033.43, '2017-03-15', '16:46:50');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (6, 5928.76, '2016-10-24', '10:56:03');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (101, 4185.41, '2017-04-18', '12:04:46');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (91, 1871.53, '2017-02-17', '14:44:02');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (37, 2608.2, '2017-07-06', '11:05:55');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (31, 6087.39, '2017-05-14', '12:12:47');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (83, 3778.22, '2017-04-08', '17:08:45');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (43, 8103.09, '2017-08-16', '14:50:47');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (91, 2073.04, '2017-03-21', '11:53:14');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (34, 6071.71, '2016-12-02', '17:26:09');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (69, 9009.01, '2017-05-02', '12:32:31');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (90, 4089.9, '2017-03-25', '18:32:59');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (11, 7431.31, '2016-09-25', '18:23:46');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (74, 9796.83, '2017-03-25', '9:47:26');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (48, 8235.41, '2016-12-29', '19:35:10');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (101, 1406.47, '2016-11-18', '12:59:52');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (43, 9725.23, '2017-08-13', '9:53:14');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (100, 3388.96, '2017-05-11', '16:17:31');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (36, 4797.88, '2017-06-17', '12:01:33');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (8, 8236.29, '2017-03-08', '11:13:38');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (81, 2114.71, '2017-01-28', '10:51:53');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (18, 8615.98, '2017-06-13', '17:51:27');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (89, 26.42, '2017-04-08', '11:13:35');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (35, 3451.17, '2016-11-11', '13:37:10');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (83, 9434.87, '2016-11-21', '10:46:53');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (71, 513.75, '2016-10-26', '15:51:15');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (8, 8680.81, '2017-08-11', '8:50:35');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (54, 4501.31, '2017-06-19', '11:32:39');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (4, 9546.6, '2017-04-25', '9:50:12');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (21, 3293.84, '2017-03-20', '17:14:28');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (76, 7836.6, '2017-01-10', '21:47:36');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (14, 8855.03, '2017-02-07', '20:05:00');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (82, 7334.73, '2017-03-19', '9:04:12');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (37, 8728.52, '2016-09-04', '15:04:00');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (23, 6840.14, '2017-01-19', '21:54:40');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (92, 5175.58, '2017-05-25', '16:30:49');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (62, 3143.35, '2016-09-17', '21:39:40');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (98, 5062.32, '2017-08-04', '9:30:53');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (101, 6555.34, '2016-09-26', '12:20:22');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (52, 1250.52, '2016-10-08', '10:31:28');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (23, 1685.04, '2016-10-26', '12:28:28');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (48, 9263.09, '2016-10-26', '15:57:32');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (92, 2375.64, '2017-01-03', '10:21:35');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (17, 3804.63, '2017-03-09', '8:33:14');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (93, 9179.37, '2016-09-08', '20:42:38');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (99, 2515.22, '2016-10-19', '17:28:38');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (51, 3558.11, '2017-01-22', '9:01:18');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (79, 2175.39, '2016-12-30', '8:59:50');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (59, 7724.15, '2017-03-11', '16:02:46');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (36, 9066.99, '2016-09-30', '21:00:01');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (67, 6920.39, '2017-07-10', '14:39:11');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (92, 2128.04, '2017-05-08', '10:47:04');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (46, 3146.75, '2016-10-07', '14:51:40');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (72, 834.01, '2017-07-29', '10:28:41');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (80, 1236.31, '2017-01-04', '10:54:03');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (17, 8455.79, '2017-07-18', '8:37:24');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (52, 5760.04, '2016-11-30', '19:25:04');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (4, 5743.11, '2017-08-21', '11:35:37');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (17, 888.48, '2017-02-02', '21:35:39');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (52, 4826.16, '2016-12-20', '10:33:37');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (38, 7800.73, '2017-08-21', '11:20:10');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (95, 3806.42, '2017-06-06', '9:44:54');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (99, 2512.97, '2016-11-24', '18:45:55');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (77, 8625.27, '2016-12-02', '10:46:13');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (91, 1418.13, '2016-09-29', '17:27:15');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (100, 5794.9, '2016-10-04', '18:56:37');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (98, 5628.18, '2017-03-04', '13:31:27');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (33, 6062.39, '2017-04-05', '13:58:01');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (7, 9061.98, '2017-07-10', '14:18:03');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (20, 5317.65, '2016-09-04', '18:37:44');
insert into OrdenCompra (IdProveedor, TotalCompra, Fecha, Hora) values (55, 3081.13, '2017-01-07', '12:04:16');

insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (395, 70, 1.26, 53);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (198, 98, 2.82, 90);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (293, 43, 8.17, 46);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (308, 31, 2.23, 85);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (144, 16, 3.55, 52);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (497, 60, 8.02, 43);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (245, 2, 1.47, 79);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (244, 58, 1.16, 51);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (80, 70, 7.04, 98);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (182, 42, 5.54, 17);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (381, 20, 8.11, 42);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (295, 89, 9.61, 99);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (414, 33, 1.21, 60);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (487, 66, 2.47, 53);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (361, 8, 7.68, 14);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (273, 40, 5.34, 75);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (356, 66, 2.22, 25);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (466, 14, 1.1, 15);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (101, 77, 2.06, 75);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (65, 77, 5.26, 25);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (327, 16, 8.44, 53);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (257, 11, 4.42, 44);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (153, 44, 5.35, 35);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (152, 25, 1.77, 46);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (96, 20, 9.45, 68);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (465, 82, 1.54, 31);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (151, 98, 7.55, 20);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (381, 5, 8.37, 6);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (441, 58, 8.71, 71);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (145, 73, 8.28, 59);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (281, 71, 6.78, 45);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (15, 17, 4.63, 50);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (70, 101, 1.23, 88);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (10, 36, 5.12, 20);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (59, 65, 6.59, 6);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (321, 100, 4.56, 53);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (157, 24, 4.23, 91);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (446, 43, 2.56, 100);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (225, 39, 8.24, 12);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (145, 78, 5.74, 86);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (454, 62, 6.45, 79);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (242, 5, 9.54, 3);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (173, 100, 4.59, 48);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (143, 82, 4.3, 47);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (314, 63, 1.56, 82);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (493, 54, 7.41, 99);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (358, 4, 4.57, 73);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (268, 34, 5.94, 10);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (310, 28, 6.23, 2);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (292, 10, 9.36, 76);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (20, 64, 9.29, 12);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (24, 22, 5.34, 8);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (7, 68, 5.41, 84);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (109, 4, 5.69, 77);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (19, 84, 4.52, 10);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (42, 42, 1.39, 85);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (42, 98, 6.74, 2);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (108, 65, 7.32, 99);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (238, 6, 9.77, 80);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (398, 90, 8.43, 40);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (78, 30, 4.15, 27);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (85, 94, 5.32, 26);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (379, 85, 2.88, 25);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (297, 82, 4.18, 100);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (140, 8, 1.3, 55);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (63, 46, 3.97, 76);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (42, 45, 6.26, 39);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (153, 54, 5.78, 93);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (472, 70, 9.56, 39);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (34, 3, 5.73, 81);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (404, 65, 6.47, 40);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (336, 59, 3.57, 40);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (286, 17, 7.65, 65);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (300, 101, 9.77, 93);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (500, 2, 8.49, 6);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (235, 89, 2.22, 85);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (427, 13, 1.84, 1);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (267, 61, 2.7, 82);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (213, 47, 2.42, 61);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (396, 36, 3.19, 88);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (134, 64, 1.51, 31);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (443, 20, 1.21, 96);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (153, 55, 3.22, 39);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (135, 100, 2.62, 59);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (48, 83, 7.5, 64);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (465, 62, 4.58, 66);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (88, 43, 8.76, 55);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (155, 39, 4.59, 79);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (18, 53, 4.52, 35);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (351, 18, 4.65, 21);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (92, 66, 9.78, 10);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (129, 62, 2.08, 67);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (164, 39, 6.22, 79);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (242, 54, 4.12, 30);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (107, 66, 5.99, 51);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (22, 64, 3.49, 80);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (454, 10, 3.58, 50);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (200, 2, 3.74, 96);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (54, 93, 1.2, 94);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (464, 75, 8.79, 68);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (124, 74, 7.01, 100);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (106, 99, 1.74, 67);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (317, 23, 9.71, 89);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (376, 60, 9.56, 80);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (390, 36, 4.07, 14);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (171, 80, 4.4, 86);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (203, 97, 6.11, 24);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (57, 66, 5.37, 5);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (335, 36, 1.63, 61);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (91, 57, 8.04, 100);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (119, 61, 7.63, 9);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (103, 99, 5.24, 40);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (129, 68, 2.73, 100);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (309, 92, 4.51, 53);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (439, 60, 7.02, 55);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (473, 46, 6.13, 26);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (156, 2, 8.42, 79);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (407, 46, 1.02, 29);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (362, 10, 7.03, 27);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (79, 22, 4.1, 17);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (154, 38, 6.79, 18);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (342, 36, 1.38, 33);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (208, 68, 2.45, 7);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (2, 4, 3.02, 47);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (27, 40, 5.88, 56);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (96, 26, 7.53, 91);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (314, 101, 5.37, 87);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (107, 36, 1.29, 4);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (447, 27, 4.36, 92);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (282, 88, 3.88, 66);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (159, 58, 4.8, 64);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (284, 83, 3.48, 97);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (194, 96, 2.32, 61);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (148, 68, 1.79, 94);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (39, 43, 9.63, 60);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (302, 31, 7.27, 89);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (485, 53, 9.44, 40);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (136, 15, 7.79, 61);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (464, 83, 1.33, 15);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (72, 49, 4.32, 92);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (364, 42, 7.76, 53);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (356, 48, 8.11, 90);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (401, 73, 9.99, 10);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (159, 76, 3.76, 58);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (11, 25, 4.72, 16);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (382, 59, 1.9, 50);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (123, 25, 1.95, 21);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (214, 72, 7.41, 85);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (81, 14, 3.88, 87);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (158, 16, 5.02, 53);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (203, 81, 9.33, 68);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (413, 93, 6.7, 14);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (365, 65, 5.15, 98);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (415, 81, 8.72, 70);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (472, 45, 5.47, 24);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (365, 58, 1.89, 16);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (283, 4, 6.31, 39);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (354, 15, 3.06, 34);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (416, 74, 6.86, 33);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (26, 25, 1.42, 31);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (245, 36, 2.05, 35);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (37, 40, 4.55, 62);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (395, 10, 5.4, 51);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (273, 76, 5.5, 22);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (162, 32, 6.32, 2);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (388, 15, 7.53, 84);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (53, 49, 5.67, 55);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (164, 67, 2.74, 79);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (268, 21, 9.02, 69);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (443, 98, 7.71, 38);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (22, 16, 8.88, 56);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (349, 89, 4.47, 24);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (383, 10, 2.85, 77);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (320, 11, 9.19, 33);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (456, 80, 2.9, 75);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (293, 89, 5.52, 8);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (158, 3, 6.97, 90);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (258, 7, 9.86, 89);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (150, 72, 4.39, 71);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (340, 45, 4.1, 19);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (434, 98, 7.34, 13);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (149, 57, 8.3, 75);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (82, 23, 1.52, 80);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (477, 10, 5.9, 6);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (470, 70, 5.52, 5);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (43, 80, 7.9, 35);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (430, 77, 2.78, 58);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (202, 99, 5.06, 99);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (454, 19, 5.35, 34);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (152, 58, 9.39, 9);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (41, 16, 6.76, 70);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (308, 75, 5.18, 44);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (109, 27, 6.27, 6);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (142, 30, 6.63, 18);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (239, 5, 8.02, 72);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (150, 34, 5.09, 98);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (250, 31, 3.51, 62);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (472, 76, 1.83, 73);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (312, 57, 3.56, 15);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (195, 72, 2.44, 51);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (298, 75, 4.73, 11);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (299, 68, 9.91, 11);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (41, 31, 2.7, 53);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (78, 5, 6.33, 30);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (417, 9, 9.72, 45);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (359, 40, 4.2, 89);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (223, 67, 2.75, 97);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (314, 64, 7.4, 6);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (406, 42, 4.56, 64);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (318, 27, 3.53, 24);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (473, 36, 9.24, 27);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (397, 58, 1.63, 74);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (348, 59, 5.08, 98);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (412, 89, 6.4, 14);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (100, 2, 7.71, 100);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (258, 23, 8.97, 79);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (362, 54, 9.95, 83);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (328, 38, 3.03, 3);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (463, 87, 4.07, 68);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (103, 8, 5.3, 29);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (85, 94, 4.97, 65);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (96, 32, 5.64, 53);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (48, 66, 8.01, 33);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (142, 30, 5.48, 74);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (335, 60, 1.0, 98);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (296, 56, 7.67, 74);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (75, 36, 7.51, 14);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (327, 30, 1.8, 42);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (250, 50, 6.95, 61);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (162, 5, 3.34, 15);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (79, 68, 1.88, 75);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (441, 96, 8.86, 73);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (463, 24, 1.3, 93);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (303, 82, 6.83, 16);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (487, 20, 4.5, 89);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (448, 26, 3.69, 20);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (67, 62, 7.97, 86);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (31, 67, 6.86, 44);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (343, 100, 6.89, 39);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (38, 15, 3.62, 75);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (68, 40, 3.51, 56);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (416, 42, 1.95, 88);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (151, 91, 6.13, 65);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (286, 13, 5.61, 5);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (151, 18, 1.44, 30);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (463, 30, 5.25, 16);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (279, 74, 8.79, 47);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (407, 90, 9.83, 37);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (154, 75, 9.94, 80);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (276, 35, 4.82, 84);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (11, 8, 1.12, 60);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (216, 78, 2.33, 20);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (12, 66, 9.88, 68);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (291, 12, 5.42, 48);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (246, 21, 6.83, 88);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (246, 5, 6.78, 31);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (210, 99, 9.86, 52);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (337, 22, 4.68, 97);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (259, 80, 7.11, 61);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (426, 89, 6.84, 18);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (273, 98, 2.43, 99);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (120, 66, 3.61, 41);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (134, 101, 4.33, 73);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (189, 78, 5.84, 85);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (238, 18, 4.53, 78);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (34, 21, 1.07, 64);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (392, 55, 3.07, 55);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (36, 17, 1.04, 43);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (158, 24, 7.25, 80);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (12, 96, 8.9, 29);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (292, 37, 1.1, 87);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (489, 22, 3.53, 31);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (85, 82, 8.9, 31);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (327, 13, 7.1, 5);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (290, 23, 5.2, 11);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (280, 81, 9.0, 72);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (197, 81, 2.16, 88);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (432, 4, 2.85, 90);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (299, 52, 5.68, 3);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (238, 39, 3.26, 7);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (167, 12, 3.77, 51);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (495, 26, 6.21, 71);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (13, 75, 7.28, 12);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (499, 89, 7.15, 99);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (256, 93, 2.03, 33);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (421, 18, 3.71, 61);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (428, 34, 3.23, 58);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (338, 71, 5.95, 67);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (182, 26, 5.12, 85);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (413, 74, 1.87, 19);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (234, 82, 5.98, 19);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (322, 35, 8.17, 17);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (38, 82, 9.66, 92);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (210, 25, 4.59, 27);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (230, 50, 7.21, 81);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (204, 30, 8.9, 18);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (223, 100, 3.03, 37);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (433, 50, 8.3, 78);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (166, 66, 3.78, 30);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (91, 12, 3.42, 18);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (356, 78, 2.83, 85);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (163, 74, 5.5, 59);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (347, 30, 3.65, 70);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (87, 36, 5.32, 67);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (73, 94, 8.88, 47);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (20, 16, 2.38, 25);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (243, 72, 8.11, 92);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (163, 78, 5.28, 17);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (144, 38, 3.59, 5);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (5, 37, 2.92, 98);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (141, 101, 4.79, 44);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (53, 97, 4.1, 3);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (27, 22, 7.02, 34);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (156, 57, 1.62, 2);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (59, 80, 2.13, 43);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (75, 43, 3.12, 2);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (55, 22, 9.74, 37);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (156, 22, 7.94, 29);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (91, 36, 6.01, 28);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (221, 25, 9.39, 73);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (40, 6, 4.7, 63);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (375, 57, 2.15, 96);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (79, 40, 1.8, 85);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (444, 50, 4.24, 30);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (61, 17, 7.28, 27);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (495, 13, 4.33, 16);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (370, 35, 7.93, 35);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (466, 57, 9.74, 31);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (242, 2, 7.08, 93);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (12, 74, 2.65, 31);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (41, 4, 8.71, 29);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (461, 46, 5.98, 75);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (34, 9, 7.22, 23);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (472, 34, 8.76, 57);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (180, 43, 7.56, 19);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (382, 68, 1.79, 5);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (390, 66, 8.29, 3);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (383, 62, 7.32, 3);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (48, 43, 9.84, 85);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (257, 18, 5.48, 98);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (176, 67, 8.69, 82);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (17, 100, 6.93, 65);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (15, 31, 4.61, 52);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (422, 40, 3.69, 27);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (336, 81, 4.33, 98);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (414, 43, 5.11, 72);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (419, 45, 6.43, 3);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (156, 91, 9.29, 67);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (450, 85, 1.4, 99);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (217, 35, 1.06, 37);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (487, 73, 2.37, 71);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (55, 18, 5.43, 57);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (217, 22, 6.46, 95);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (493, 63, 6.47, 24);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (259, 15, 9.96, 24);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (295, 92, 1.28, 67);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (195, 20, 4.31, 73);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (176, 42, 6.56, 23);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (8, 65, 1.26, 69);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (240, 39, 2.1, 82);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (142, 74, 8.02, 49);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (215, 26, 1.23, 7);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (28, 28, 8.24, 30);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (106, 11, 3.71, 59);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (224, 24, 5.7, 58);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (261, 21, 8.01, 70);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (480, 44, 5.65, 17);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (363, 10, 1.7, 87);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (461, 57, 9.86, 37);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (85, 82, 1.12, 38);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (378, 75, 4.24, 33);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (406, 36, 9.51, 81);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (358, 50, 8.13, 84);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (413, 6, 4.19, 31);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (294, 30, 1.93, 31);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (161, 49, 2.11, 83);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (480, 17, 9.87, 88);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (127, 99, 7.64, 66);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (224, 70, 3.83, 89);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (119, 37, 5.15, 30);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (410, 58, 4.38, 40);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (181, 58, 1.59, 52);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (98, 39, 2.51, 39);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (231, 7, 1.45, 24);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (35, 53, 2.38, 82);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (174, 96, 3.43, 35);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (156, 64, 2.87, 1);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (135, 94, 7.4, 20);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (235, 21, 6.69, 74);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (440, 95, 6.77, 31);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (21, 75, 2.05, 33);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (222, 21, 3.99, 33);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (286, 66, 4.22, 49);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (204, 87, 8.34, 94);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (413, 49, 7.41, 5);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (409, 5, 1.89, 15);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (23, 101, 1.58, 3);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (138, 54, 4.99, 10);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (491, 81, 9.18, 77);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (202, 82, 3.95, 51);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (259, 59, 3.71, 55);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (457, 81, 5.14, 86);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (257, 93, 9.02, 30);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (351, 13, 7.57, 24);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (396, 20, 8.38, 46);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (245, 99, 4.62, 8);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (27, 73, 1.02, 63);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (226, 96, 1.14, 50);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (338, 80, 6.11, 78);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (313, 77, 8.83, 27);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (448, 93, 7.81, 27);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (497, 98, 6.14, 50);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (336, 19, 7.46, 33);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (256, 15, 5.47, 95);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (416, 45, 3.57, 92);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (29, 27, 3.38, 25);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (367, 95, 6.29, 31);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (230, 72, 2.0, 59);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (218, 12, 6.07, 2);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (278, 91, 9.65, 100);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (107, 47, 2.97, 13);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (47, 74, 3.42, 80);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (243, 37, 4.81, 28);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (140, 70, 8.26, 39);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (236, 17, 8.95, 45);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (482, 94, 4.66, 64);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (239, 90, 6.07, 57);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (212, 23, 1.24, 53);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (243, 13, 9.12, 92);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (45, 44, 3.42, 28);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (12, 50, 8.38, 79);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (123, 27, 6.86, 47);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (395, 65, 6.22, 1);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (305, 18, 9.37, 32);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (199, 67, 9.6, 41);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (225, 56, 2.08, 7);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (416, 28, 3.94, 32);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (146, 33, 4.85, 76);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (298, 85, 3.45, 88);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (483, 9, 2.38, 46);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (152, 58, 2.13, 81);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (365, 68, 6.83, 87);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (248, 66, 6.72, 34);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (412, 42, 4.81, 54);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (194, 20, 3.01, 63);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (329, 16, 8.23, 12);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (417, 4, 8.26, 71);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (215, 13, 4.37, 67);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (177, 50, 9.52, 38);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (382, 8, 5.96, 76);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (274, 71, 1.98, 63);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (345, 22, 1.33, 44);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (147, 64, 7.57, 15);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (289, 5, 7.58, 22);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (440, 25, 6.02, 68);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (82, 62, 1.9, 56);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (233, 81, 2.74, 13);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (424, 7, 4.99, 70);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (358, 62, 1.07, 100);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (218, 91, 6.25, 5);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (154, 10, 7.45, 8);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (140, 83, 9.48, 2);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (323, 39, 9.51, 71);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (415, 75, 2.49, 3);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (247, 37, 7.53, 74);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (494, 51, 7.09, 95);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (451, 71, 3.95, 27);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (38, 87, 4.34, 32);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (415, 78, 9.21, 71);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (79, 90, 5.69, 17);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (329, 82, 5.54, 91);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (77, 54, 5.42, 97);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (445, 86, 9.96, 71);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (211, 81, 8.64, 31);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (391, 79, 4.65, 30);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (184, 12, 7.49, 73);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (169, 63, 6.9, 72);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (365, 67, 9.37, 5);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (55, 94, 8.75, 60);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (34, 11, 9.22, 6);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (295, 79, 1.51, 88);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (271, 40, 9.1, 73);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (316, 49, 7.71, 38);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (182, 17, 1.13, 33);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (474, 86, 9.67, 41);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (30, 100, 8.64, 52);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (79, 87, 6.53, 46);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (2, 74, 8.61, 63);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (405, 78, 8.19, 46);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (315, 47, 7.11, 20);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (392, 71, 1.55, 63);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (89, 99, 3.06, 69);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (350, 53, 3.37, 56);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (246, 89, 2.66, 83);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (52, 16, 1.8, 64);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (288, 64, 7.82, 71);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (471, 76, 4.87, 77);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (103, 52, 3.8, 72);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (167, 42, 1.7, 23);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (195, 80, 1.25, 2);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (252, 79, 3.86, 46);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (455, 90, 2.27, 27);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (380, 94, 4.52, 25);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (345, 3, 1.88, 35);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (82, 69, 3.71, 82);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (73, 52, 9.22, 10);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (51, 64, 7.64, 84);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (443, 29, 1.05, 24);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (246, 81, 9.63, 49);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (235, 46, 9.63, 16);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (365, 77, 8.11, 10);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (68, 49, 8.99, 57);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (394, 66, 8.27, 6);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (113, 39, 4.45, 29);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (83, 34, 4.18, 21);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (287, 29, 4.6, 28);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (62, 86, 4.57, 2);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (270, 10, 7.46, 15);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (249, 91, 9.57, 25);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (205, 57, 2.39, 66);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (263, 28, 3.69, 74);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (368, 14, 1.31, 50);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (450, 32, 4.53, 9);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (472, 40, 4.55, 75);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (385, 98, 3.59, 94);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (7, 47, 2.55, 77);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (194, 32, 2.62, 76);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (14, 74, 2.56, 75);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (479, 47, 3.59, 61);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (32, 2, 9.38, 6);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (340, 87, 6.85, 57);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (407, 91, 7.9, 20);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (250, 77, 3.53, 91);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (100, 78, 9.08, 45);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (338, 66, 6.22, 68);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (118, 94, 9.56, 92);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (67, 63, 3.25, 77);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (244, 43, 7.5, 62);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (356, 78, 7.75, 26);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (483, 92, 8.72, 56);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (124, 35, 2.38, 69);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (31, 34, 6.4, 91);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (33, 22, 7.35, 99);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (96, 100, 3.87, 1);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (309, 57, 3.09, 93);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (436, 83, 8.73, 81);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (15, 83, 7.15, 80);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (305, 7, 3.39, 10);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (439, 97, 5.78, 17);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (59, 92, 4.3, 1);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (432, 67, 1.81, 72);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (416, 99, 9.94, 53);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (19, 56, 2.21, 47);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (12, 46, 2.39, 51);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (414, 28, 3.24, 37);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (96, 13, 2.18, 66);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (58, 8, 6.38, 88);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (321, 97, 2.21, 53);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (352, 32, 3.65, 57);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (338, 67, 8.74, 93);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (2, 36, 1.19, 18);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (269, 64, 5.62, 50);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (317, 94, 2.26, 34);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (284, 22, 3.84, 62);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (80, 25, 6.97, 34);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (64, 42, 6.91, 46);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (432, 69, 2.89, 38);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (28, 27, 9.2, 51);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (181, 71, 1.83, 13);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (19, 87, 4.35, 7);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (288, 79, 3.56, 15);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (269, 13, 8.17, 35);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (454, 38, 9.8, 90);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (3, 74, 4.17, 83);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (192, 14, 7.95, 72);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (46, 57, 5.68, 64);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (351, 77, 2.84, 47);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (335, 18, 1.2, 96);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (337, 18, 5.81, 49);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (370, 52, 4.41, 88);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (461, 96, 2.15, 9);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (440, 87, 4.51, 77);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (236, 44, 7.31, 49);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (286, 10, 7.19, 46);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (16, 97, 4.16, 96);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (184, 60, 1.75, 44);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (241, 10, 6.06, 62);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (432, 85, 3.26, 13);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (305, 74, 1.92, 55);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (193, 100, 7.09, 69);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (305, 35, 7.24, 65);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (436, 66, 8.03, 33);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (40, 14, 3.6, 76);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (304, 44, 2.92, 62);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (482, 32, 3.19, 59);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (373, 75, 1.46, 17);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (116, 80, 3.55, 34);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (176, 55, 5.92, 4);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (425, 57, 5.67, 65);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (225, 71, 7.47, 26);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (452, 96, 7.47, 6);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (445, 30, 6.81, 38);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (313, 58, 1.75, 15);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (15, 79, 5.93, 51);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (206, 99, 3.73, 6);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (234, 99, 6.84, 27);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (306, 73, 5.99, 11);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (376, 92, 7.83, 23);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (303, 100, 5.57, 79);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (127, 31, 2.3, 86);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (195, 73, 9.4, 38);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (68, 56, 6.71, 98);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (282, 78, 9.73, 67);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (486, 13, 2.13, 78);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (71, 53, 1.01, 41);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (231, 17, 1.89, 52);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (264, 47, 5.85, 70);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (473, 8, 4.95, 4);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (332, 97, 2.94, 17);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (389, 66, 3.69, 33);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (334, 69, 2.0, 39);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (386, 24, 5.63, 8);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (179, 18, 9.97, 52);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (239, 39, 3.13, 30);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (301, 94, 9.02, 85);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (18, 50, 8.88, 28);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (105, 64, 8.95, 66);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (339, 54, 9.91, 27);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (82, 21, 9.28, 6);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (198, 12, 8.5, 47);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (204, 6, 5.37, 15);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (304, 84, 8.77, 52);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (312, 38, 2.14, 17);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (80, 41, 1.68, 47);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (234, 55, 8.27, 81);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (337, 66, 9.06, 32);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (432, 14, 2.41, 87);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (416, 62, 1.32, 67);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (396, 47, 6.32, 40);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (237, 77, 3.96, 39);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (416, 75, 3.19, 68);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (3, 25, 1.74, 72);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (80, 15, 4.8, 31);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (11, 96, 8.59, 93);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (449, 39, 5.2, 6);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (242, 10, 9.08, 21);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (425, 57, 6.75, 42);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (202, 42, 3.77, 86);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (365, 42, 1.21, 16);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (438, 83, 3.45, 24);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (392, 77, 1.73, 12);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (128, 48, 5.2, 70);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (161, 12, 5.72, 47);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (235, 62, 9.94, 46);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (79, 68, 6.49, 7);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (72, 33, 6.76, 4);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (92, 38, 8.02, 30);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (161, 9, 3.06, 12);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (397, 70, 7.89, 95);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (351, 91, 2.04, 52);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (13, 79, 2.86, 87);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (144, 16, 3.89, 91);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (416, 35, 6.06, 66);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (487, 22, 1.06, 99);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (406, 17, 6.22, 94);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (330, 67, 3.97, 37);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (403, 23, 2.03, 2);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (455, 94, 6.42, 14);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (396, 76, 9.55, 85);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (40, 50, 4.95, 51);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (392, 31, 1.4, 84);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (123, 12, 9.61, 88);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (474, 49, 7.19, 49);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (182, 57, 7.26, 5);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (319, 85, 8.56, 3);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (407, 65, 4.24, 67);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (288, 85, 1.52, 50);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (278, 70, 5.58, 22);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (152, 44, 9.1, 56);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (63, 31, 1.14, 38);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (117, 18, 7.46, 40);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (227, 18, 6.44, 15);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (448, 77, 6.04, 1);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (258, 71, 6.57, 82);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (351, 100, 2.6, 99);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (355, 53, 8.04, 7);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (392, 43, 4.32, 9);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (208, 96, 3.87, 27);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (197, 50, 3.65, 16);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (97, 87, 8.85, 14);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (65, 61, 5.58, 50);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (356, 14, 5.34, 73);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (153, 40, 5.1, 99);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (357, 56, 9.38, 39);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (156, 51, 8.47, 27);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (37, 24, 4.08, 65);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (381, 84, 6.09, 27);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (219, 37, 5.4, 41);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (213, 26, 6.55, 45);
insert into DetalleCompra (IdOrdenCompra, IdProducto, Precio, Cantidad) values (379, 95, 5.99, 24);

insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (139, 10, 3.43, 56);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (142, 47, 8.19, 88);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (31, 97, 1.08, 97);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (188, 9, 8.97, 21);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (12, 17, 8.1, 57);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (169, 20, 4.04, 7);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (174, 58, 5.99, 51);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (8, 95, 7.86, 51);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (5, 75, 2.04, 59);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (162, 26, 6.15, 30);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (26, 56, 6.72, 24);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (87, 60, 7.81, 63);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (102, 90, 9.94, 88);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (158, 32, 6.15, 64);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (182, 5, 7.23, 43);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (191, 17, 2.79, 95);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (16, 31, 6.34, 26);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (126, 36, 7.29, 31);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (171, 42, 8.74, 4);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (5, 33, 2.63, 39);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (142, 17, 5.9, 95);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (80, 95, 9.5, 100);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (34, 93, 8.4, 45);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (166, 53, 5.33, 88);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (47, 27, 5.09, 79);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (69, 82, 1.8, 69);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (130, 66, 3.29, 51);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (119, 88, 2.1, 43);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (60, 37, 9.49, 87);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (176, 51, 8.07, 23);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (129, 36, 5.01, 47);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (124, 25, 5.27, 82);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (76, 98, 4.08, 33);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (59, 73, 7.86, 19);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (63, 88, 2.72, 48);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (138, 91, 3.19, 53);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (33, 49, 9.63, 51);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (36, 21, 2.14, 38);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (76, 5, 5.12, 37);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (61, 3, 7.24, 19);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (121, 74, 2.74, 85);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (84, 72, 2.33, 74);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (22, 62, 1.18, 8);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (133, 31, 4.54, 36);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (67, 100, 8.03, 50);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (44, 75, 9.98, 47);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (182, 33, 9.6, 35);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (37, 60, 5.16, 29);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (110, 84, 4.52, 56);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (136, 67, 7.53, 100);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (16, 71, 5.48, 89);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (148, 70, 5.47, 76);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (55, 52, 7.74, 43);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (84, 9, 4.59, 40);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (62, 27, 5.19, 1);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (186, 4, 4.74, 85);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (142, 5, 6.82, 60);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (98, 5, 1.78, 96);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (1, 63, 7.77, 9);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (43, 61, 4.49, 41);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (176, 79, 5.56, 48);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (181, 64, 2.4, 55);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (198, 63, 9.96, 67);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (120, 80, 1.55, 94);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (97, 33, 9.54, 77);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (188, 84, 4.1, 91);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (20, 34, 8.83, 4);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (155, 35, 8.5, 97);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (146, 63, 6.72, 63);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (181, 34, 9.06, 42);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (188, 53, 1.42, 20);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (73, 54, 9.97, 52);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (15, 45, 3.61, 96);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (133, 17, 3.68, 100);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (84, 51, 7.09, 95);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (71, 9, 2.17, 27);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (104, 74, 9.35, 20);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (70, 76, 3.66, 46);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (137, 79, 8.18, 46);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (98, 48, 7.22, 8);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (189, 41, 4.57, 60);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (180, 62, 8.18, 3);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (121, 55, 3.55, 1);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (36, 49, 5.35, 34);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (5, 61, 4.19, 75);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (74, 41, 3.99, 76);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (132, 33, 7.66, 83);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (13, 98, 4.19, 69);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (193, 14, 6.34, 43);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (196, 95, 7.61, 48);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (45, 35, 5.88, 63);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (55, 29, 7.49, 91);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (128, 8, 9.88, 2);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (81, 63, 1.35, 48);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (135, 34, 8.26, 61);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (118, 75, 8.73, 31);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (108, 38, 9.33, 28);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (106, 61, 3.17, 99);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (38, 30, 7.38, 1);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (152, 9, 4.69, 16);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (11, 100, 3.03, 15);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (144, 79, 8.27, 1);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (172, 27, 9.05, 66);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (191, 28, 5.05, 60);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (139, 39, 1.67, 93);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (197, 33, 7.32, 69);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (73, 22, 3.78, 46);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (84, 70, 2.07, 98);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (5, 53, 8.25, 80);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (60, 89, 9.74, 80);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (190, 53, 9.52, 31);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (82, 7, 3.68, 44);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (160, 72, 1.99, 5);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (60, 77, 3.17, 75);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (46, 77, 1.12, 83);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (92, 24, 8.75, 42);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (128, 40, 2.17, 21);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (60, 40, 1.6, 52);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (129, 71, 1.09, 48);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (140, 28, 2.96, 28);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (137, 57, 7.34, 49);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (186, 77, 7.32, 69);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (37, 43, 8.09, 83);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (42, 23, 7.21, 9);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (185, 49, 7.8, 16);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (75, 57, 3.87, 39);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (185, 84, 6.93, 53);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (183, 10, 9.0, 25);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (70, 94, 8.28, 29);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (70, 23, 3.8, 52);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (73, 100, 9.89, 15);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (63, 89, 6.56, 80);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (145, 69, 9.54, 73);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (61, 12, 1.69, 37);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (186, 3, 5.05, 7);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (76, 81, 6.65, 83);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (6, 16, 6.06, 94);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (22, 2, 2.3, 63);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (107, 86, 5.66, 62);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (58, 50, 5.62, 67);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (161, 43, 3.99, 5);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (38, 28, 8.56, 42);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (32, 56, 7.36, 51);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (200, 93, 2.95, 98);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (73, 78, 3.1, 17);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (66, 38, 5.58, 38);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (159, 14, 8.45, 56);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (63, 94, 5.96, 20);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (154, 81, 6.42, 83);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (89, 29, 7.7, 78);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (4, 35, 4.11, 15);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (65, 91, 4.25, 41);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (103, 75, 4.64, 25);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (22, 28, 4.94, 76);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (6, 76, 4.65, 30);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (182, 47, 7.82, 1);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (60, 19, 2.92, 16);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (95, 97, 9.13, 3);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (191, 7, 9.4, 90);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (22, 40, 6.32, 86);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (170, 15, 1.22, 41);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (181, 80, 2.79, 8);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (32, 7, 3.56, 12);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (167, 84, 4.29, 99);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (119, 22, 6.26, 98);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (183, 12, 1.99, 49);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (6, 62, 5.1, 34);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (161, 35, 6.45, 100);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (71, 17, 4.69, 83);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (141, 100, 2.01, 34);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (155, 39, 4.31, 43);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (24, 19, 8.75, 82);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (104, 89, 1.51, 45);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (163, 69, 8.85, 52);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (141, 86, 7.8, 7);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (153, 77, 8.89, 25);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (29, 75, 6.17, 90);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (72, 72, 3.47, 68);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (84, 85, 9.76, 27);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (69, 55, 5.93, 93);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (138, 2, 2.88, 17);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (75, 47, 7.11, 81);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (69, 22, 3.45, 6);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (184, 35, 8.51, 65);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (96, 49, 6.33, 51);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (7, 88, 1.8, 13);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (14, 27, 9.18, 38);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (163, 100, 5.3, 2);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (109, 67, 6.25, 67);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (88, 90, 9.51, 90);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (44, 15, 4.72, 58);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (26, 90, 6.53, 81);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (189, 33, 7.15, 17);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (64, 62, 8.6, 10);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (121, 50, 3.47, 49);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (4, 57, 8.56, 89);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (15, 96, 1.6, 11);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (177, 60, 2.4, 37);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (159, 15, 7.43, 73);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (175, 92, 1.16, 63);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (194, 96, 6.06, 95);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (178, 99, 5.52, 5);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (73, 19, 4.56, 89);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (173, 85, 7.44, 88);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (19, 15, 7.25, 84);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (124, 59, 1.15, 64);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (28, 56, 1.21, 53);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (85, 39, 1.8, 32);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (74, 57, 6.54, 43);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (45, 5, 5.9, 20);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (27, 92, 9.0, 5);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (55, 2, 8.65, 14);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (132, 36, 9.1, 5);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (2, 34, 2.42, 56);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (26, 42, 9.01, 2);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (163, 67, 7.33, 6);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (44, 47, 5.79, 93);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (190, 91, 7.62, 32);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (131, 15, 7.63, 99);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (182, 53, 4.83, 31);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (26, 52, 1.48, 1);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (39, 75, 2.41, 7);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (61, 89, 5.44, 32);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (57, 29, 7.61, 83);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (194, 13, 7.39, 95);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (48, 40, 5.42, 75);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (22, 33, 2.95, 17);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (127, 10, 8.65, 2);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (120, 22, 9.63, 64);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (43, 64, 8.03, 77);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (108, 61, 5.6, 80);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (147, 57, 5.61, 44);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (99, 59, 9.39, 26);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (74, 85, 9.71, 43);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (168, 32, 7.3, 14);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (171, 67, 6.41, 85);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (97, 18, 9.51, 15);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (61, 54, 3.38, 15);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (152, 76, 2.76, 43);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (128, 23, 9.74, 11);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (79, 33, 1.4, 24);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (54, 12, 5.77, 39);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (97, 65, 8.76, 89);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (73, 2, 1.86, 17);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (199, 6, 2.93, 98);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (5, 52, 2.54, 100);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (95, 92, 6.8, 44);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (82, 78, 9.67, 21);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (179, 84, 6.58, 98);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (113, 11, 8.92, 35);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (12, 37, 1.8, 73);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (126, 26, 4.67, 10);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (66, 3, 5.75, 18);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (166, 36, 2.51, 25);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (164, 78, 2.4, 96);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (186, 30, 6.3, 53);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (69, 91, 6.3, 43);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (142, 59, 6.89, 93);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (26, 12, 4.28, 53);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (60, 95, 3.82, 5);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (192, 52, 1.67, 93);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (157, 32, 7.54, 83);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (50, 100, 1.49, 6);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (142, 34, 1.43, 73);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (150, 74, 2.73, 11);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (182, 44, 6.87, 95);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (186, 78, 5.77, 77);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (36, 89, 6.35, 60);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (10, 16, 2.91, 30);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (192, 80, 9.61, 45);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (6, 76, 8.78, 95);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (141, 98, 4.85, 59);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (143, 7, 8.95, 29);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (114, 15, 5.92, 55);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (76, 17, 6.95, 68);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (114, 4, 9.63, 67);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (137, 44, 4.25, 90);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (99, 62, 2.44, 14);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (55, 88, 6.09, 38);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (149, 78, 8.46, 47);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (32, 40, 8.05, 76);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (156, 48, 6.94, 17);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (7, 12, 1.21, 53);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (11, 53, 4.02, 90);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (29, 9, 2.64, 24);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (63, 42, 2.03, 44);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (40, 71, 1.56, 84);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (144, 81, 7.65, 94);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (57, 17, 3.8, 3);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (123, 98, 1.48, 12);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (135, 27, 7.06, 68);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (151, 2, 3.36, 97);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (52, 92, 1.35, 58);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (163, 28, 1.66, 98);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (186, 64, 9.26, 100);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (6, 13, 1.07, 45);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (114, 72, 1.93, 87);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (68, 85, 1.71, 42);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (96, 85, 1.88, 81);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (101, 63, 7.21, 99);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (167, 45, 2.07, 59);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (186, 58, 4.99, 77);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (175, 11, 9.99, 20);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (61, 59, 1.5, 18);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (151, 76, 4.34, 74);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (16, 86, 9.0, 84);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (189, 29, 5.83, 65);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (22, 87, 5.72, 88);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (111, 68, 5.73, 58);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (85, 72, 4.12, 21);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (3, 90, 5.18, 76);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (184, 80, 3.43, 63);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (189, 9, 8.82, 65);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (131, 4, 7.82, 47);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (85, 82, 1.32, 35);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (122, 8, 4.45, 57);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (92, 21, 9.73, 95);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (13, 83, 5.47, 80);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (178, 95, 2.87, 20);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (200, 41, 2.49, 73);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (123, 53, 2.17, 67);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (11, 79, 9.88, 81);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (31, 60, 1.76, 8);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (84, 79, 3.94, 44);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (169, 60, 6.18, 53);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (160, 11, 8.2, 7);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (24, 77, 4.45, 39);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (94, 44, 2.65, 83);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (99, 46, 9.91, 84);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (133, 3, 8.32, 19);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (58, 35, 3.92, 90);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (96, 38, 7.17, 97);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (161, 97, 9.35, 46);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (95, 63, 4.74, 80);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (131, 10, 2.22, 99);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (169, 50, 6.42, 22);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (152, 38, 3.93, 75);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (143, 85, 5.54, 73);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (184, 54, 3.82, 79);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (2, 86, 9.78, 37);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (89, 93, 8.54, 98);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (181, 54, 6.29, 99);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (46, 56, 1.53, 66);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (42, 59, 4.48, 93);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (186, 9, 7.24, 90);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (68, 9, 7.38, 41);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (75, 97, 5.0, 26);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (144, 16, 4.59, 54);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (43, 62, 3.09, 28);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (9, 43, 7.58, 76);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (1, 33, 6.25, 85);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (187, 22, 2.93, 57);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (3, 101, 9.17, 17);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (153, 74, 4.14, 41);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (22, 41, 8.5, 6);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (87, 94, 6.13, 43);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (52, 75, 1.11, 72);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (42, 61, 3.6, 48);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (175, 50, 2.63, 28);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (142, 95, 8.44, 84);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (81, 85, 9.23, 4);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (142, 75, 1.52, 1);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (19, 39, 4.52, 10);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (121, 90, 5.7, 90);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (80, 17, 8.19, 69);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (105, 25, 8.57, 84);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (51, 27, 3.07, 73);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (31, 55, 7.95, 94);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (150, 100, 9.36, 17);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (4, 21, 3.12, 82);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (176, 96, 1.22, 62);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (134, 76, 6.9, 59);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (2, 20, 3.65, 28);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (103, 47, 1.57, 4);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (25, 13, 4.16, 97);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (190, 61, 9.24, 52);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (126, 68, 8.24, 9);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (7, 75, 6.04, 2);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (118, 61, 4.36, 31);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (144, 68, 2.27, 5);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (8, 95, 4.9, 57);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (56, 69, 3.5, 64);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (184, 87, 5.17, 73);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (149, 10, 6.92, 14);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (165, 38, 6.09, 30);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (96, 84, 9.69, 48);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (14, 59, 1.58, 82);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (161, 93, 3.23, 56);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (197, 93, 9.0, 19);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (156, 24, 4.53, 70);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (139, 91, 6.25, 100);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (142, 59, 6.78, 86);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (7, 28, 4.1, 94);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (74, 41, 5.56, 42);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (98, 82, 7.47, 67);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (127, 24, 2.39, 70);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (188, 81, 1.2, 41);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (137, 74, 8.12, 33);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (43, 40, 7.69, 95);
insert into DetalleVenta (IdOrdenVenta, IdProducto, Precio, Cantidad) values (114, 19, 5.5, 67);

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
    order by sum(dv.Cantidad) Desc
    limit 10;
end$$
delimiter ;

delimiter $$
create procedure top10clientes()
begin
	select c.Nombres,c.Apellidos,c.email,sum(ov.TotalVenta)
    from Cliente c Join OrdenVenta ov on c.Cedula = ov.IdCliente
    group by c.Nombres,c.Apellidos,c.email
    order by sum(ov.TotalVenta) Desc
    limit 10;
end$$
delimiter ;

delimiter $$
create procedure top10clientesMasFrecuentes()
begin
	select c.Nombres,c.Apellidos,c.email,count(ov.IdOrdenVenta)
    from Cliente c Join OrdenVenta ov on c.Cedula = ov.IdCliente
    group by c.Nombres,c.Apellidos,c.email
    order by count(ov.IdOrdenVenta) Desc
    limit 10;
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

create unique index idxCedula on Cliente (cedula);
create unique index idProd on Producto (idProducto);
create unique index idProv on proveedor (idProveedor);
create index nomProv on proveedor (NombreProveedor);
create index nomProd on producto (NombreProducto);