create or replace view view_alocacao_sem_interessados as select semestre.semestre, disciplina.cod, disciplina.disciplina, 
disciplina.ch, turma.turma, tipo_aula.tipo_aula, formacao.formacao, curso.curso, docente.nome as indicado from turma 
inner join semestre on semestre.id = turma.id_semestre inner join disciplina on disciplina.id = turma.id_disciplina 
inner join disciplina_formacao on disciplina.id = disciplina_formacao.id_disciplina inner join formacao on 
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

CREATE OR REPLACE VIEW view_docente_dcet as select docente.id, docente.nome, docente.dt_inicio, cargo, titulo, area, 
UPPER(sigla) as sigla from docente inner join cargo on docente.id_cargo = cargo.id inner join titulo on 
docente.id_titulo = titulo.id inner join area on docente.id_area = area.id inner join departamento on 
area.id_departamento = departamento.id where sigla = 'dcet';

CREATE OR REPLACE VIEW view_disciplina_dcet as select disciplina.id, disciplina.cod, disciplina.disciplina, disciplina.ch, formacao, area, 
UPPER(departamento.sigla) as sigla from disciplina inner join area on disciplina.id_area = area.id 
inner join departamento on area.id_departamento = departamento.id inner join disciplina_formacao on 
disciplina.id = disciplina_formacao.id_disciplina inner join formacao on 
disciplina_formacao.id_formacao = formacao.id where sigla = 'dcet';

CREATE OR REPLACE VIEW view_area_dcet as select * from area where id_departamento = 5;
CREATE OR REPLACE VIEW view_departamento_dcet as select * from departamento where id = 5;
CREATE OR REPLACE VIEW view_pro_reitoria_prograd as select * from pro_reitoria where id = 2;
CREATE OR REPLACE VIEW view_semestre_prograd as select * from semestre where id_pro_reitoria = 2;
CREATE OR REPLACE VIEW view_curso_computacao as select * from curso where id = 4;
CREATE OR REPLACE VIEW view_turma_computacao as select * from turma where id_curso = 4;
CREATE OR REPLACE VIEW view_aula_computacao as select * from aula where aula.id_turma in (select view_turma_computacao.id from view_turma_computacao);
CREATE OR REPLACE VIEW view_doc_indicado_computacao as select * from doc_indicado where doc_indicado.id_aula in (select view_aula_computacao.id from view_aula_computacao);
CREATE OR REPLACE VIEW view_doc_interessado_computacao as select * from doc_interessado where doc_interessado.id_aula in (select view_aula_computacao.id from view_aula_computacao);