create database prueba;
use prueba;
create table aparato(
  codigo int primary key,
  descripcion varchar(45),
  tipo_producto varchar(45)
);

create table tipo(
  tipo_producto varchar(45) primary key,
  caracteristica varchar(100)
);

create table componentes(
  nombre_componente varchar(45) primary key,
  especificacion varchar(45)
);

create table caracteristicas(
  codigo int primary key,
  nombre_componente varchar(45),
  cif int ,
  cantidad int,
  precio double(3,0)
);

create table fabricantes(
 cif int primary key,
Dominio_social varchar(100)
);

ALTER TABLE aparato ADD CONSTRAINT fk_tipo_producto FOREIGN KEY (tipo_producto) REFERENCES tipo(tipo_producto);
ALTER TABLE caracteristicas ADD CONSTRAINT fk_nombre_componentes FOREIGN KEY (nombre_componente) REFERENCES componentes(nombre_componente);
ALTER TABLE caracteristicas ADD CONSTRAINT fk_tcodigo FOREIGN KEY (codigo) REFERENCES aparato(codigo);
ALTER TABLE caracteristicas ADD CONSTRAINT fk_cif FOREIGN KEY (cif) REFERENCES fabricantes(cif);


