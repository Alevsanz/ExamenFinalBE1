drop schema if exists ventas;
create schema ventas;

create table ventas.clientes(
	idcliente char(5) primary key not null,
    apellidos varchar(20) not null,
    nombres varchar(20) not null,
    direccion varchar(45) not null,
    ciudad varchar(20) not null,
    pais varchar(15) not null,
    celular char(9) not null,
    fax varchar(45),
    fechaingreso datetime not null,
    indvigente varchar(40)
);

create table ventas.articulo(
	idarticulo char(5) primary key not null,
    descripcion varchar(70) not null,
    preciounitario float not null,
    stock int not null
);

create table ventas.vendedor(
	idvendedor char(5) primary key not null,
    nombre varchar(20) not null
);

create table ventas.pedido(
	idpedido char(5) primary key not null,
    fechapedido datetime not null,
    subtotal float not null,
    impuesto float not null,
    total float not null,
    estado boolean not null,
    id_cliente char(5),
    foreign key(id_cliente) references clientes(idcliente) on delete cascade,
    id_vendedor char(5),
    foreign key(id_vendedor) references vendedor(idvendedor) on delete cascade
);

create table ventas.detallepedido(
	cantidad int not null,
    precio float not null,
    subtotal float not null,
    id_articulo char(5),
    id_pedido char(5),
    primary key(id_articulo,id_pedido),
    foreign key(id_articulo) references articulo(idarticulo) on delete cascade,
    foreign key(id_pedido) references pedido(idpedido) on delete cascade
);




