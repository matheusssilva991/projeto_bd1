select semestre.semestre, disciplina.cod, disciplina.disciplina, turma.turma, disciplina.ch, 
tipo_aula.tipo_aula, formacao.formacao, curso.curso from turma inner join semestre on semestre.id = 
turma.id_semestre inner join disciplina on disciplina.id = turma.id_disciplina inner join 
disciplina_formacao on disciplina.id = disciplina_formacao.id_disciplina inner join formacao on 
formacao.id = disciplina_formacao.id_formacao inner join aula on turma.id = aula.id_turma inner join 
tipo_aula on aula.id_tipo_aula = tipo_aula.id inner join curso on curso.id = turma.id_curso
order by (semestre.semestre, disciplina.disciplina, turma.turma);
