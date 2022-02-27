drop schema if exists educativa;
create schema educativa;

create table educativa.profesor(
	idprofesor char(5) primary key not null,
    nombre varchar(20) not null,
    descripcion varchar(70) not null,
    fotoprofesor blob 
);

create table educativa.alumno(
	dni char(8) primary key not null,
    nombre varchar(20) not null,
    email varchar(30) not null,
    celular char(9) not null
);

create table educativa.cursos(
	idcurso char(5) primary key not null,
    nombrecurso varchar(20) not null,
    horarios datetime not null,
    descripcion varchar(70) not null,
    preciocurso float not null

);

create table educativa.profesor_has_cursos(
    id_profesor char(5),
    id_curso char(5),
    primary key(id_profesor,id_curso),
    foreign key(id_profesor) references profesor(idprofesor) on delete cascade,
    foreign key(id_curso) references cursos(idcurso) on delete cascade
);

create table educativa.alumnos_has_cursos(
    id_DNI char(8),
    id_cursos char(5),
    primary key(id_DNI,id_cursos),
    foreign key(id_DNI) references alumno(dni) on delete cascade,
    foreign key(id_cursos) references cursos(idcurso) on delete cascade
);


