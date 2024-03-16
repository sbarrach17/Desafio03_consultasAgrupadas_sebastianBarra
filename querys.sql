-- creacion base de datos
create database desafio03_sebastian_barra_179

-- 2. Cruza los datos de la tabla usuarios y posts, mostrando las siguientes columnas:
-- nombre y email del usuario junto al título y contenido del post
select usuarios.nombre,usuarios.email,posts.titulo,posts.contenido from usuarios 
inner join posts on usuarios.id = posts.usuario_id;

-- 3. Muestra el id, título y contenido de los posts de los administradores.
-- a. El administrador puede ser cualquier id.
select posts.id,posts.titulo,posts.contenido from usuarios 
inner join posts on usuarios.id = posts.usuario_id where usuarios.rol = 'administrador';

-- 4. Cuenta la cantidad de posts de cada usuario.
-- a. La tabla resultante debe mostrar el id e email del usuario junto con la
-- cantidad de posts de cada usuario.
select usuarios.id, usuarios.email, count(posts.id) as cantidad_post
from usuarios left join posts on usuarios.id = posts.usuario_id group by usuarios.id, usuarios.email order by usuarios.id;

-- 5. Muestra el email del usuario que ha creado más posts.
-- a. Aquí la tabla resultante tiene un único registro y muestra solo el email
select usuarios.email from Usuarios 
inner join (
    select usuario_id, COUNT(id) AS cantidad_post
    from Posts
    group by usuario_id
    order by cantidad_post desc limit 1
) as POSTS on usuarios.id = POSTS.usuario_id;

--6 Muestra la fecha del último post de cada usuario.
select usuarios.id, usuarios.nombre,usuarios.apellido, max(posts.fecha_creacion) as Ultimo_post_usuarios
from usuarios left join posts on usuarios.id = posts.usuario_id 
group by usuarios.id, usuarios.nombre, usuarios.apellido;

-- 7. Muestra el título y contenido del post (artículo) con más comentarios
select posts.titulo,posts.contenido from posts inner join(
select post_id,count(id) as post_mas_comentarios from comentarios
	group by post_id order by post_mas_comentarios desc limit 1	
) as COMENTARIOS on posts.id = COMENTARIOS.post_id;

-- --8. Muestra en una tabla el título de cada post, el contenido de cada post y el contenido
-- de cada comentario asociado a los posts mostrados, junto con el email del usuario
-- que lo escribió.
select posts.titulo,posts.contenido as contenido_post,comentarios.contenido as contenido_comentarios,usuarios.email as email_usuario from posts 
left join comentarios on posts.id = comentarios.post_id
inner join usuarios on comentarios.usuario_id = usuarios.id;

-- 9. Muestra el contenido del último comentario de cada usuario.
select usuarios.nombre, usuarios.email, 
(select comentarios.contenido 
    from comentarios 
    where comentarios.usuario_id = usuarios.id 
    order by comentarios.fecha_creacion desc 
    limit 1) as ultimo_comentario
from usuarios;


-- 10. Muestra los emails de los usuarios que no han escrito ningún comentario.
select usuarios.email from usuarios left join comentarios on usuarios.id = comentarios.usuario_id
group by usuarios.id, usuarios.email having count(comentarios.id) = 0;
