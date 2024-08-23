
-- Operadores Aritmétricos
SELECT 10 + 5 AS soma;
SELECT 10 - 5 AS subtracao;
SELECT 10 * 5 AS multiplicacao;
SELECT 10 / 5 AS divisao;
SELECT 10 % 5 AS modulo; -- Resto da Divisão

-- Operadores de Comparação
 
SELECT * FROM clientes WHERE idade = 25; -- todos que tem
SELECT * FROM clientes WHERE idade != 25; -- todo mundo que nao tem
SELECT * FROM produtos WHERE preco > 100; -- maior
SELECT * FROM produtos WHERE preco < 50; -- menor
SELECT * FROM produtos WHERE preco >= 500; -- maior igual
SELECT * FROM produtos WHERE preco <= 1000; -- menor igual
SELECT * FROM produtos WHERE preco BETWEEN 50 AND 100; -- Esteja entre
SELECT * FROM clientes WHERE nome IN ('vitinho', 'roger'); -- diversos
SELECT * FROM clientes WHERE nome LIKE ('ro%'); -- ger
SELECT * FROM clientes WHERE nome LIKE ('%o%'); -- vitinh %o -- r% %ger
SELECT * FROM clientes WHERE nome LIKE ('%ger'); -- ro
SELECT * FROM clientes WHERE nome IS NULL; -- selecionando quem e nulo
 
-- Operadores Lógicos
SELECT * FROM clientes WHERE idade > 15 AND idade < 25; -- &&
SELECT * FROM clientes WHERE idade > 15 OR idade < 25; -- ||
SELECT * FROM clientes WHERE NOT idade = 18; -- nao seja
 
-- Função de Agregação 
SELECT COUNT(*) FROM clientes; -- contar as linhas do banco
SELECT SUM(quantidade) FROM produtos; -- somar
SELECT AVG(quantidade) FROM produtos; -- média
SELECT MIN(quantidade) FROM produtos; -- Minimo
SELECT MAX(quantidade) FROM produtos; -- Maximo
 
-- Função de String
SELECT CONCAT(nome, idade) FROM clientes; -- Concatenar
SELECT LOWER(nome) FROM clientes; -- Deixar tudo minusculo
SELECT UPPER(nome) FROM clientes; -- Deixar tudo maiusculo
SELECT SUBSTRING(nome, 5, 10) FROM clientes; -- cortar palavra, ini e fim
 
-- Função de Data e Hora
SELECT NOW(); -- retorna a data e hora atual
SELECT CURDATE(); -- retorna a data atual
SELECT CURTIME(); -- retorna a hora atual
 
-- Função Matemáticas
SELECT ABS(-534.25); -- Retorna um valor absoluto
SELECT CEIL(43.45); -- Arredonda para um numero inteiro
SELECT CEILING(43.65); -- Arredonda para um numero inteiro
-- 43.45 -> 44w
SELECT FLOOR(45.97); -- Arredonda para baixo
SELECT ROUND(45.44, 0); -- Arredondar com base nas casas decimais
-- 45.95 -> 46
-- 45.23 -> 45
SELECT SQRT(); -- Raiz Quadrada