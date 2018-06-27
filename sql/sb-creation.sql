DROP Table usuario;
CREATE TABLE usuario(
    id BIGINT  not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , role varchar(200) not null
    , name varchar(200) not null
    , login varchar(20) not null
    , passwordHash BIGINT not null
    , vl_saldo DOUBLE PRECISION
);
INSERT INTO usuario VALUES
(default, 'ADMIN', 'Administrador', 'admin', 1509442, 0);
INSERT INTO usuario VALUES
(default, 'USUARIO', 'Testador da Silva', 'teste', 1509442, 0);

DROP Table leilao;
CREATE TABLE leilao(
    id BIGINT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , id_leiloeiro BIGINT
    , inicio TIMESTAMP
    , fim varchar(200) not null
    , lote varchar(200)
    , vl_min DOUBLE PRECISION not null
);

DROP Table bem;
CREATE TABLE bem(
    id BIGINT  not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , descricao varchar(200) not null
    , categoria varchar(200)
);

DROP Table lote;
CREATE TABLE lote(
    id BIGINT  not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , id_leilao BIGINT not null
    , id_bem BIGINT not null
);

DROP Table lance;
CREATE TABLE lance(
    id BIGINT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , id_leilao BIGINT not null
    , id_arrematador BIGINT not null
    , timestamp TIMESTAMP not null
    , lance DOUBLE PRECISION not null
);

DROP Table venda;
CREATE TABLE venda(
    id BIGINT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , id_leilao BIGINT not null
    , id_comprador BIGINT not null
    , id_lance BIGINT not null
);

DROP Table credito;
CREATE TABLE credito(
    id BIGINT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , id_usuario BIGINT not null
    , tipo varchar(200) not null
    , timestamp TIMESTAMP not null
    , credito DOUBLE PRECISION not null
);