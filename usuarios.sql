create table usuarios(
id serial,
email varchar(50),
nombre varchar(50),
apellido varchar(50),
rol varchar
);


insert into usuarios (email,nombre,apellido,rol) values 
('admin@correo.com','sebastian','barra','administrador'),
('usuario1@correo.com','javiera','perez','usuario'),
('usuario2@correo.com','mario','zuñiga','usuario'),
('usuario3@correo.com','sofia','vasquez','usuario'),
('usuario4@correo.com','olga','soto','usuario');