CREATE DATABASE oficina_refinado;

USE oficina_refinado;

CREATE TABLE Cliente (
	idCliente INT NOT NULL,
	nome VARCHAR(255) NOT NULL,
    CPF CHAR(11),
	telefone VARCHAR(25) NOT NULL,
	email VARCHAR(150),
	CONSTRAINT pk_idCliente PRIMARY KEY (idCliente)
);

CREATE TABLE StatusOS (
	idStatusSO INT NOT NULL,
	identificacao VARCHAR(45) NOT NULL,
	
    CONSTRAINT unique_StatusSO_Identificacao UNIQUE (identificacao),
	CONSTRAINT pk_idStatusSO PRIMARY KEY (idStatusSO)
);

CREATE TABLE OrdemServico (
	idOrdemServico INT NOT NULL,
	idCliente INT NOT NULL,
	idStatusSO INT NOT NULL,
	codigo VARCHAR(10) NOT NULL,
	dataEmissao DATE NOT NULL,
	dataParaConclusao DATE,
	valor DECIMAL(10,2),
	dataAutorizacao DATE,
	obs TEXT,

	CONSTRAINT unique_OrdemServico_Codigo UNIQUE (codigo),
	CONSTRAINT pk_idOrdemServico PRIMARY KEY (idOrdemServico),
	CONSTRAINT fk_OrdemServico_idCliente_Cliente_id FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
	CONSTRAINT fk_OrdemServico_idStatusSO_StatusSO_id FOREIGN KEY (idStatusSO) REFERENCES StatusSO(idStatusSO)
);

CREATE TABLE Equipe (
	idEquipe INT NOT NULL,
	identificacao VARCHAR(45) NOT NULL,
	
    CONSTRAINT unique_equipe_identificacao UNIQUE (identificacao),
	CONSTRAINT pk_idEquipe PRIMARY KEY (idEquipe)
);

CREATE TABLE TabelaServico (
	idTabelaServico INT NOT NULL,
	identificacao VARCHAR(100) NOT NULL,
	valorTabela DECIMAL(10,2),
	
    CONSTRAINT unique_TabelaServico_Identificacao UNIQUE (identificacao),
	CONSTRAINT pk_idTabelaServico PRIMARY KEY (idTabelaServico)
);

CREATE TABLE Veiculo (
	idVeiculo INT NOT NULL,
	idOrdemServico INT NOT NULL,
	modelo varchar(45) NOT NULL,
	cor varchar(45) NOT NULL,
	placa CHAR(7),
	
    CONSTRAINT pk_idVeiculo PRIMARY KEY (idVeiculo),
	CONSTRAINT fk_Veiculo_idOrdemServico_OrdemServico_id FOREIGN KEY (idOrdemServico) REFERENCES OrdemServico(idOrdemServico)
);

CREATE TABLE Servico (
	idServico INT NOT NULL,
	idVeiculo INT NOT NULL,
	idTabelaServico INT NOT NULL,
	idEquipe INT NOT NULL,
	statusServico ENUM('Realizado', 'Em execução', 'Cancelado') default 'Em execução',
	descricao TEXT NOT NULL,
	valorPecas DECIMAL(10,2) NOT NULL,
	ValorMaoDeObra DECIMAL(10,2) NOT NULL,
	dataInicio DATE,
	dataTermino DATE,
	
    CONSTRAINT pk_Servico_id PRIMARY KEY (idServico),
	CONSTRAINT fk_Servico_idVeiculo_Veiculo_id FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo),
	CONSTRAINT fk_Servico_idTabelaServico_TabelaServico_id FOREIGN KEY (idTabelaServico) REFERENCES TabelaServico(idTabelaServico),
	CONSTRAINT fk_Servico_idEquipe_Equipe_id FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe)
);

CREATE TABLE Mecanico (
	idMecanico INT NOT NULL,
	idEquipe INT NOT NULL,
	codigo VARCHAR(45) NOT NULL,
	nome VARCHAR(255) NOT NULL,
	CEP VARCHAR(10) NOT NULL,
	logradouro VARCHAR(150) NOT NULL,
	numero VARCHAR(10) NOT NULL,
	complemento VARCHAR(45),
	
    CONSTRAINT unique_Mecanico_Codigo UNIQUE (codigo),
	CONSTRAINT pk_Mecanico_id PRIMARY KEY (idMecanico),
	CONSTRAINT fk_Mecanico_idEquipe_Equipe_id FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe)
);

CREATE TABLE Peca (
    idPeca INT NOT NULL,
    identificacao VARCHAR(45) NOT NULL,
    valorReferencia DECIMAL(10 , 2 ) NOT NULL,
    
    CONSTRAINT unique_Peca_Identificacao UNIQUE (identificacao),
    CONSTRAINT pk_Peca_id PRIMARY KEY (idPeca)
);

CREATE TABLE ServicoPeca (
	idServicoPeca INT NOT NULL,
	idServico INT NOT NULL,
	idPeca INT NOT NULL,
	valorPeca DECIMAL(10,2) NOT NULL,
	
    CONSTRAINT pk_ServicoPeca_id PRIMARY KEY (idServicoPeca),
	CONSTRAINT fk_ServicoPeca_idServico_Servico_id FOREIGN KEY (idServico) REFERENCES Servico(idServico),
	CONSTRAINT fk_ServicoPeca_idPeca_Peca_id FOREIGN KEY (idPeca) REFERENCES Peca(idPeca)
);
