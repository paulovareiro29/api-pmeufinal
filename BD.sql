CREATE DATABASE pmeutrabalhofinal;

CREATE TABLE paragem (
    id INT  NOT NULL AUTO_INCREMENT,
    longitude FLOAT  NOT NULL,
    latitude FLOAT  NOT NULL,
    rua VARCHAR(50) NOT NULL,
    cidade VARCHAR(50),
    cod_postal VARCHAR(8),
    PRIMARY KEY (id)
);

CREATE TABLE empresa (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    morada VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE carreira (
    id INT NOT NULL AUTO_INCREMENT,
    empresa_id INT NOT NULL,
    tempo_medio INT NOT NULL,
    distancia INT NOT NULL,
    inicio VARCHAR(50) NOT NULL,
    fim VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_empresa
        FOREIGN KEY (empresa_id) 
            REFERENCES empresa(id)
);

CREATE TABLE carreiraParagem (
    id INT NOT NULL AUTO_INCREMENT,
    carreira_id INT  NOT NULL,
    paragem_id INT  NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_carreira
        FOREIGN KEY (carreira_id) 
            REFERENCES carreira(id),
    CONSTRAINT FK_paragem
        FOREIGN KEY (paragem_id) 
            REFERENCES paragem(id)
);

CREATE TABLE horario (
    id INT NOT NULL AUTO_INCREMENT,
    carreiraparagem_id INT NOT NULL,
    hora INT NOT NULL,
    minutos INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_carreiraParagem
        FOREIGN KEY (carreiraParagem_id) 
            REFERENCES carreiraParagem(id)
);


INSERT INTO `empresa` (`id`, `nome`, `morada`) VALUES (NULL, 'AV Minho', NULL);

INSERT INTO `paragem` (`id`, `longitude`, `latitude`, `rua`, `cidade`, `cod_postal`) VALUES 
    (NULL, '-8.7599005', '41.3791583', 'Praça do Almada', 'Póvoa de Varzim', '4490-438'), 
    (NULL, '-8.7655008', '41.3871013', 'Rua Gomes de Amorim', 'Póvoa de Varzim', '4490-641'), 
    (NULL, '-8.7593008', '41.3889926', 'Rua D. Maria I', 'Póvoa de Varzim', '4490-538'), 
    (NULL, '-8.7694007', '41.4033538', 'Rua Gomes de Amorim', 'Póvoa de Varzim', '4490-108'), 
    (NULL, '-8.7481476', '41.4808509', 'N13', 'Apúlia', ''), 
    (NULL, '-8.7544575', '41.4918953', 'N13', 'Apúlia', ''), 
    (NULL, '-8.7725912', '41.511686', 'N13', 'Fão', ''), 
    (NULL, '-8.778843', '41.538487', 'Rua do Mouchinho', 'Esposende', ''), 
    (NULL, '-8.7827434', '41.606288', 'Rua Padre Apolinário Rios', 'Antas', '4740-018'), 
    (NULL, '-8.7780909', '41.6122991', 'N13', 'Antas', ''), 
    (NULL, '-8.7847063', '41.6795004', 'Avenida do Santoinho', 'Viana do Castelo', '4935-077'), 
    (NULL, '-8.808993', '41.6824973', 'N13', 'Viana do Castelo', ''), 
    (NULL, '-8.823236', '41.700397', 'Av. Cap. Gaspar de Castro', 'Viana do Castelo', ''), 
    (NULL, '-8.8330489', '41.6949507', 'N13', 'Viana do Castelo', '4490-496'), 
    (NULL, '-8.8330489', '41.6949507', 'Av. do Atlantico', 'Viana do Castelo', '');

INSERT INTO `carreira` (`id`, `empresa_id`, `tempo_medio`, `distancia`, `inicio`, `fim`) VALUES 
    (NULL, '1', '90', '4210', 'Póvoa de Varzim', 'Viana do Castelo'),
    (NULL, '1', '90', '4210', 'Viana do Castelo', 'Póvoa de Varzim');

INSERT INTO `carreiraparagem` (`id`, `carreira_id`, `paragem_id`) VALUES 
    (NULL, '1', '1'),
    (NULL, '1', '2'),
    (NULL, '1', '3'),
    (NULL, '1', '4'),
    (NULL, '1', '5'),
    (NULL, '1', '6'),
    (NULL, '1', '7'),
    (NULL, '1', '8'),
    (NULL, '1', '9'),
    (NULL, '1', '10'),
    (NULL, '1', '11'),
    (NULL, '1', '12'),
    (NULL, '1', '13'),
    (NULL, '1', '14'),
    (NULL, '1', '15'),

    (NULL, '2', '15'),
    (NULL, '2', '14'),
    (NULL, '2', '13'),
    (NULL, '2', '12'),
    (NULL, '2', '11'),
    (NULL, '2', '10'),
    (NULL, '2', '9'),
    (NULL, '2', '8'),
    (NULL, '2', '7'),
    (NULL, '2', '6'),
    (NULL, '2', '5'),
    (NULL, '2', '4'),
    (NULL, '2', '3'),
    (NULL, '2', '2'),
    (NULL, '2', '1');

INSERT INTO `horario` (`id`, `carreiraparagem_id`, `hora`, `minutos`) VALUES 
    (NULL, '1', '6', '45'),(NULL, '1', '7', '30'),(NULL, '1', '8', '30'),(NULL, '1', '10', '00'),(NULL, '1', '11', '45'),(NULL, '1', '13', '05'),(NULL, '1', '14', '35'),(NULL, '1', '16', '00'),(NULL, '1', '17', '15'),(NULL, '1', '18', '05'),(NULL, '1', '18', '30'),
    (NULL, '2', '6', '45'),(NULL, '2', '7', '30'),(NULL, '2', '8', '30'),(NULL, '2', '10', '00'),(NULL, '2', '11', '45'),(NULL, '2', '13', '05'),(NULL, '2', '14', '35'),(NULL, '2', '16', '00'),(NULL, '2', '17', '15'),(NULL, '2', '18', '05'),(NULL, '2', '18', '30'),
    (NULL, '3', '6', '45'),(NULL, '3', '7', '30'),(NULL, '3', '8', '30'),(NULL, '3', '10', '00'),(NULL, '3', '11', '45'),(NULL, '3', '13', '05'),(NULL, '3', '14', '35'),(NULL, '3', '16', '00'),(NULL, '3', '17', '15'),(NULL, '3', '18', '05'),(NULL, '3', '18', '30'),
    (NULL, '4', '6', '45'),(NULL, '4', '7', '30'),(NULL, '4', '8', '30'),(NULL, '4', '10', '00'),(NULL, '4', '11', '45'),(NULL, '4', '13', '05'),(NULL, '4', '14', '35'),(NULL, '4', '16', '00'),(NULL, '4', '17', '15'),(NULL, '4', '18', '05'),(NULL, '4', '18', '30'),

    (NULL, '5', '7', '05'),(NULL, '5', '7', '50'),(NULL, '5', '8', '50'),(NULL, '5', '10', '20'),(NULL, '5', '12', '05'),(NULL, '5', '13', '25'),(NULL, '5', '14', '55'),(NULL, '5', '16', '20'),(NULL, '5', '17', '35'),(NULL, '5', '18', '25'),(NULL, '5', '18', '50'),
    (NULL, '6', '7', '05'),(NULL, '6', '7', '50'),(NULL, '6', '8', '50'),(NULL, '6', '10', '20'),(NULL, '6', '12', '05'),(NULL, '6', '13', '25'),(NULL, '6', '14', '55'),(NULL, '6', '16', '20'),(NULL, '6', '17', '35'),(NULL, '6', '18', '25'),(NULL, '6', '18', '50'),
    (NULL, '7', '7', '05'),(NULL, '7', '7', '50'),(NULL, '7', '8', '50'),(NULL, '7', '10', '20'),(NULL, '7', '12', '05'),(NULL, '7', '13', '25'),(NULL, '7', '14', '55'),(NULL, '7', '16', '20'),(NULL, '7', '17', '35'),(NULL, '7', '18', '25'),(NULL, '7', '18', '50'),

    (NULL, '8', '7', '15'),(NULL, '8', '8', '00'),(NULL, '8', '9', '00'),(NULL, '8', '10', '30'),(NULL, '8', '12', '15'),(NULL, '8', '13', '35'),(NULL, '8', '15', '05'),(NULL, '8', '16', '30'),(NULL, '8', '17', '45'),(NULL, '8', '18', '35'),(NULL, '8', '19', '00'),

    (NULL, '9', '7', '30'),(NULL, '9', '8', '15'),(NULL, '9', '9', '15'),(NULL, '9', '10', '45'),(NULL, '9', '12', '30'),(NULL, '9', '13', '50'),(NULL, '9', '15', '20'),(NULL, '9', '16', '45'),(NULL, '9', '18', '00'),(NULL, '9', '18', '50'),(NULL, '9', '19', '15'),
    (NULL, '10', '7', '30'),(NULL, '10', '8', '15'),(NULL, '10', '9', '15'),(NULL, '10', '10', '45'),(NULL, '10', '12', '30'),(NULL, '10', '13', '50'),(NULL, '10', '15', '20'),(NULL, '10', '16', '45'),(NULL, '10', '18', '00'),(NULL, '10', '18', '50'),(NULL, '10', '19', '15'),

    (NULL, '11', '7', '55'),(NULL, '11', '8', '40'),(NULL, '11', '9', '40'),(NULL, '11', '11', '10'),(NULL, '11', '12', '55'),(NULL, '11', '14', '15'),(NULL, '11', '15', '45'),(NULL, '11', '17', '10'),(NULL, '11', '19', '15'),(NULL, '11', '18', '25'),(NULL, '11', '19', '40'),
    (NULL, '12', '7', '55'),(NULL, '12', '8', '40'),(NULL, '12', '9', '40'),(NULL, '12', '11', '10'),(NULL, '12', '12', '55'),(NULL, '12', '14', '15'),(NULL, '12', '15', '45'),(NULL, '12', '17', '10'),(NULL, '12', '19', '15'),(NULL, '12', '18', '25'),(NULL, '12', '19', '40'),
    (NULL, '13', '7', '55'),(NULL, '13', '8', '40'),(NULL, '13', '9', '40'),(NULL, '13', '11', '10'),(NULL, '13', '12', '55'),(NULL, '13', '14', '15'),(NULL, '13', '15', '45'),(NULL, '13', '17', '10'),(NULL, '13', '19', '15'),(NULL, '13', '18', '25'),(NULL, '13', '19', '40'),
    (NULL, '14', '7', '55'),(NULL, '14', '8', '40'),(NULL, '14', '9', '40'),(NULL, '14', '11', '10'),(NULL, '14', '12', '55'),(NULL, '14', '14', '15'),(NULL, '14', '15', '45'),(NULL, '14', '17', '10'),(NULL, '14', '19', '15'),(NULL, '14', '18', '25'),(NULL, '14', '19', '40'),
    (NULL, '15', '7', '55'),(NULL, '15', '8', '40'),(NULL, '15', '9', '40'),(NULL, '15', '11', '10'),(NULL, '15', '12', '55'),(NULL, '15', '14', '15'),(NULL, '15', '15', '45'),(NULL, '15', '17', '10'),(NULL, '15', '19', '15'),(NULL, '15', '18', '25'),(NULL, '15', '19', '40'),




    (NULL, '16', '6', '35'),(NULL, '16', '7', '05'),(NULL, '16', '7', '30'),(NULL, '16', '8', '20'),(NULL, '16', '9', '45'),(NULL, '16', '11', '45'),(NULL, '16', '13', '30'),(NULL, '16', '15', '00'),(NULL, '16', '16', '40'),(NULL, '16', '17', '40'),(NULL, '16', '18', '30'),
    (NULL, '17', '6', '35'),(NULL, '17', '7', '05'),(NULL, '17', '7', '30'),(NULL, '17', '8', '20'),(NULL, '17', '9', '45'),(NULL, '17', '11', '45'),(NULL, '17', '13', '30'),(NULL, '17', '15', '00'),(NULL, '17', '16', '40'),(NULL, '17', '17', '40'),(NULL, '17', '18', '30'),
    (NULL, '18', '6', '35'),(NULL, '18', '7', '05'),(NULL, '18', '7', '30'),(NULL, '18', '8', '20'),(NULL, '18', '9', '45'),(NULL, '18', '11', '45'),(NULL, '18', '13', '30'),(NULL, '18', '15', '00'),(NULL, '18', '16', '40'),(NULL, '18', '17', '40'),(NULL, '18', '18', '30'),
    (NULL, '19', '6', '35'),(NULL, '19', '7', '05'),(NULL, '19', '7', '30'),(NULL, '19', '8', '20'),(NULL, '19', '9', '45'),(NULL, '19', '11', '45'),(NULL, '19', '13', '30'),(NULL, '19', '15', '00'),(NULL, '19', '16', '40'),(NULL, '19', '17', '40'),(NULL, '19', '18', '30'),
    (NULL, '20', '6', '35'),(NULL, '20', '7', '05'),(NULL, '20', '7', '30'),(NULL, '20', '8', '20'),(NULL, '20', '9', '45'),(NULL, '20', '11', '45'),(NULL, '20', '13', '30'),(NULL, '20', '15', '00'),(NULL, '20', '16', '40'),(NULL, '20', '17', '40'),(NULL, '20', '18', '30'),

    (NULL, '21', '7', '00'),(NULL, '21', '7', '30'),(NULL, '21', '7', '55'),(NULL, '21', '8', '45'),(NULL, '21', '10', '10'),(NULL, '21', '12', '10'),(NULL, '21', '13', '55'),(NULL, '21', '15', '25'),(NULL, '21', '17', '05'),(NULL, '21', '18', '05'),(NULL, '21', '18', '55'),
    (NULL, '22', '7', '00'),(NULL, '22', '7', '30'),(NULL, '22', '7', '55'),(NULL, '22', '8', '45'),(NULL, '22', '10', '10'),(NULL, '22', '12', '10'),(NULL, '22', '13', '55'),(NULL, '22', '15', '25'),(NULL, '22', '17', '05'),(NULL, '22', '18', '05'),(NULL, '22', '18', '55'),

    (NULL, '23', '7', '10'),(NULL, '23', '7', '40'),(NULL, '23', '8', '10'),(NULL, '23', '9', '00'),(NULL, '23', '10', '25'),(NULL, '23', '12', '25'),(NULL, '23', '14', '10'),(NULL, '23', '15', '40'),(NULL, '23', '17', '20'),(NULL, '23', '18', '20'),(NULL, '23', '19', '10'),

    (NULL, '24', '7', '25'),(NULL, '24', '7', '55'),(NULL, '24', '8', '20'),(NULL, '24', '9', '10'),(NULL, '24', '10', '35'),(NULL, '24', '12', '35'),(NULL, '24', '14', '20'),(NULL, '24', '15', '50'),(NULL, '24', '17', '30'),(NULL, '24', '18', '30'),(NULL, '24', '19', '20'),
    (NULL, '25', '7', '25'),(NULL, '25', '7', '55'),(NULL, '25', '8', '20'),(NULL, '25', '9', '10'),(NULL, '25', '10', '35'),(NULL, '25', '12', '35'),(NULL, '25', '14', '20'),(NULL, '25', '15', '50'),(NULL, '25', '17', '30'),(NULL, '25', '18', '30'),(NULL, '25', '19', '20'),
    (NULL, '26', '7', '25'),(NULL, '26', '7', '55'),(NULL, '26', '8', '20'),(NULL, '26', '9', '10'),(NULL, '26', '10', '35'),(NULL, '26', '12', '35'),(NULL, '26', '14', '20'),(NULL, '26', '15', '50'),(NULL, '26', '17', '30'),(NULL, '26', '18', '30'),(NULL, '26', '19', '20'),

    (NULL, '27', '7', '45'),(NULL, '27', '8', '15'),(NULL, '27', '8', '40'),(NULL, '27', '9', '30'),(NULL, '27', '10', '55'),(NULL, '27', '12', '55'),(NULL, '27', '14', '40'),(NULL, '27', '16', '10'),(NULL, '27', '18', '00'),(NULL, '27', '19', '00'),(NULL, '27', '19', '40'),
    (NULL, '28', '7', '45'),(NULL, '28', '8', '15'),(NULL, '28', '8', '40'),(NULL, '28', '9', '30'),(NULL, '28', '10', '55'),(NULL, '28', '12', '55'),(NULL, '28', '14', '40'),(NULL, '28', '16', '10'),(NULL, '28', '18', '00'),(NULL, '28', '19', '00'),(NULL, '28', '19', '40'),
    (NULL, '29', '7', '45'),(NULL, '29', '8', '15'),(NULL, '29', '8', '40'),(NULL, '29', '9', '30'),(NULL, '29', '10', '55'),(NULL, '29', '12', '55'),(NULL, '29', '14', '40'),(NULL, '29', '16', '10'),(NULL, '29', '18', '00'),(NULL, '29', '19', '00'),(NULL, '29', '19', '40'),
    (NULL, '30', '7', '45'),(NULL, '30', '8', '15'),(NULL, '30', '8', '40'),(NULL, '30', '9', '30'),(NULL, '30', '10', '55'),(NULL, '30', '12', '55'),(NULL, '30', '14', '40'),(NULL, '30', '16', '10'),(NULL, '30', '18', '00'),(NULL, '30', '19', '00'),(NULL, '30', '19', '40');