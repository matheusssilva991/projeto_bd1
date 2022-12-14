-- Groups
CREATE GROUP departamento_dcet;
CREATE GROUP pro_reitoria_prograd;
CREATE GROUP curso_computacao;

-- permissões group departamento_dcet
GRANT SELECT ON view_docente_dcet, view_disciplina_dcet TO departamento_dcet;
GRANT SELECT, UPDATE, DELETE, INSERT ON view_area_dcet, view_departamento_dcet TO departamento_dcet;
GRANT SELECT, UPDATE, DELETE, INSERT ON disciplina, disciplina_formacao, docente, cargo, titulo TO departamento_dcet;

-- permissões group pro_reitoria_prograd
GRANT SELECT, UPDATE, DELETE, INSERT ON view_pro_reitoria_prograd, view_semestre_prograd TO pro_reitoria_prograd;

-- permissões group curso_computacao
GRANT SELECT, UPDATE, DELETE, INSERT ON view_curso_computacao, view_turma_computacao TO curso_computacao;
GRANT SELECT, UPDATE, DELETE, INSERT ON view_aula_computacao, view_doc_indicado_computacao TO curso_computacao;
GRANT SELECT, UPDATE, DELETE, INSERT ON view_doc_interessado_computacao TO curso_computacao;

-- permissões teste banco de dados
GRANT SELECT ON view_alocacao_interessados, view_alocacao_sem_interessados to departamento_dcet, pro_reitoria_prograd,
curso_computacao;

-- Users departamento_dcet
CREATE USER user_dcet WITH PASSWORD '1234';
GRANT departamento_dcet TO user_dcet;

-- Users pro_reitoria_prograd
CREATE USER user_prograd WITH PASSWORD '1234';
GRANT pro_reitoria_prograd TO user_prograd;

-- Users curso_computacao
CREATE USER user_computacao WITH PASSWORD '1234';
GRANT curso_computacao TO user_computacao;



