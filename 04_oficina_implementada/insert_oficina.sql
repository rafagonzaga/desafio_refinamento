INSERT INTO Cliente (nome, CPF, telefone, email) 
VALUES 
    ('Osvaldo Paulo da Mota', '12345678911', '(74)9951.9880', 'opmota@bol.com.br'),
	('Nicole Paula', '14725836911', '58050-4239', 'nic@uol.com.br'),
	('Mariana Joana', '14789632511', '91132-0658', 'mariana@hotmail.com'),
	('Renato Rodrigues', '98765432111', '40934-6790', 'renato@gmail.com'),
	('Carlos Manoel', '98732145611', '75364-5000', 'carlos@gmail.com')
;

INSERT INTO StatusSO (identificacao) 
VALUES 
	('ABERTO'),
	('EM ANDAMENTO'),
	('EM PAUSA'),
	('CANCELADO'),
	('CONCLUÍDO')
;

INSERT INTO OrdemServico (idCliente, idStatusSO, codigo, dataEmissao, dataParaConclusao, valor, dataAutorizacao, obs) 
VALUES 
	(1, 1, '0000000001', '2022-09-10', null, 250, '2022-09-11', null),
    (2, 1, '0000000002', '2022-09-12', null, 123, '2022-09-15', null)
;


INSERT INTO Equipe (Identificacao) 
VALUES 
	('Mecanica geral'),
	('Funilaria'),
	('Pintura'),
	('Borracharia'),
	('Elétrica')
;

INSERT INTO TabelaServico (identificacao, valorTabela) 
VALUES 
	('Pintura geral', 2500),
    ('Reparo no motor', 850),
    ('Troca de lampada das lanternas', 40),
    ('Substituição de jogo de 4 pneus', 80),
    ('Alinhamento e balanceamento', 90)
;

INSERT INTO Veiculo (idOrdemServico, modelo, cor, placa) 
VALUES 
	(1, '2008', 'branca', 'abc1d23'),
    (2, 'Eco Srort', 'preta', 'bcd2e34'),
	(3, 'Uno', 2015, 'prata', 'cde3f45'),
	(4, 'Cobalt', 'branca', 'def4g56')
;

INSERT INTO Servico (idVeiculo, idTabelaServico, idEquipe, statusServico, descricao, valorPecas, valorMaoDeObra, dataInicio, dataTermino) 
VALUES 
	(1, 1, 1, 'Em execução', 'Trocar Pneu', 0, 50, '2022-09-20', '2022-09-24'),
	(2, 2, 2, 'Realizado', 'Instalar som', 1500, 250, '2022-09-20', '2022-09-24'),
	(3, 3, 3, 'Cancelado', 'Trocar pastilhas', 1000, 300, '2022-09-20', '2022-09-24'),
	(4, 4, 4, 'Em execução', 'Consertar motor', 100, 1000, '2022-09-20', '2022-09-24')
;

INSERT INTO Mecanico (idEquipe, codigo, nome, CEP, logradouro, numero,	complemento) 
VALUES 
	(1, '1111', 'João da Silva', '00000-000', 'Rua A', '11', null),
	(2, '1112', 'Gustavo Melo', '00000-000', 'Rua B', '12', null),
	(3, '1113', 'Ricardo Santos', '00000-000', 'Rua C', '13', null),
	(4, '1114', 'Silvio Mahoe', '00000-000', 'Rua D', '14', null)
    ;

INSERT INTO Peca (Identificacao, ValorReferencia)
VALUES 
	('Tinta azul', 250),
	('Óloe 1 litro', 25),
	('Lâmpadas da lanterna', 25),
	('Jogo de Pneus', 900),
	('Filtro de ar', 25)
;

INSERT INTO ServicoPeca (idServico, idPeca, valorPeca) 
VALUES
	(1, 1, 50), 
	(2, 2, 60),
	(3, 3, 70),
	(4, 4, 90)
;