-- Criando tabelas para o Sistema de Manutenção Preditiva

CREATE TABLE equipamentos (
    equipamento_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    data_compra DATE,
    data_ultima_manutencao DATE,
    status VARCHAR(20) CHECK (status IN ('Ativo', 'Inativo', 'Em Manutenção'))
);

CREATE TABLE historico_manutencao (
    log_id SERIAL PRIMARY KEY,
    equipamento_id INT REFERENCES equipamentos(equipamento_id),
    data_manutencao DATE NOT NULL,
    tipo_manutencao VARCHAR(50),
    nome_tecnico VARCHAR(100),
    observacoes TEXT
);

CREATE TABLE falhas (
    falha_id SERIAL PRIMARY KEY,
    equipamento_id INT REFERENCES equipamentos(equipamento_id),
    data_falha DATE NOT NULL,
    tipo_falha VARCHAR(50),
    nivel_severidade INT CHECK (nivel_severidade BETWEEN 1 AND 5),
    resolvido BOOLEAN DEFAULT FALSE
);

CREATE TABLE modelos_preditivos (
    modelo_id SERIAL PRIMARY KEY,
    equipamento_id INT REFERENCES equipamentos(equipamento_id),
    data_predicao DATE NOT NULL,
    data_falha_prevista DATE,
    nivel_confianca DECIMAL(5,2),
    status VARCHAR(20) CHECK (status IN ('Pendente', 'Verificado', 'Incorreto'))
);

-- Exemplo de Consulta: Encontrar equipamentos com maior risco de falha
SELECT e.nome, mp.data_falha_prevista, mp.nivel_confianca
FROM modelos_preditivos mp
JOIN equipamentos e ON mp.equipamento_id = e.equipamento_id
WHERE mp.nivel_confianca > 85
ORDER BY mp.data_falha_prevista ASC;
