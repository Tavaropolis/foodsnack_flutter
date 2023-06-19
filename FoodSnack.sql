-- Criação do Database
DROP DATABASE FoodSnack;
DROP DATABASE FoodSnackAchive;
CREATE DATABASE IF NOT EXISTS FoodSnack; 
CREATE DATABASE IF NOT EXISTS FoodSnackAchive; 
USE FoodSnack;

-- Criação das Tabelas
CREATE TABLE IF NOT EXISTS Tipo_Item (
	ID INT NOT NULL AUTO_INCREMENT,
	Tipo VARCHAR(45) NOT NULL,
	PRIMARY KEY (ID));
  
CREATE TABLE IF NOT EXISTS Item (
	ID INT NOT NULL AUTO_INCREMENT,
	Descricao VARCHAR(45) NOT NULL,
	Valor DOUBLE NOT NULL,
    Foto VARCHAR(150),
	Tipo_Item_id INT NOT NULL,
	PRIMARY KEY (ID, Tipo_Item_id),
	FOREIGN KEY (Tipo_Item_id) REFERENCES Tipo_Item(ID));
    
CREATE TABLE IF NOT EXISTS Funcionario (
	Matricula INT NOT NULL AUTO_INCREMENT,
	Nome VARCHAR(100) NOT NULL,
	Senha VARCHAR(40) NOT NULL,
	Funcao VARCHAR(45) NOT NULL,
	CPF VARCHAR(11) NOT NULL,
	DataNasc DATE NOT NULL,
	PRIMARY KEY (Matricula));
  
CREATE TABLE IF NOT EXISTS Cliente (
	CPF VARCHAR(11) NOT NULL,
	Nome VARCHAR(100) NOT NULL,
    Senha VARCHAR(40) NOT NULL,
	Dta_nasc DATE NOT NULL,
	PRIMARY KEY (CPF));
    
CREATE TABLE IF NOT EXISTS Pedido (
	Numero INT NOT NULL AUTO_INCREMENT,
	Status_pedido VARCHAR(1) NOT NULL,
	Data_pedido DATE NOT NULL,
	Total_pedido DOUBLE NOT NULL DEFAULT 0,
	Cliente_CPF VARCHAR(11) NOT NULL,
	Funcionario_Matricula INT NOT NULL,
	PRIMARY KEY (Numero, Cliente_CPF, Funcionario_Matricula),
    FOREIGN KEY (Cliente_CPF) REFERENCES Cliente(CPF),
    FOREIGN KEY (Funcionario_Matricula) REFERENCES Funcionario(Matricula));
    
SELECT * FROM Cliente;
    
CREATE TABLE IF NOT EXISTS Estoque (
	Lote INT NOT NULL,
	Quant_Disp INT NOT NULL,
	Validade DATE NOT NULL,
	Item_id INT NOT NULL,
	PRIMARY KEY (Lote, Item_id),
	FOREIGN KEY (Item_id) REFERENCES Item(ID));
    
CREATE TABLE IF NOT EXISTS Tipo_Pagamento (
	ID INT NOT NULL AUTO_INCREMENT,
	Tipo VARCHAR(20) NOT NULL,
	PRIMARY KEY (ID));

CREATE TABLE IF NOT EXISTS Pedido_has_Estoque (
	Numero INT NOT NULL,
	Lote INT NOT NULL,
	Quantidade INT NOT NULL,
	PRIMARY KEY (Numero, Lote),
    FOREIGN KEY (Numero) REFERENCES Pedido(Numero),
    FOREIGN KEY (Lote) REFERENCES Estoque(Lote));
    
CREATE TABLE IF NOT EXISTS Log_Operacoes (
	ID INT NOT NULL AUTO_INCREMENT,
    Tabela VARCHAR(20) NOT NULL,
    DataLog DATE,
    Mensagem VARCHAR(300),
    PRIMARY KEY (ID)
);

-- Inserção dos dados
INSERT INTO Tipo_Item (Tipo) VALUES ('Salgados');
INSERT INTO Tipo_Item (Tipo) VALUES ('Bebidas');
INSERT INTO Tipo_Item (Tipo) VALUES ('Doces');

INSERT INTO Item (Descricao, Valor, Foto, Tipo_Item_id) VALUES ('Coxinha de frango com catupiry', 6.50, 'coxinha.jpg', 1);
INSERT INTO Item (Descricao, Valor, Foto, Tipo_Item_id) VALUES ('Empada de frango', 5.50, 'empadadefrango.jpg', 1);
INSERT INTO Item (Descricao, Valor, Foto, Tipo_Item_id) VALUES ('Hambugão', 6.50, 'hamburgao.jpg', 1);
INSERT INTO Item (Descricao, Valor, Tipo_Item_id) VALUES ('Empada de palmito', 6.50, 1);
INSERT INTO Item (Descricao, Valor, Foto, Tipo_Item_id) VALUES ('Enroladinho de Presunto', 5.50, 'enroladinhodepresunto.jpg', 1);

INSERT INTO Item (Descricao, Valor, Foto, Tipo_Item_id) VALUES ('Coca Cola', 5.15, 'cocacola.jpg', 2);
INSERT INTO Item (Descricao, Valor, Foto, Tipo_Item_id) VALUES ('Sprite', 5.50, 'sprite.jpg', 2);
INSERT INTO Item (Descricao, Valor, Foto, Tipo_Item_id) VALUES ('Suco de Laranja', 5.50, 'sucodelaranja.jpg', 2);
INSERT INTO Item (Descricao, Valor, Foto, Tipo_Item_id) VALUES ('Guaravita', 5.50, 'guaravita.jpg', 2);

INSERT INTO Item (Descricao, Valor, Foto, Tipo_Item_id) VALUES ('Chiclete', 1.50, 'chiclete.jpg', 3);
INSERT INTO Item (Descricao, Valor, Foto, Tipo_Item_id) VALUES ('Pé de moleque', 2.00, 'pedemoleque.jpg', 3);
INSERT INTO Item (Descricao, Valor, Foto, Tipo_Item_id) VALUES ('Snickers', 4.50, 'snickers.jpg', 3);
INSERT INTO Item (Descricao, Valor, Foto, Tipo_Item_id) VALUES ('Pirulito big big', 1.00, 'bigbig.jpg', 3);
INSERT INTO Item (Descricao, Valor, Foto, Tipo_Item_id) VALUES ('Dadinho', 0.50, 'dadinho.jpg', 3);

INSERT INTO Estoque (Lote, Quant_Disp, Validade, Item_id) VALUES (14785236, '7', '2023-04-26', '1');
INSERT INTO Estoque (Lote, Quant_Disp, Validade, Item_id) VALUES (14527895, '12', '2025-10-20', '2');
INSERT INTO Estoque (Lote, Quant_Disp, Validade, Item_id) VALUES (00088899, '60', '2025-02-18', '3');
INSERT INTO Estoque (Lote, Quant_Disp, Validade, Item_id) VALUES (58742698, '3', '2023-04-26', '4');
INSERT INTO Estoque (Lote, Quant_Disp, Validade, Item_id) VALUES (52368441, '3', '2023-08-03', '5');
INSERT INTO Estoque (Lote, Quant_Disp, Validade, Item_id) VALUES (48552316, '3', '2023-07-18', '6');
INSERT INTO Estoque (Lote, Quant_Disp, Validade, Item_id) VALUES (45852201, '2', '2023-06-26', '7');
INSERT INTO Estoque (Lote, Quant_Disp, Validade, Item_id) VALUES (20201458, '7', '2024-10-20', '8');
INSERT INTO Estoque (Lote, Quant_Disp, Validade, Item_id) VALUES (02113589, '4', '2023-12-18', '9');
INSERT INTO Estoque (Lote, Quant_Disp, Validade, Item_id) VALUES (01045236, '7', '2025-04-26', '10');
INSERT INTO Estoque (Lote, Quant_Disp, Validade, Item_id) VALUES (02142089, '12', '2025-12-20', '11');
INSERT INTO Estoque (Lote, Quant_Disp, Validade, Item_id) VALUES (78445201, '10', '2024-02-01', '12');
INSERT INTO Estoque (Lote, Quant_Disp, Validade, Item_id) VALUES (54191924, '40', '2024-04-15', '13');
INSERT INTO Estoque (Lote, Quant_Disp, Validade, Item_id) VALUES (54191999, '40', '2024-04-15', '14');

INSERT INTO Cliente (CPF, Nome, Senha, Dta_nasc) VALUES ('25415558451', 'Filomena', sha1("Filomena"), '3002-11-30');
INSERT INTO Cliente (CPF, Nome, Senha, Dta_nasc) VALUES ('45698775322', 'Mathias', sha1("Mathias"), '2002-01-24');
INSERT INTO Cliente (CPF, Nome, Senha, Dta_nasc) VALUES ('21445775533', 'Mayara', sha1("Mayara"), '1904-07-04');
INSERT INTO Cliente (CPF, Nome, Senha, Dta_nasc) VALUES ('25210326584', 'Luisa', sha1("Luisa"), '2001-01-29');
INSERT INTO Cliente (CPF, Nome, Senha, Dta_nasc) VALUES ('25145100245', 'Cleusa', sha1("Cleusa"), '1996-07-25');
INSERT INTO Cliente (CPF, Nome, Senha, Dta_nasc) VALUES ('54527896844', 'Julia', sha1("Julia"), '1999-11-14');
INSERT INTO Cliente (CPF, Nome, Senha, Dta_nasc) VALUES ('12026958633', 'Pedro', sha1("Pedro"), '2002-06-10');
INSERT INTO Cliente (CPF, Nome, Senha, Dta_nasc) VALUES ('14856325896', 'Felipe', sha1("Felipe"), '2001-09-05');

INSERT INTO Funcionario (Matricula, Nome, Senha, Funcao, CPF, DataNasc) VALUES (6924,'Tia Lurdes', sha1("TiaLurdes"), '25415558451', 'Atendente', '0001-01-01');

INSERT INTO Pedido (Numero, Status_pedido, Data_pedido, Total_pedido, Cliente_CPF, Funcionario_Matricula ) VALUES (240423,'A','2023-04-25', 666.66, 45698775322, 6924);
INSERT INTO Pedido (Numero, Status_pedido, Data_pedido, Total_pedido, Cliente_CPF, Funcionario_Matricula ) VALUES (240424,'P','2023-04-25', 10.50, 25415558451, 6924);
INSERT INTO Pedido (Numero, Status_pedido, Data_pedido, Total_pedido, Cliente_CPF, Funcionario_Matricula ) VALUES (240425,'P','2023-04-25', 12.66, 21445775533, 6924);
INSERT INTO Pedido (Numero, Status_pedido, Data_pedido, Total_pedido, Cliente_CPF, Funcionario_Matricula ) VALUES (240426,'A','2023-04-25', 20.50, 25210326584, 6924);
INSERT INTO Pedido (Numero, Status_pedido, Data_pedido, Total_pedido, Cliente_CPF, Funcionario_Matricula ) VALUES (240427,'P','2023-04-25', 12.66, 25145100245, 6924);
INSERT INTO Pedido (Numero, Status_pedido, Data_pedido, Total_pedido, Cliente_CPF, Funcionario_Matricula ) VALUES (240426,'A','2023-04-25', 17.50, 54527896844, 6924);
INSERT INTO Pedido (Numero, Status_pedido, Data_pedido, Total_pedido, Cliente_CPF, Funcionario_Matricula ) VALUES (240427,'A','2023-04-25', 7.50, 12026958633, 6924);
INSERT INTO Pedido (Numero, Status_pedido, Data_pedido, Total_pedido, Cliente_CPF, Funcionario_Matricula ) VALUES (240427,'P','2023-04-25', 10.50, 14856325896, 6924);

INSERT INTO Pedido_has_Estoque (numero, lote, quantidade) VALUES (240423, 14785236, 6);
INSERT INTO Pedido_has_Estoque (numero, lote, quantidade) VALUES (240423, 00088899, 55);
INSERT INTO Pedido_has_Estoque (numero, lote, quantidade) VALUES (240423, 14527895, 11);



INSERT INTO Pedido_has_Estoque (numero, lote, quantidade) VALUES (240424, 58742698, 6);
INSERT INTO Pedido_has_Estoque (numero, lote, quantidade) VALUES (240424, 20201458, 6);
INSERT INTO Pedido_has_Estoque (numero, lote, quantidade) VALUES (240425, 45852201, 1);
INSERT INTO Pedido_has_Estoque (numero, lote, quantidade) VALUES (240426, 48552316, 2);
INSERT INTO Pedido_has_Estoque (numero, lote, quantidade) VALUES (240426, 14527895, 10);

-- Procedures
DELIMITER //
CREATE PROCEDURE BaixaEst (IN PedidoId_p INT )
	BEGIN
		UPDATE Pedido SET Pedido.Status_pedido = 'f' WHERE Pedido.Numero = PedidoId_p;
		  UPDATE Estoque, Pedido_has_Estoque, Pedido
                SET Estoque.Quant_Disp = Estoque.Quant_Disp - Pedido_has_Estoque.quantidade
					WHERE Pedido.Numero = Pedido_has_Estoque.Numero AND
					Pedido_has_Estoque.Lote = Estoque.Lote AND 
                    Pedido.Numero = PedidoId_p;
                    SELECT "Baixa efetuada com sucesso" AS "Mensagem";
	END //
    
-- Triggers

-- Primeiro grupo de Triggers
-- Triggers da tabela Item
DELIMITER // 
	-- Primeiro declara-se a Trigger
	CREATE TRIGGER criarLogUpdateItem
		-- Depos declara-se o evento que ela vai ouvir (UPDATE)
		AFTER UPDATE ON Item FOR EACH ROW
        
			BEGIN
				-- Declarando as variáveis que iremos usar 
				DECLARE Tabela_v VARCHAR(20);
				DECLARE Operacao_v VARCHAR(20);
				DECLARE DataLog_v DATE;
				DECLARE Mensagem_v VARCHAR(300);
				
				-- Dando os valores as variáveis 
				SET Tabela_v = "Item";
				SET Operacao_v = "Update";
				SET DataLog_v = Now();
                
                -- Comparamos se o valor antigo esta diferente do novo
                IF OLD.Descricao <> NEW.Descricao THEN
					-- Damos valor a variável mensagem explicando o que foi modificado
					SET Mensagem_v =  CONCAT("Descrição ", OLD.Descricao, " do item ", NEW.ID, " modificado com ", Operacao_v, " para ", NEW.Descricao, " na tabela ",  Tabela_v, "!");
					-- Adicionamos o Log a tabela Log_Operacoes
                    INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
                
				IF OLD.Valor <> NEW.Valor THEN
					SET Mensagem_v =  CONCAT("Valor ", OLD.Valor, " do item ", NEW.ID, " modificado com ", Operacao_v, " para ", NEW.Valor, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
                
				IF OLD.Tipo_Item_id <> NEW.Tipo_Item_id THEN
					SET Mensagem_v =  CONCAT("Tipo_item ", OLD.Tipo_Item_id, " do item ", NEW.ID,  " modificado com ", Operacao_v, " para ", NEW.Tipo_Item_id, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
			-- Caso mais de um valor for alterado, criamos um Log diferente para cada valor alterado
			END //
            
DELIMITER // 
	CREATE TRIGGER criarLogDeleteItem
		BEFORE DELETE ON Item FOR EACH ROW
			BEGIN
				DECLARE Tabela_v VARCHAR(20);
				DECLARE Operacao_v VARCHAR(20);
				DECLARE DataLog_v DATE;
				DECLARE Mensagem_v VARCHAR(300);
				
				SET Tabela_v = "Item";
				SET Operacao_v = "Delete";
				SET DataLog_v = Now();
				SET Mensagem_v =  CONCAT("Item ", OLD.ID, " apagado com ", Operacao_v, " na tabela ",  Tabela_v, "!");
				
				INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
			END //

-- Triggers da tabela Tipo_Item
DELIMITER // 
	CREATE TRIGGER criarLogUpdateTipo_Item
		AFTER UPDATE ON Tipo_Item FOR EACH ROW
        
			BEGIN
				DECLARE Tabela_v VARCHAR(20);
				DECLARE Operacao_v VARCHAR(20);
				DECLARE DataLog_v DATE;
				DECLARE Mensagem_v VARCHAR(300);
				
				SET Tabela_v = "Tipo_Item";
				SET Operacao_v = "Update";
				SET DataLog_v = Now();
                
				IF OLD.Tipo <> NEW.Tipo THEN
					SET Mensagem_v =  CONCAT("Tipo ", OLD.Tipo, " do tipo item  ", NEW.ID,  " modificado com ", Operacao_v, " para ", NEW.Tipo, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
			END //

DELIMITER // 
	CREATE TRIGGER criarLogDeleteTipo_Item
		BEFORE DELETE ON Tipo_Item FOR EACH ROW
			BEGIN
				DECLARE Tabela_v VARCHAR(20);
				DECLARE Operacao_v VARCHAR(20);
				DECLARE DataLog_v DATE;
				DECLARE Mensagem_v VARCHAR(300);
				
				SET Tabela_v = "Tipo_Item";
				SET Operacao_v = "Delete";
				SET DataLog_v = Now();
				SET Mensagem_v =  CONCAT("Item ", OLD.ID, " apagado com ", Operacao_v, " na tabela ",  Tabela_v, "!");
				
				INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
			END //

-- Triggers da tabela Funcionario
DELIMITER // 
	CREATE TRIGGER criarLogUpdateFuncionario
		AFTER UPDATE ON Funcionario FOR EACH ROW
        
			BEGIN
				DECLARE Tabela_v VARCHAR(20);
				DECLARE Operacao_v VARCHAR(20);
				DECLARE DataLog_v DATE;
				DECLARE Mensagem_v VARCHAR(300);
				
				SET Tabela_v = "Funcionario";
				SET Operacao_v = "Update";
				SET DataLog_v = Now();
                
				IF OLD.Nome <> NEW.Nome THEN
					SET Mensagem_v =  CONCAT("Nome ", OLD.Nome, " do funcionario  ", NEW.Matricula,  " modificado com ", Operacao_v, " para ", NEW.Nome, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
                
				IF OLD.Funcao <> NEW.Funcao THEN
					SET Mensagem_v =  CONCAT("Função ", OLD.Funcao, " do funcionario  ", NEW.Matricula,  " modificado com ", Operacao_v, " para ", NEW.Funcao, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
                
				IF OLD.CPF <> NEW.CPF THEN
					SET Mensagem_v =  CONCAT("CPF ", OLD.CPF, " do funcionario  ", NEW.Matricula,  " modificado com ", Operacao_v, " para ", NEW.CPF, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
                
				IF OLD.DataNasc <> NEW.DataNasc THEN
					SET Mensagem_v =  CONCAT("DataNasc ", OLD.DataNasc, " do funcionario  ", NEW.Matricula,  " modificado com ", Operacao_v, " para ", NEW.DataNasc, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
			END //

DELIMITER // 
	CREATE TRIGGER criarLogDeleteFuncionario
		BEFORE DELETE ON Funcionario FOR EACH ROW
			BEGIN
				DECLARE Tabela_v VARCHAR(20);
				DECLARE Operacao_v VARCHAR(20);
				DECLARE DataLog_v DATE;
				DECLARE Mensagem_v VARCHAR(300);
				
				SET Tabela_v = "Funcionario";
				SET Operacao_v = "Delete";
				SET DataLog_v = Now();
                
				SET Mensagem_v =  CONCAT("Item ", OLD.Matricula, " apagado com ", Operacao_v, " na tabela ",  Tabela_v, "!");
				
				INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
			END //

-- Triggers da tabela Cliente
DELIMITER // 
	CREATE TRIGGER criarLogUpdateCliente
		AFTER UPDATE ON Cliente FOR EACH ROW
        
			BEGIN
				DECLARE Tabela_v VARCHAR(20);
				DECLARE Operacao_v VARCHAR(20);
				DECLARE DataLog_v DATE;
				DECLARE Mensagem_v VARCHAR(300);
				
				SET Tabela_v = "Cliente";
				SET Operacao_v = "Update";
				SET DataLog_v = Now();
                
				IF OLD.Nome <> NEW.Nome THEN
					SET Mensagem_v =  CONCAT("Nome ", OLD.Nome, " do cliente  ", NEW.CPF,  " modificado com ", Operacao_v, " para ", NEW.Nome, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
                
				IF OLD.Dta_nasc <> NEW.Dta_nasc THEN
					SET Mensagem_v =  CONCAT("Dta_nasc ", OLD.Dta_nasc, " do cliente  ", NEW.CPF,  " modificado com ", Operacao_v, " para ", NEW.Dta_nasc, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
			END //

DELIMITER // 
	CREATE TRIGGER criarLogDeleteCliente
		BEFORE DELETE ON Cliente FOR EACH ROW
			BEGIN
				DECLARE Tabela_v VARCHAR(20);
				DECLARE Operacao_v VARCHAR(20);
				DECLARE DataLog_v DATE;
				DECLARE Mensagem_v VARCHAR(300);
				
				SET Tabela_v = "Cliente";
				SET Operacao_v = "Delete";
				SET DataLog_v = Now();
                
				SET Mensagem_v =  CONCAT("Item ", OLD.CPF, " apagado com ", Operacao_v, " na tabela ",  Tabela_v, "!");
				
				INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
			END //

-- Triggers da tabela Pedido 
DELIMITER // 
	CREATE TRIGGER criarLogUpdatePedido
		AFTER UPDATE ON Pedido FOR EACH ROW
        
			BEGIN
				DECLARE Tabela_v VARCHAR(20);
				DECLARE Operacao_v VARCHAR(20);
				DECLARE DataLog_v DATE;
				DECLARE Mensagem_v VARCHAR(300);
				
				SET Tabela_v = "Pedido";
				SET Operacao_v = "Update";
				SET DataLog_v = Now();
                
				IF OLD.Status_pedido <> NEW.Status_pedido THEN
					SET Mensagem_v =  CONCAT("Status_pedido ", OLD.Status_pedido, " do pedido  ", NEW.Numero,  " modificado com ", Operacao_v, " para ", NEW.Status_pedido, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
                
				IF OLD.Data_pedido <> NEW.Data_pedido THEN
					SET Mensagem_v =  CONCAT("Data_pedido ", OLD.Data_pedido, " do pedido  ", NEW.Numero,  " modificado com ", Operacao_v, " para ", NEW.Data_pedido, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
                
				IF OLD.Total_pedido <> NEW.Total_pedido THEN
					SET Mensagem_v =  CONCAT("Total_pedido ", OLD.Total_pedido, " do pedido  ", NEW.Numero,  " modificado com ", Operacao_v, " para ", NEW.Total_pedido, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
                
				IF OLD.Cliente_CPF <> NEW.Cliente_CPF THEN
					SET Mensagem_v =  CONCAT("Cliente_CPF ", OLD.Cliente_CPF, " do pedido  ", NEW.Numero,  " modificado com ", Operacao_v, " para ", NEW.Cliente_CPF, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
                
				IF OLD.Funcionario_Matricula <> NEW.Funcionario_Matricula THEN
					SET Mensagem_v =  CONCAT("Funcionario_Matricula ", OLD.Funcionario_Matricula, " do pedido  ", NEW.Numero,  " modificado com ", Operacao_v, " para ", NEW.Funcionario_Matricula, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
			END //

DELIMITER // 
	CREATE TRIGGER criarLogDeletePedido
		BEFORE DELETE ON Pedido FOR EACH ROW
			BEGIN
				DECLARE Tabela_v VARCHAR(20);
				DECLARE Operacao_v VARCHAR(20);
				DECLARE DataLog_v DATE;
				DECLARE Mensagem_v VARCHAR(300);
				
				SET Tabela_v = "Pedido";
				SET Operacao_v = "Delete";
				SET DataLog_v = Now();
                
				SET Mensagem_v =  CONCAT("Item ", OLD.Numero, " apagado com ", Operacao_v, " na tabela ",  Tabela_v, "!");
				
				INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
			END //

-- Triggers da tabela Estoque
DELIMITER // 
	CREATE TRIGGER criarLogUpdateEstoque
		AFTER UPDATE ON Estoque FOR EACH ROW
        
			BEGIN
				DECLARE Tabela_v VARCHAR(20);
				DECLARE Operacao_v VARCHAR(20);
				DECLARE DataLog_v DATE;
				DECLARE Mensagem_v VARCHAR(300);
				
				SET Tabela_v = "Estoque";
				SET Operacao_v = "Update";
				SET DataLog_v = Now();
                
				IF OLD.Quant_Disp <> NEW.Quant_Disp THEN
					SET Mensagem_v =  CONCAT("Quant_Disp ", OLD.Quant_Disp, " do lote  ", NEW.Lote,  " modificado com ", Operacao_v, " para ", NEW.Quant_Disp, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
                
				IF OLD.Validade <> NEW.Validade THEN
					SET Mensagem_v =  CONCAT("Validade ", OLD.Validade, " do lote  ", NEW.Lote,  " modificado com ", Operacao_v, " para ", NEW.Validade, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
                
				IF OLD.Item_id <> NEW.Item_id THEN
					SET Mensagem_v =  CONCAT("Item_id ", OLD.Item_id, " do lote  ", NEW.Lote,  " modificado com ", Operacao_v, " para ", NEW.Item_id, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
			END //

DELIMITER // 
	CREATE TRIGGER criarLogDeleteEstoque
		BEFORE DELETE ON Estoque FOR EACH ROW
			BEGIN
				DECLARE Tabela_v VARCHAR(20);
				DECLARE Operacao_v VARCHAR(20);
				DECLARE DataLog_v DATE;
				DECLARE Mensagem_v VARCHAR(300);
				
				SET Tabela_v = "Estoque";
				SET Operacao_v = "Delete";
				SET DataLog_v = Now();
                
				SET Mensagem_v =  CONCAT("Item ", OLD.Lote, " apagado com ", Operacao_v, " na tabela ",  Tabela_v, "!");
				
				INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
			END //

-- Triggers da tabela Tipo_Pagamento
DELIMITER // 
	CREATE TRIGGER criarLogUpdateTipo_Pagamento
		AFTER UPDATE ON Tipo_Pagamento FOR EACH ROW
        
			BEGIN
				DECLARE Tabela_v VARCHAR(20);
				DECLARE Operacao_v VARCHAR(20);
				DECLARE DataLog_v DATE;
				DECLARE Mensagem_v VARCHAR(300);
				
				SET Tabela_v = "Tipo_Pagamento";
				SET Operacao_v = "Update";
				SET DataLog_v = Now();
                
				IF OLD.Tipo <> NEW.Tipo THEN
					SET Mensagem_v =  CONCAT("Tipo ", OLD.Tipo, " do pagamento  ", NEW.ID,  " modificado com ", Operacao_v, " para ", NEW.Tipo, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
			END //

DELIMITER // 
	CREATE TRIGGER criarLogDeleteTipo_Pagamento
		BEFORE DELETE ON Tipo_Pagamento FOR EACH ROW
			BEGIN
				DECLARE Tabela_v VARCHAR(20);
				DECLARE Operacao_v VARCHAR(20);
				DECLARE DataLog_v DATE;
				DECLARE Mensagem_v VARCHAR(300);
				
				SET Tabela_v = "Tipo_Pagamento";
				SET Operacao_v = "Delete";
				SET DataLog_v = Now();
                
				SET Mensagem_v =  CONCAT("Item ", OLD.ID, " apagado com ", Operacao_v, " na tabela ",  Tabela_v, "!");
				
				INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
			END //

-- Triggers da tabela Pedido_has_Estoque
DELIMITER // 
	CREATE TRIGGER criarLogUpdatePedido_has_Estoque
		AFTER UPDATE ON Pedido_has_Estoque FOR EACH ROW
        
			BEGIN
				DECLARE Tabela_v VARCHAR(20);
				DECLARE Operacao_v VARCHAR(20);
				DECLARE DataLog_v DATE;
				DECLARE Mensagem_v VARCHAR(300);
				
				SET Tabela_v = "Pedido_has_Estoque";
				SET Operacao_v = "Update";
				SET DataLog_v = Now();
                
				IF OLD.Lote <> NEW.Lote THEN
					SET Mensagem_v =  CONCAT("Lote ", OLD.Lote, " do PedidoEstoque  ", NEW.Numero,  " modificado com ", Operacao_v, " para ", NEW.Lote, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
                
				IF OLD.Quantidade <> NEW.Quantidade THEN
					SET Mensagem_v =  CONCAT("Quantidade ", OLD.Quantidade, " do PedidoEstoque  ", NEW.Numero,  " modificado com ", Operacao_v, " para ", NEW.Quantidade, " na tabela ",  Tabela_v, "!");
					INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
				END IF;
			END //

DELIMITER // 
	CREATE TRIGGER criarLogDeletePedido_has_Estoque
		BEFORE DELETE ON Pedido_has_Estoque FOR EACH ROW
			BEGIN
				DECLARE Tabela_v VARCHAR(20);
				DECLARE Operacao_v VARCHAR(20);
				DECLARE DataLog_v DATE;
				DECLARE Mensagem_v VARCHAR(300);
				
				SET Tabela_v = "Pedido_has_Estoque";
				SET Operacao_v = "Delete";
				SET DataLog_v = Now();
                
				SET Mensagem_v =  CONCAT("Item ", OLD.Numero, " apagado com ", Operacao_v, " na tabela ",  Tabela_v, "!");
				
				INSERT INTO Log_Operacoes(Tabela, DataLog, Mensagem) VALUES (Tabela_v, DataLog_v, Mensagem_v);
			END //

-- Segundo grupo de Triggers
-- Criando o banco de dados de Archive
USE FoodSnackAchive;

-- Criando as tabelas de Archive que vão armazenar o que for deletado do banco principal
CREATE TABLE IF NOT EXISTS ItemArchive (
	ID INT NOT NULL,
	Descricao VARCHAR(45) NOT NULL,
	Valor DOUBLE NOT NULL,
	Tipo_Item_id INT NOT NULL,
	PRIMARY KEY (ID));

CREATE TABLE IF NOT EXISTS FuncionarioArchive (
	Matricula INT NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Funcao VARCHAR(45) NOT NULL,
	CPF VARCHAR(11) NOT NULL,
	DataNasc DATE NOT NULL,
	PRIMARY KEY (Matricula));

CREATE TABLE IF NOT EXISTS ClienteArchive (
	CPF VARCHAR(11) NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Dta_nasc DATE NOT NULL,
	PRIMARY KEY (CPF));

CREATE TABLE IF NOT EXISTS PedidoArchive (
	Numero INT NOT NULL,
	Status_pedido VARCHAR(1) NOT NULL,
	Data_pedido DATE NOT NULL,
	Total_pedido DOUBLE NOT NULL,
	Cliente_CPF VARCHAR(11) NOT NULL,
	Funcionario_Matricula INT NOT NULL,
	PRIMARY KEY (Numero, Cliente_CPF, Funcionario_Matricula));
    
CREATE TABLE IF NOT EXISTS EstoqueArchive (
	Lote INT NOT NULL,
	Quant_Disp INT NOT NULL,
	Validade DATE NOT NULL,
	Item_id INT NOT NULL,
	PRIMARY KEY (Lote, Item_id));
    
USE FoodSnack;

DELIMITER // 
	CREATE TRIGGER criarArchiveDeleteItem
		BEFORE DELETE ON Item FOR EACH ROW
			BEGIN
				-- Inserindo os dados deletados do FoodSnack na tabela do Archive
				INSERT INTO FoodSnackAchive.Itemarchive(ID, Descricao, Valor, Tipo_Item_id) VALUES (OLD.ID, OLD.Descricao, OLD.Valor, OLD.Tipo_Item_id);
			END //

DELIMITER // 
	CREATE TRIGGER criarArchiveDeleteFuncionario
		BEFORE DELETE ON Funcionario FOR EACH ROW
			BEGIN
				INSERT INTO FoodSnackAchive.FuncionarioArchive(Matricula, Nome, Funcao, CPF, DataNasc) VALUES (OLD.Matricula, OLD.Nome, OLD.Funcao, OLD.CPF, OLD.DataNasc);
			END //

DELIMITER // 
	CREATE TRIGGER criarArchiveDeleteCliente
		BEFORE DELETE ON Cliente FOR EACH ROW
			BEGIN
				INSERT INTO FoodSnackAchive.ClienteArchive(CPF, Nome, Dta_nasc) VALUES (OLD.CPF, OLD.Nome, OLD.Dta_nasc);
			END //

DELIMITER // 
	CREATE TRIGGER criarArchiveDeletePedido
		BEFORE DELETE ON Pedido FOR EACH ROW
			BEGIN
				INSERT INTO FoodSnackAchive.PedidoArchive(Numero, Status_pedido, Data_pedido, Total_pedido, Cliente_CPF, Funcionario_Matricula) VALUES (OLD.Numero, OLD.Status_pedido, OLD.Data_pedido, OLD.Total_pedido, OLD.Cliente_CPF, OLD.Funcionario_Matricula);
			END //

DELIMITER // 
	CREATE TRIGGER criarArchiveDeleteEstoque
		BEFORE DELETE ON Estoque FOR EACH ROW
			BEGIN
				INSERT INTO FoodSnackAchive.EstoqueArchive(Lote, Quant_Disp, Validade, Item_id) VALUES (OLD.Lote, OLD.Quant_Disp, OLD.Validade, OLD.Item_id);
			END //
   
-- Terceiro grupo de Triggers
DELIMITER // 
	CREATE TRIGGER atualizarPrecoTotalInsert
		AFTER INSERT ON Pedido_has_Estoque FOR EACH ROW
			BEGIN
				DECLARE PrecoTotal_v DOUBLE;
                
				SET PrecoTotal_v = (SELECT SUM(Valor * Pedido_has_Estoque.Quantidade )  FROM Item, Estoque, Pedido_has_Estoque, Pedido 
						WHERE Estoque.Item_id = Item.ID 
                        AND Pedido_has_Estoque.Lote = Estoque.Lote 
                        AND Pedido_has_Estoque.Numero = Pedido.Numero
                        AND Pedido_has_Estoque.Numero = NEW.Numero
                        GROUP BY Pedido_has_Estoque.Numero);
                        
				UPDATE Pedido, Pedido_has_Estoque SET Pedido.Total_pedido = PrecoTotal_v WHERE Pedido.Numero = NEW.Numero;
			END //
         
DELIMITER // 
	CREATE TRIGGER atualizarPrecoTotalDelete
		BEFORE DELETE ON Pedido_has_Estoque FOR EACH ROW
			BEGIN
				DECLARE PrecoTotal_v DOUBLE;
                
				SET PrecoTotal_v = (SELECT SUM(Valor * Pedido_has_Estoque.Quantidade )  FROM Item, Estoque, Pedido_has_Estoque, Pedido 
						WHERE Estoque.Item_id = Item.ID 
                        AND Pedido_has_Estoque.Lote = Estoque.Lote 
                        AND Pedido_has_Estoque.Numero = Pedido.Numero
                        AND Pedido_has_Estoque.Numero = OLD.Numero
                        GROUP BY Pedido_has_Estoque.Numero);
                        
				UPDATE Pedido, Pedido_has_Estoque SET Pedido.Total_pedido = PrecoTotal_v WHERE Pedido.Numero = OLD.Numero;
			END //
       
DELIMITER // 
	CREATE TRIGGER atualizarPrecoTotalUpdate
		AFTER UPDATE ON Pedido_has_Estoque FOR EACH ROW
			BEGIN
				DECLARE PrecoTotal_v DOUBLE;
                
				SET PrecoTotal_v = (SELECT SUM(Valor * Pedido_has_Estoque.Quantidade )  FROM Item, Estoque, Pedido_has_Estoque, Pedido 
						WHERE Estoque.Item_id = Item.ID 
                        AND Pedido_has_Estoque.Lote = Estoque.Lote 
                        AND Pedido_has_Estoque.Numero = Pedido.Numero
                        AND Pedido_has_Estoque.Numero = NEW.Numero
                        GROUP BY Pedido_has_Estoque.Numero);
                        
				UPDATE Pedido, Pedido_has_Estoque SET Pedido.Total_pedido = PrecoTotal_v WHERE Pedido.Numero = NEW.Numero;
			END //
            
SELECT SUM(Valor * Pedido_has_Estoque.Quantidade ) FROM Item, Estoque, Pedido_has_Estoque, Pedido WHERE Estoque.Item_id = Item.ID 
																AND Pedido_has_Estoque.Lote = Estoque.Lote 
																AND Pedido_has_Estoque.Numero = Pedido.Numero 
                                                                AND Pedido_has_Estoque.Numero = "240423"
                                                                GROUP BY Pedido_has_Estoque.Numero;



