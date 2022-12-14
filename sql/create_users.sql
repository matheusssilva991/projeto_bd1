-- drop all
--drop group departamento_dcet;
--drop group pro_reitoria_prograd;
--drop group curso_computacao;
--drop user user_dcet;
--drop user user_prograd;
--drop user user_computacao;
--drop user user_docente;

-- groups
create group departamento_dcet;
create group pro_reitoria_prograd;
create group curso_computacao;
create group docente;

-- permissões group departamento_dcet
grant select on view_docente_dcet, view_disciplina_dcet, cargo, titulo to departamento_dcet;
grant select, update, delete, insert on view_area_dcet, view_departamento_dcet, departamento_dcet to departamento_dcet;

-- permissões group pro_reitoria_prograd
grant select, update, delete, insert on view_pro_reitoria_prograd, view_semestre_prograd to pro_reitoria_prograd;

-- permissões group curso_computacao
grant select, update, delete, insert on view_curso_computacao, view_turma_computacao to curso_computacao;
grant select, update, delete, insert on view_doc_indicado_computacao to curso_computacao;

-- permissões group docente
grant select, update, delete, insert on view_doc_interessado_computacao to docente;

-- permissões teste banco de dados
grant select on view_alocacao_interessado, view_alocacao_indicado to departamento_dcet, pro_reitoria_prograd,
curso_computacao, docente;

-- users departamento_dcet
create user user_dcet with password '1234';
grant departamento_dcet to user_dcet;

-- users pro_reitoria_prograd
create user user_prograd with password '1234';
grant pro_reitoria_prograd to user_prograd;

-- users curso_computacao
create user user_computacao with password '1234';
grant curso_computacao to user_computacao;

-- users docente
create user user_docente with password '1234';
grant docente to user_docente;


