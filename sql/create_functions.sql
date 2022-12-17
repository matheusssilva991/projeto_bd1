create or replace function calcula_tempo_servico_docente()
    returns trigger as $calcula_tempo_servico$ 
    begin
        update docente set tempo_servico = cast((current_date - dt_inicio)/ 365 as integer) || ' anos, ' ||
        cast((current_date - dt_inicio) % 365 / 30 as integer) || ' meses e ' || 
        cast((current_date - dt_inicio) % 365 % 30 as integer) || ' dias';
    end;
	$calcula_tempo_servico$ language plpgsql;
        
create or replace trigger chama_calcula_tempo_servico
after update or insert on docente
for each row execute procedure calcula_tempo_servico_docente();

select docente.id, nome, dt_inicio, cargo, titulo, cast((current_date - dt_inicio)/ 365 as integer) 
|| ' anos, ' || cast((current_date - dt_inicio) % 365 / 30 as integer) || ' meses e ' || 
cast((current_date - dt_inicio) % 365 % 30 as integer) || ' dias' as tempo_servico 
from docente inner join cargo on docente.id_cargo = cargo.id inner join titulo on 
docente.id_titulo = titulo.id where docente.id >= 3 and docente.id < 28;

-- Função calcular tempo de serviço docente
create or replace function calcula_tempo_servico(integer, integer, integer)
returns text language plpgsql as $$

declare
	anos_i alias for $1;
	meses_i alias for $2;
	dias_i alias for $3;
	
	anos_c integer := date_part('year', now());
	meses_c integer := date_part('month', now());
	dias_c integer := date_part('day', now());
	
	anos integer := abs(anos_c - anos_i);
	meses integer := abs(meses_c - meses_i);
	dias integer := abs(dias_c - dias_i);
	total_dias integer := (anos * 365) + (meses * 30) + dias;
begin
	return cast(total_dias / 365 as integer) || ' anos, ' || 
	cast(total_dias % 365 / 30 as integer) || ' meses e ' || 
	cast(total_dias % 365 % 30 as integer) || ' dias'; 
end;
$$;