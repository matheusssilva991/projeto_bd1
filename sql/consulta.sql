select semestre.semestre, disciplina.cod, disciplina.disciplina, disciplina.ch,
docente.nome from sem_disc inner join semestre on sem_disc.id_semestre = semestre.id
inner join disciplina on sem_disc.id_disciplina = disciplina.id 
inner join sem_disc_docente on sem_disc.id = sem_disc_docente.id_sem_disc inner join
docente on docente.id = sem_disc_docente.id_docente;
