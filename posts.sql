create table posts(
id serial,
titulo varchar,
contenido text,
fecha_creacion timestamp,
fecha_actualizacion timestamp,
destacado boolean,
usuario_id bigint
)

insert into posts (titulo,contenido,fecha_creacion,fecha_actualizacion,destacado,usuario_id) values
('post 1','contenido post 1','2022-01-03','2023-03-30',false,1),
('post 2','contenido post 2','2021-05-23','2023-01-29',false,1),
('post 3','contenido post 3','2023-01-10','2023-07-28',false,2),
('post 4','contenido post 4','2022-07-02','2024-03-10',false,3),
('post 5','contenido post 5','2022-10-21','2023-12-30',false,1);