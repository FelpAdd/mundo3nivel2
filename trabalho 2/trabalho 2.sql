CREATE TABLE Produto (
  IDProduto INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(100) NULL,
  Quantidade VARCHAR(500) NULL,
  PrecoVenda FLOAT NULL,
  PRIMARY KEY(IDProduto)
);

CREATE TABLE Pessoa (
  idPessoa INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(100) NULL,
  Endereco VARCHAR(100) NULL,
  Cidade VARCHAR(100) NULL,
  Estado CHAR(2) NULL,
  Telefone VARCHAR(100) NULL,
  Email VARCHAR(100) NULL,
  PRIMARY KEY(idPessoa)
);

CREATE TABLE Usuarios (
  IDUsuario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Login VARCHAR(100) NULL,
  Senha VARCHAR(100) NULL,
  PRIMARY KEY(IDUsuario)
);

CREATE TABLE PessoasJuridicas (
  IDPessoaJuridica INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Pessoa_idPessoa INTEGER UNSIGNED NOT NULL,
  CNPJ VARCHAR(18) NULL,
  PRIMARY KEY(IDPessoaJuridica),
  INDEX PessoasJuridicas_FKIndex1(Pessoa_idPessoa),
  FOREIGN KEY(Pessoa_idPessoa)
    REFERENCES Pessoa(idPessoa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE PessoasFisicas (
  IDPessoaFisica INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Pessoa_idPessoa INTEGER UNSIGNED NOT NULL,
  CPF VARCHAR(11) NULL,
  PRIMARY KEY(IDPessoaFisica),
  INDEX PessoasFisicas_FKIndex1(Pessoa_idPessoa),
  FOREIGN KEY(Pessoa_idPessoa)
    REFERENCES Pessoa(idPessoa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Movimento  (
  IDMovimento INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Produto_IDProduto INTEGER UNSIGNED NOT NULL,
  Usuarios_IDUsuario INTEGER UNSIGNED NOT NULL,
  Pessoa_idPessoa INTEGER UNSIGNED NOT NULL,
  IDProduto INTEGER UNSIGNED NULL,
  IDUsuario INTEGER UNSIGNED NULL,
  Quantidade INTEGER UNSIGNED NULL,
  PrecoUnitario FLOAT NULL,
  Data_2 FLOAT NULL,
  IDPessoaFisica INTEGER UNSIGNED NULL,
  PRIMARY KEY(IDMovimento),
  INDEX Movimento _FKIndex1(Pessoa_idPessoa),
  INDEX Movimento _FKIndex2(Usuarios_IDUsuario),
  INDEX Movimento _FKIndex3(Produto_IDProduto),
  FOREIGN KEY(Pessoa_idPessoa)
    REFERENCES Pessoa(idPessoa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Usuarios_IDUsuario)
    REFERENCES Usuarios(IDUsuario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Produto_IDProduto)
    REFERENCES Produto(IDProduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


