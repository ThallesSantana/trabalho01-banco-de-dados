1:

select livros.titulo from aula_db_exemplos.livros;

2:

select autores.nome from aula_db_exemplos.autores where autores.nascimento < '1901-01-01';

3:

select livros.titulo from aula_db_exemplos.livros where livros.autor_id = 1;

4:

select alunos.nome from alunos inner join matriculas on alunos.id = matriculas.aluno_id where curso = 'Engenharia de Software';

5:

select produto, SUM(receita) as total_receita from vendas group by produto;

6:

select nome, COUNT(titulo) as num_de_livros from autores inner join livros where autores.id = livros.autor_id group by nome;

7:

select curso, count(nome) as num_de_alunos from matriculas inner join alunos on matriculas.aluno_id=alunos.id group by curso;

8:

select produto, AVG(receita) as receita_media from vendas group by produto;

9:

select produto, SUM(receita) as total_receita from vendas group by produto having receita_total >'10.000';

10:

select nome, count(titulo) as num_de_livros from autores inner join livros where autores.id = livros.autor_id group by nome having número_de_livros >2;

11:
select titulo, nome from livros inner join autores on livros.autor_id=autores.id;

12:
select nome, curso from alunos inner join matriculas on alunos.id = matriculas.aluno_id; 

13:
select nome, titulo from autores left join livros on autores.id = livros.autor_id;

14:
select curso, nome from alunos right join matriculas on alunos.id = matriculas.aluno_id;

15
não sei fazer

16

with contagemlivros as (
    select autor_id, count(*) as quantlivros
    from livros
    group by autor_id
)

select autores.nome as autor, quantidadelivros as maiorquantidadelivros
from contagemlivros
join autores on contagemlivros.autor_id = autores.id
where quantidadelivros = (
    select max(quantlivros) 
    from contlivros
);

17

select produto, sum(receita) as total_receita from vendas group by produto order by total_receita asc limit 1;


18
não sei fazer

19

select nome, count(curso) as num_de_matriculas from alunos inner join matriculas on alunos.id = matriculas.aluno_id group by nome;

20

with número_de_produtos as (
    select produto, count(*) as número from vendas group by produto
)
select produto, número from número_de_produtos where número = (select max(número) from número_de_produtos);