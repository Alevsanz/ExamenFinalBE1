-- 1 todos los alumnos que lleven el curso X
select tabla_join_nombre.nombre_alumno,tabla_join_2.nombrecurso from 
(select educativa.alumno.nombre as nombre_alumno,
educativa.alumnos_has_cursos.id_cursos
from educativa.alumno 
join educativa.alumnos_has_cursos
on educativa.alumno.dni = educativa.alumnos_has_cursos.id_DNI) as tabla_join_nombre
join (select educativa.cursos.idcurso, educativa.cursos.nombrecurso
from educativa.cursos where educativa.cursos.nombrecurso = 'X') as tabla_join_2
on tabla_join_nombre.id_cursos = tabla_join_2.idcurso;

-- 2 los datos de los cursos que han sido llevados por más de un profesor

select count(id_profesor),
id_curso from educativa.profesor_has_cursos
group by id_curso;

/*
select count(idprofesor),id_curso from 
(
select educativa.profesor.idprofesor,
educativa.profesor_has_cursos.id_curso
from educativa.profesor
join educativa.profesor_has_cursos
on educativa.profesor.idprofesor = educativa.profesor_has_cursos.id_profesor
) as tabla_join
group by id_curso;
*/
-- 3 los datos de los alumnos que han llevado más de 1 curso
select count(id_DNI),
id_cursos from educativa.alumnos_has_cursos 
group by educativa.alumnos_has_cursos.id_cursos;

-- 4 los datos de los alumnos que han llevado el curso X y el curso Y. 
select tabla_join_nombre.nombre_alumno,tabla_join_2.nombrecurso,tabla_join_2.nombrecurso from 
(select educativa.alumno.nombre as nombre_alumno,
educativa.alumnos_has_cursos.id_cursos
from educativa.alumno 
join educativa.alumnos_has_cursos
on educativa.alumno.dni = educativa.alumnos_has_cursos.id_DNI) as tabla_join_nombre
join (select educativa.cursos.idcurso, educativa.cursos.nombrecurso
from educativa.cursos where educativa.cursos.nombrecurso = 'X' and educativa.cursos.nombrecurso = 'Y') as tabla_join_2
on tabla_join_nombre.id_cursos = tabla_join_2.idcurso;



