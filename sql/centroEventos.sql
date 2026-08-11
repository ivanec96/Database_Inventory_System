create database if not exists centroEventos;
use centroEventos;

create table if not exists organizadores (
id_organizadores int auto_increment,
nombre varchar (40) not null,
tlf varchar (15) not null,
email varchar (30) not null,
primary key (id_organizadores)
);
alter table organizadores modify email varchar(30) not null unique;

create table if not exists participantes (
  id_participantes int AUTO_INCREMENT,
  nombre varchar(20) not null,
  apellido varchar (20) not null,
  email varchar(25) not null,
  tlf varchar (15) not null,
  primary key (id_participantes)
);

alter table participantes modify email varchar(25) not null unique;

create table if not exists sala (
  id_sala int AUTO_INCREMENT,
  nombre varchar(30) not null,
  ubicacion varchar (20) not null,
  capacidad int not null,
  primary key (id_sala)
);

create table if not exists tipo_evento (
id_tipoEvento int auto_increment,
nombre varchar (40),
primary key (id_tipoEvento)
);

create table if not exists evento( 
  id_evento int auto_increment,
  id_tipoEvento int not null,
  id_sala int not null,
  titulo varchar (30) not null,
  fecha DATE not null,
  hora_inicio TIME not null,
  hora_fin time not null,
  aforo_max int not null,
  descripcion LONGTEXT,
  primary key (id_evento),
  constraint FK_tipoEvento foreign key (id_tipoEvento) references tipo_evento (id_tipoEvento),
constraint FK_sala foreign key (id_sala) references sala (id_sala)
);
alter table evento modify hora_fin time not null check (hora_fin > hora_inicio);
alter table evento modify aforo_max int not null check (aforo_max > 0);


create table if not exists inscripcion (
  id_inscripcion int auto_increment,
  id_participantes int not null,
  id_evento int not null,
  fecha DATE,
  primary key (id_inscripcion),
  constraint FK_participantes foreign key (id_participantes) references participantes (id_participantes),
  constraint FK_evento foreign key (id_evento) references evento (id_evento)
);
alter table inscripcion modify fecha date not null default (current_date);



create table if not exists organizar (
id_organizar int auto_increment,
id_evento int not null,
id_organizadores int not null,
primary key (id_organizar),
constraint FK_evento_organizador foreign key (id_evento) references evento (id_evento),
constraint FK_organizadores foreign key (id_organizadores) references organizadores (id_organizadores)
);

INSERT INTO tipo_evento (nombre) VALUES
('Concierto'), ('Conferencia'), ('Taller'), ('Exposicion'), ('Musical');

INSERT INTO sala (nombre, ubicacion, capacidad) VALUES
('Sala Principal', 'Planta Baja', 800),
('Sala Conferencias', 'Planta 1', 400),
('Sala Talleres A', 'Planta 2', 110),
('Sala Talleres B', 'Planta 2', 90),
('Sala VIP', 'Planta 3', 40);

INSERT INTO organizadores (nombre, tlf, email) VALUES
('Carlos Garcia', '612345678', 'carlos.garcia@email.com'),
('Maria Lopez', '623456789', 'maria.lopez@email.com'),
('Juan Martinez', '634567890', 'juan.martinez@email.com'),
('Ana Rodriguez', '645678901', 'ana.rodriguez@email.com'),
('Pedro Sanchez', '656789012', 'pedro.sanchez@email.com');

INSERT INTO participantes (nombre, apellido, email, tlf) VALUES
('Laura', 'Fernandez', 'laura.fernandez@email.com', '667890123'),
('Diego', 'Gomez', 'diego.gomez@email.com', '678901234'),
('Sofia', 'Perez', 'sofia.perez@email.com', '689012345'),
('Miguel', 'Torres', 'miguel.torres@email.com', '690123456'),
('Elena', 'Ruiz', 'elena.ruiz@email.com', '601234567');

INSERT INTO evento (id_tipoEvento, id_sala, titulo, fecha, hora_inicio, hora_fin, aforo_max, descripcion) VALUES
-- Conciertos en octubre (para consulta 1)
(1, 1, 'Concierto Rock', '2024-10-05', '20:00:00', '23:00:00', 500, 'Concierto de rock en vivo'),
(1, 1, 'Concierto Jazz', '2024-10-15', '19:00:00', '22:00:00', 500, 'Noche de jazz'),
(1, 5, 'Concierto Clasico', '2024-10-25', '18:00:00', '21:00:00', 30, 'Musica clasica en sala VIP'),
-- Conferencias (para distribuir por salas, consulta 3)
(2, 2, 'Conferencia IA', '2024-11-10', '09:00:00', '14:00:00', 200, 'Inteligencia artificial hoy'),
(2, 2, 'Conferencia Marketing', '2024-11-20', '10:00:00', '13:00:00', 200, 'Tendencias de marketing'),
-- Talleres
(3, 3, 'Taller Fotografia', '2024-12-01', '10:00:00', '13:00:00', 50, 'Introduccion a la fotografia'),
(3, 4, 'Taller Programacion', '2024-12-10', '09:00:00', '14:00:00', 50, 'Programacion para principiantes'),
-- Seminario y Exposicion
(5, 2, 'Seminario Finanzas', '2024-09-15', '09:00:00', '18:00:00', 200, 'Gestion financiera empresarial'),
(4, 1, 'Exposicion Arte', '2024-09-20', '11:00:00', '20:00:00', 500, 'Arte contemporaneo'),
(1, 1, 'Concierto Pop', '2024-11-30', '21:00:00', '23:30:00', 500, 'Los mejores exitos del pop');

INSERT INTO inscripcion (id_participantes, id_evento, fecha) VALUES
-- Laura inscrita en 3 eventos (aparecerá en consulta 4)
(1, 1, '2024-09-01'),
(1, 4, '2024-10-01'),
(1, 6, '2024-11-01'),
-- Diego inscrito en 4 eventos (aparecerá en consulta 4)
(2, 1, '2024-09-05'),
(2, 2, '2024-09-10'),
(2, 5, '2024-10-05'),
(2, 7, '2024-11-05'),
-- Sofia inscrita en 2 eventos (NO aparecerá en consulta 4)
(3, 3, '2024-09-15'),
(3, 8, '2024-10-15'),
-- Miguel inscrito en 1 evento (NO aparecerá en consulta 4)
(4, 9, '2024-09-20'),
-- Elena inscrita en 2 eventos (NO aparecerá en consulta 4)
(5, 6, '2024-10-20'),
(5, 10, '2024-11-20');

INSERT INTO organizar (id_evento, id_organizadores) VALUES
(1, 1), (1, 2), (2, 1), (3, 3), (4, 2), (4, 4),
(5, 4), (6, 3),(7, 5),(8, 2), (8, 5), (9, 3),      
(10, 1);

-- CONSULTA 1: CONCIERTOS EN OCTUBRE
select * from evento;
select * from tipo_evento;
select e.titulo, e.fecha from evento e
join tipo_evento te on e.id_tipoEvento = te.id_tipoEvento
where te.nombre = "Concierto" and month(e.fecha) = 10;

-- Consulta 2: Listar el nombre de todos los participantes y los títulos de los eventos en los que se han inscrito, ordenados por fecha de inscripción
select * from participantes;
select * from inscripcion;
select p.nombre, p.apellido, e.titulo, i.fecha as fecha_inscripcion from participantes p
join inscripcion i on p.id_participantes = i.id_participantes
join evento e on i.id_evento = e.id_evento
order by fecha_inscripcion asc;

-- Consulta 3: Contar cuántos eventos se han realizado en cada tipo de sala y mostrar el nombre de la sala y el número de eventos
select * from sala;
select * from evento;

select s.nombre, count(e.id_sala) as actuaciones_realizadas from sala s 
join evento e on s.id_sala = e.id_sala
group by s.nombre
ORDER BY actuaciones_realizadas desc;

-- Consulta 4: Encontrar los participantes que se han inscrito en más de dos eventos
select  * from participantes;
select * from inscripcion;
select * from evento;
select p.nombre, p.apellido, count(i.id_evento) as eventos_inscritos from participantes p 
join inscripcion i on p.id_participantes = i.id_participantes
join evento e on i.id_evento = e.id_evento
group by p.id_participantes
having count(i.id_evento) > 2;
