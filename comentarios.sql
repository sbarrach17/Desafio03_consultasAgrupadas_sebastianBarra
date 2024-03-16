create table comentarios(
	id serial,
	contenido text,
	fecha_creacion timestamp,
	usuario_id bigint,
	post_id bigint
);

insert into comentarios (contenido,fecha_creacion,usuario_id,post_id) values
('comentario 1','2023-12-10',1,1),
('comentario 2','2023-11-22',2,1),
('comentario 3','2023-12-29',3,1),
('comentario 4','2024-02-24',1,2),
('comentario 5','2024-01-02',2,2);