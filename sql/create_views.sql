create or replace view view_alocacao_indicado as select semestre.semestre, disciplina.cod, disciplina.disciplina, disciplina.ch as carga_horaria, turma.turma, tipo_aula.tipo_aula,
formacao.formacao, curso.curso as colegiado, docente.nome as docente_indicado from turma inner join disciplina on turma.id_disciplina =
disciplina.id inner join semestre on semestre.id = turma.id_semestre inner join curso on curso.id =
turma.id_curso inner join formacao on formacao.id = curso.id_formacao inner join aula on aula.id_turma =
turma.id inner join tipo_aula on tipo_aula.id = aula.id_tipo_aula inner join doc_indicado on
doc_indicado.id_aula = aula.id inner join docente on docente.id = doc_indicado.id_docente
order by (semestre.semestre, disciplina.disciplina, turma.turma);

create or replace view view_alocacao_interessado as select semestre.semestre, disciplina.cod, disciplina.disciplina, disciplina.ch as carga_horaria, turma.turma, tipo_aula.tipo_aula,
formacao.formacao, curso.curso as colegiado, docente.nome as docente_interessado from turma inner join disciplina on turma.id_disciplina =
disciplina.id inner join semestre on semestre.id = turma.id_semestre inner join curso on curso.id =
turma.id_curso inner join formacao on formacao.id = curso.id_formacao inner join aula on aula.id_turma =
turma.id inner join tipo_aula on tipo_aula.id = aula.id_tipo_aula inner join doc_interessado on
doc_interessado.id_aula = aula.id inner join docente on docente.id = doc_interessado.id_docente
order by (semestre.semestre, disciplina.disciplina, turma.turma);

create or replace view view_docente_dcet as select docente.id, docente.nome, docente.dt_inicio, cargo, titulo, area, 
upper(sigla) as sigla from docente inner join cargo on docente.id_cargo = cargo.id inner join titulo on 
docente.id_titulo = titulo.id inner join area on docente.id_area = area.id inner join departamento on 
area.id_departamento = departamento.id where sigla = 'dcet';

create or replace view view_disciplina_dcet as select disciplina.id, disciplina.cod, disciplina.disciplina, disciplina.ch, area, 
upper(departamento.sigla) as sigla from disciplina inner join area on disciplina.id_area = area.id 
inner join departamento on area.id_departamento = departamento.id where sigla = 'dcet';

create or replace view view_area_dcet as select * from area where id_departamento = 5;
create or replace view view_departamento_dcet as select * from departamento where id = 5;
create or replace view view_pro_reitoria_prograd as select * from pro_reitoria where id = 2;
create or replace view view_semestre_prograd as select * from semestre where id_pro_reitoria = 2;
create or replace view view_curso_computacao as select * from curso where id = 4;
create or replace view view_turma_computacao as select * from turma where id_curso = 4;
create or replace view view_aula_computacao as select * from aula where aula.id_turma in (select view_turma_computacao.id from view_turma_computacao);
create or replace view view_doc_indicado_computacao as select * from doc_indicado where doc_indicado.id_aula in (select view_aula_computacao.id from view_aula_computacao);
create or replace view view_doc_interessado_computacao as select * from doc_interessado where doc_interessado.id_aula in (select view_aula_computacao.id from view_aula_computacao);