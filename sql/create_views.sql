create or replace view view_alocacao_sem_interessados as select semestre.semestre, disciplina.cod, disciplina.disciplina, disciplina.ch, turma.turma,
tipo_aula.tipo_aula, formacao.formacao, curso.curso, docente.nome as indicado from turma inner join semestre on 
semestre.id = turma.id_semestre inner join disciplina on disciplina.id = turma.id_disciplina inner join 
disciplina_formacao on disciplina.id = disciplina_formacao.id_disciplina inner join formacao on 
formacao.id = disciplina_formacao.id_formacao inner join aula on turma.id = aula.id_turma inner join 
tipo_aula on aula.id_tipo_aula = tipo_aula.id inner join curso on curso.id = turma.id_curso inner join
doc_indicado on aula.id = doc_indicado.id_aula inner join docente on docente.id = doc_indicado.id_docente
order by (semestre.semestre, disciplina.disciplina, turma.turma);

create or replace view view_alocacao_interessados as select semestre.semestre, disciplina.cod, 
disciplina.disciplina, disciplina.ch, turma.turma,tipo_aula.tipo_aula, formacao.formacao, curso.curso, 
docente.nome as interessado from turma inner join semestre on semestre.id = turma.id_semestre inner join 
disciplina on disciplina.id = turma.id_disciplina inner join disciplina_formacao on disciplina.id = 
disciplina_formacao.id_disciplina inner join formacao on formacao.id = disciplina_formacao.id_formacao 
inner join aula on turma.id = aula.id_turma inner join tipo_aula on aula.id_tipo_aula = tipo_aula.id 
inner join curso on curso.id = turma.id_curso inner join doc_interessado on aula.id = 
doc_interessado.id_aula inner join docente on docente.id = doc_interessado.id_docente
order by (semestre.semestre, disciplina.disciplina, turma.turma);