create schema audit;

-- Create Function to Triggers
create or replace function audit.func_proc_audit()
    returns TRIGGER as $tables_proc_audit$
    declare
        table_name_audit constant text := TG_TABLE_NAME || '_audit';
    begin
        execute format(
            'create table if not exists audit.%I (
                id bigserial primary key,
                log_autor varchar(50),
                log_data DATE,
                log_operacao VARCHAR(6),
                log_query VARCHAR(200));', table_name_audit);

        if(TG_OP = 'DELETE') then
            execute format('insert into audit.%I (log_autor, log_data, log_operacao, log_query) 
            values (%L, %L, %L, %L);', table_name_audit, USER, NOW(), TG_OP, current_query());
            return OLD;
        ELSIF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') then
            execute format('insert into audit.%I (log_autor, log_data, log_operacao, log_query) 
            values (%L, %L, %L, %L);', table_name_audit, USER, NOW(), TG_OP, current_query());
            return NEW;
        END IF;
    end;
    $tables_proc_audit$ language plpgsql;

-- Triggers
create or replace trigger doc_indicado_audit
before insert or update or delete
on doc_indicado
for each row execute procedure
audit.func_proc_audit();

create or replace trigger doc_interessado_audit
before insert or update or delete
on doc_interessado
for each row execute procedure
audit.func_proc_audit();

create or replace trigger doc_interessado_audit
before insert or update or delete
on docente
for each row execute procedure
audit.func_proc_audit();

create or replace trigger doc_interessado_audit
before insert or update or delete
on pro_reitoria
for each row execute procedure
audit.func_proc_audit();

create or replace trigger doc_interessado_audit
before insert or update or delete
on semestre
for each row execute procedure
audit.func_proc_audit();

create or replace trigger doc_interessado_audit
before insert or update or delete
on turma
for each row execute procedure
audit.func_proc_audit();

create or replace trigger doc_interessado_audit
before insert or update or delete
on formacao
for each row execute procedure
audit.func_proc_audit();

create or replace trigger doc_interessado_audit
before insert or update or delete
on curso
for each row execute procedure
audit.func_proc_audit();

create or replace trigger doc_interessado_audit
before insert or update or delete
on tipo_aula
for each row execute procedure
audit.func_proc_audit();

create or replace trigger doc_interessado_audit
before insert or update or delete
on disciplina
for each row execute procedure
audit.func_proc_audit();

create or replace trigger doc_interessado_audit
before insert or update or delete
on area
for each row execute procedure
audit.func_proc_audit();

create or replace trigger doc_interessado_audit
before insert or update or delete
on cargo
for each row execute procedure
audit.func_proc_audit();

create or replace trigger doc_interessado_audit
before insert or update or delete
on titulo
for each row execute procedure
audit.func_proc_audit();