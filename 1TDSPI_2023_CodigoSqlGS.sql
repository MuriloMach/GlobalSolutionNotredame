/*Inova X - RM:550790 Lucas dos Santos Lopes, RM:552258 Lais Alves da Silva Cruz,
RM:551823 Gustavo Marques Catelan, RM:550718 Murilo Machado, RM:97900 Victor Taborda Rodrigues*/
/*Na linha "drop table cliente cascade constraints," est� sendo utilizada para excluir a tabela chamada "cliente" caso ela j� exista. 
O "cascade constraints" garante que tudo que est� acoplado � tabela ser� exclu�do no processo.
Na linha seguinte, "create table cliente," estamos definindo a estrutura da tabela "cliente."
A coluna "idCliente" � do tipo varchar2 com no m�ximo 50 caracteres e � a chave prim�ria (pk) da tabela, 
garantindo que os valores sejam exclusivos em cada linha e n�o nulos.
A coluna "nomeCliente" � do tipo varchar2 com no m�ximo 50 caracteres e possui a restri��o "clie_nm_nn," que impede que o valor seja nulo. 
O mesmo se aplica � coluna "cpfCliente," que � do tipo varchar2 com no m�ximo 50 caracteres e tem a restri��o "clie_cpfcl_nn."
A coluna "enderecoCliente" � do tipo varchar2 com no m�ximo 100 caracteres e possui a restri��o "clie_endcl_nn" para garantir que n�o seja nulo, 
j� "generoCliente" � do tipo varchar2 com no m�ximo 20 caracteres e possui a restri��o "clie_gen_nn", agora
"email" � do tipo varchar2 com no m�ximo 100 caracteres e possui as restri��es "clie_ema_nn" para not null e "unique (uk)" 
para garantir que os valores sejam �nicos em toda a tabela.
Pen�ltima colun "senha" � do tipo varchar2 com no m�ximo 20 caracteres e possui a restri��o "clie_sen_nn" para garantir que n�o seja nulo, 
agora a �ltima coluna "idDispositivo" � do tipo varchar2 com no m�ximo 50 caracteres.
O comando "select * from cliente;" � utilizado para realizar consultas e exibir todos os registros da tabela "cliente."*/
drop table cliente cascade constraints;
create table cliente (idCliente varchar2(5) constraint clie_id_pk primary key,
                    nomeCliente varchar2(50) constraint clie_nm_nn not null,
                    cpfCliente varchar2(14) constraint clie_cpfcl_nn not null,
                    enderecoCliente varchar2(100) constraint clie_endcl_nn not null,
                    generoCliente varchar2(20) constraint clie_gen_nn not null,
                    email varchar2(100) constraint clie_ema_nn not null,
                    senha varchar2(20) constraint clie_sen_nn not null,
                    idDispositivo varchar2(5));
select * from cliente;
 
/*Aqui novamente fizemos o drop table caso a tabela "dispositivo" � exista ela possa ser excluida junto das restri��es que estiverem dentro dela.
Na segunda linha criamos a tabela "dispositivo e a primeira coluna que criamos foi "idDispositivo" com varchar2 e seu m�ximo � de 50 caracteres e sua restri��o
� not null. A segunda coluna � "cor" com varchar2, seu m�ximo � de 10 caracteres e sua restri��o � not null, a terceira coluna "dataFabricacao" com varchar2 e seu m�ximo � de 50 caracteres
e sua restri��o � not null; A quarta coluna � "statusDispositivo" do tipo varchar2, seu m�ximo � de 50 caracteres e sua restri��o not null para que n�o possa ser permitido conter valores nulos,
a quinta coluna e �ltima "versao" do tipo varchar2 com m�ximo de 50 caracteres e restri�ao not null.
Esse alter table ele executa a restri��o da chave prim�ria � tabela "dispositivo"
E por fim tem o select que � utilizado para realizar consultas e exibir todos os registros da tabela "diagnostico"*/
drop table dispositivo cascade constraints;
create table dispositivo (idDispositivo varchar2(5) constraint dis_id_nn not null,
                        cor varchar2(10) constraint dis_cor_nn not null,
                        dataFabricacao varchar2(10) constraint dis_fab_nn not null,
                        statusDispositivo varchar2(50) constraint dis_statd_nn not null,
                        versao varchar2(50) constraint dis_ver_nn not null);
alter table dispositivo add constraint dispositivo_pk primary key(idDispositivo);
select * from dispositivo;
 
/*Primeiro criamos o drop table para que seja excluido caso a tabela j� exista e o cascade constraints
ele exclui o que est� incluso na tabela(como chave estrangeiras) isso caso tenha tamb�m.
Ap�s isso criamos a tabela diagnostico, a primeira coluna � o "idDiagnostico" � varchar2, seu m�ximo � de 50 caracteres
al�m disso ela tem a restri��o de chave prim�ria, a segunda coluna que criamos � "estadoGeral" que � varchar2, seu m�ximo � de 200 caracteres e
sua restri��o nesse caso � not null.
A terceira coluna que foi criada � "sinaisVitais" ela � varchar2  e tem seu m�ximo de 150 caracteres, a quarta coluna criada foi "sinaisQueda" que � varchar2 e seu m�ximo de 150 caracteres tamb�m.
A quinta coluna se chama "dataSolicita��o" � varchar2 e o m�ximo de caracteres � 10, a sexta coluna que criamos foi dataEmiss�o que tamb�m varchar2 e seu m�ximo de 10 caracteres.
A tr�s colunas a seguir (idDispositivo,idCuidador e idServicoEmergencia) s�o chaves prim�rias de outras tabelas, que se tornam em diagnostico chaves estrangeiras, para que funcionem os alter tables abaixo depois da cria��o das tabelas,
� necess�rio colocar eles dentro da tabela que cont�m essas FK.
E por fim tem o select que � utilizado para realizar consultas e exibir todos os registros da tabela "diagnostico*/
drop table diagnostico cascade constraints;
create table diagnostico (idDiagnostico varchar2(5) constraint diag_id_pk primary key,
                        estadoGeral varchar2(200) constraint diag_est_nn not null,
                        sinaisVitais varchar2(150) constraint diag_sinv_nn not null,
                        sinaisQueda varchar2(150) constraint diag_sinq_nn not null,
                        dataSolicitacao varchar2(10) constraint diag_dts_nn not null,
                        dataEmissao varchar2(10) constraint diag_dte_nn not null,
                        idDispositivo varchar2(5),
                        idCuidador varchar2(5),
                        idServicoEmergencia varchar2(5));
select * from diagnostico;
/*Realizamos a exclus�o da tabela "cuidador" utilizando o comando "drop table cuidador cascade constraints". Esse comando remove a tabela e suas restri��es de forma que, se a tabela j� existir, ela ser� exclu�da, e as restri��es referentes a ela, como chaves estrangeiras (cascade constraints), tamb�m ser�o removidas.
Em seguida, criamos a tabela "cuidador" com diversas colunas. A primeira coluna � "idCuidador", do tipo varchar2, com um limite m�ximo de 50 caracteres. Essa coluna � designada como chave prim�ria, garantindo unicidade e n�o permitindo valores nulos, conforme a restri��o "cui_id_nn".
A segunda coluna � "nomeCuidador", do tipo varchar2, com um limite de 50 caracteres. Assim como a primeira, essa coluna n�o aceita valores nulos, conforme a restri��o "cui_nm_nn". A terceira coluna, "cpfCuidador", tamb�m do tipo varchar2 com um limite de 50 caracteres, � configurada com a restri��o "cui_cpfcu_nn" para garantir que n�o seja nulo.
A quarta coluna, "generoCuidador", � do tipo varchar2 com um limite de 20 caracteres, e sua restri��o "cui_gen_nn" assegura que o valor n�o seja nulo. A quinta coluna, "enderecoCuidador", � do tipo varchar2 com um limite de 100 caracteres e a restri��o "cui_endcua_nn" para impedir valores nulos.
A sexta coluna, "numTelefone", � do tipo number(20), representando um n�mero de telefone, e possui a restri��o "cui_tel_nn" para garantir que n�o seja nulo.
Ap�s a defini��o das colunas, adicionamos a restri��o de chave prim�ria � coluna "idCuidador" usando o comando "alter table cuidador add constraint cuidador_pk primary key(idCuidador)".
Por fim, exibimos todos os registros da tabela "cuidador" utilizando o comando "select * from cuidador". Essa consulta permite visualizar os dados armazenados na tabela "cuidador" e verificar se a cria��o da tabela e inser��o de dados ocorreu conforme o esperado.*/
drop table cuidador cascade constraints;
create table cuidador (idCuidador varchar2(5) constraint cui_id_nn not null,
                    nomeCuidador varchar2(50) constraint cui_nm_nn not null,
                    cpfCuidador varchar2(14) constraint cui_cpfcu_nn not null,
                    generoCuidador varchar2(20) constraint cui_gen_nn not null,
                    enderecoCuidador varchar2(100) constraint cui_endcua_nn not null,
                    numTelefone number(13) constraint cui_tel_nn not null);
alter table cuidador add constraint cuidador_pk primary key(idCuidador);
select * from cuidador;
 
/*Antes de criar a tabela `servicoEmergencia`, � executado um comando `drop table` para verificar se a tabela j� existe e, nesse caso, exclu�-la junto com todas as suas constraints (restri��es), utilizando a cl�usula `cascade constraints`. Esse procedimento visa garantir a integridade do ambiente de banco de dados. Em seguida, a tabela `servicoEmergencia` � criada com suas respectivas colunas e constraints.
A primeira coluna � denominada `idServicoEmergencia` e � do tipo `varchar2(100)`, com uma restri��o de chave prim�ria chamada `serv_id_pk`. Essa coluna serve como identificador �nico para cada registro na tabela. A segunda coluna � `tipoServicoEmergencia`, tamb�m do tipo `varchar2(100)`, com a restri��o `serv_tiser_nn`, garantindo que n�o seja atribu�do um valor nulo a essa coluna. A terceira coluna, chamada `tipoEmergencia`, � do tipo `varchar2(50)` com a restri��o `serv_tieme_nn`, assegurando que n�o haja valores nulos.
A quarta coluna, `gravidade`, � do tipo `varchar2(50)` com a restri��o `serv_gra_nn`, impedindo valores nulos. A quinta coluna, `medicoResponsavel`, � do tipo `varchar2(50)` e possui a restri��o `serv_medr_nn`, que garante a obrigatoriedade de um valor para essa coluna.
A tabela `servicoEmergencia` � projetada para armazenar informa��es relevantes sobre servi�os de emerg�ncia, como o tipo de servi�o, o tipo de emerg�ncia, a gravidade e o m�dico respons�vel.
A instru��o `select * from servicoEmergencia` � apresentada no final, permitindo a consulta e exibi��o de todos os registros presentes na tabela `servicoEmergencia`. Isso proporciona uma maneira de verificar e analisar os dados armazenados nessa tabela espec�fica.*/
drop table servicoEmergencia cascade constraints;
create table servicoEmergencia (idServicoEmergencia varchar2(5) constraint serv_id_pk primary key,
                                tipoServicoEmergencia varchar2(100) constraint serv_tiser_nn not null,
                                tipoEmergencia varchar2(50) constraint serv_tieme_nn not null,
                                gravidade varchar2(50) constraint serv_gra_nn not null,
                                medicoResponsavel varchar2(50) constraint serv_medr_nn not null);
select * from servicoEmergencia;
 
/*� realizado o procedimento de exclus�o da tabela "servicoManutencao" caso ela j� exista, utilizando o comando "drop table" com a op��o "cascade constraints" para remover todas as restri��es associadas. Em seguida, procede-se com a cria��o da tabela "servicoManutencao" com suas respectivas colunas e restri��es.
A primeira coluna, "idServicoManutencao", � do tipo varchar2 e possui no m�ximo 100 caracteres. Esta coluna � designada como chave prim�ria com a restri��o "manu_id_pk". A segunda coluna, "custo", � do tipo number(6,2), indicando um n�mero com no m�ximo 6 d�gitos, sendo 2 deles decimais. A restri��o "manu_cust_nn" assegura que este campo n�o pode ser nulo.
A terceira coluna, "tipoServicoManutencao", � do tipo varchar2, com um m�ximo de 100 caracteres, e a restri��o "manu_servm_nn" garante que este campo n�o pode ser nulo. A quarta coluna, "dataManutencao", � do tipo varchar2 e tem no m�ximo 10 caracteres. A restri��o "manu_dtma_nn" assegura que este campo n�o pode ser nulo.
A quinta coluna, "statusManutencao", � do tipo varchar2 e possui no m�ximo 50 caracteres. A restri��o "manu_statm_nn" garante que este campo n�o pode ser nulo. Por fim, a sexta coluna, "idDispositivo", � do tipo varchar2 e possui no m�ximo 50 caracteres.
� importante destacar que a coluna "idDispositivo" funciona como uma chave estrangeira, referenciando a tabela que cont�m a informa��o correspondente. Este relacionamento permite a integridade referencial entre as tabelas.
Ap�s a cria��o da tabela "servicoManutencao", � apresentado um comando "select" para exibir todos os registros dessa tabela, facilitando consultas e visualiza��o dos dados armazenados.*/
drop table servicoManutencao cascade constraints;
create table servicoManutencao (idServicoManutencao varchar2(5) constraint manu_id_pk primary key,
                                custo number(6,2) constraint manu_cust_nn not null,
                                tipoServicoManutencao varchar2(100) constraint manu_servm_nn not null,
                                dataManutencao varchar2(10) constraint manu_dtma_nn not null,
                                statusManutencao varchar2(50) constraint manu_statm_nn not null,
                                idDispositivo varchar2(5));
select * from servicoManutencao;
/*O primeiro alter table que � do "cliente" ele faz a restri��o da chave estrangeira � tabela "dispositivo",
a restri��o se chamar� "clie_dis_fk" e ela tem a ver com a coluna "idDispositivo" e est� fazendo refer�ncia na tabela "dispositivo".
Ou seja, na tabela "cliente" ir� conter valores que ter�o que existir na coluna "idDispositivo" da tabela "dispositivo".*/
alter table cliente add constraint clie_dis_fk foreign key(idDispositivo) references dispositivo(idDispositivo);
 
/*O segundo alter table que � do "diagnostico" ele faz a restri��o da chave estrangeira � tabela "dispositivo",
a restri��o se chamar� "diag_dis_fk" e ela tem a ver com a coluna "idDispositivo" e est� fazendo refer�ncia na tabela "dispositivo".
Ou seja, na tabela "diagnostico" ir� conter valores que ter�o que existir na coluna "idDispositivo" da tabela "dispositivo".*/
alter table diagnostico
add constraint diag_dis_fk
foreign key (idDispositivo) references dispositivo(idDispositivo);
 
/*O terceiro alter table que � do "diagnostico" ele faz a restri��o da chave estrangeira � tabela "cuidador",
a restri��o se chamar� "diag_cui_fk" e ela tem a ver com a coluna "idCuidador" e est� fazendo refer�ncia na tabela "cuidador".
Ou seja, na tabela "cuidador" ir� conter valores que ter�o que existir na coluna "idCuidador" da tabela "cuidador".*/
alter table diagnostico
add constraint diag_cui_fk
foreign key (idCuidador) references cuidador(idCuidador);
 
/*O quarto alter table que � do "diagnostico" ele faz a restri��o da chave estrangeira � tabela "servicoEmergencia",
a restri��o se chamar� "diag_serv_fk" e ela tem a ver com a coluna "idServicoEmergencia" e est� fazendo refer�ncia na tabela "servicoEmergencia".
Ou seja, na tabela "servicoEmergencia" ir� conter valores que ter�o que existir na coluna "idServicoEmergencia" da tabela "servicoEmergencia".*/
alter table diagnostico
add constraint diag_serv_fk
foreign key (idServicoEmergencia) references servicoEmergencia(idServicoEmergencia);
 
/*O quinto e �ltimo alter table que � do "servicoManutencao" ele faz a restri��o da chave estrangeira � tabela "dispositivo",
a restri��o se chamar� "manu_dis_fk" e ela tem a ver com a coluna "idDispositivo" e est� fazendo refer�ncia na tabela "dispositivo".
Ou seja, na tabela "dispositivo" ir� conter valores que ter�o que existir na coluna "idDispositivo" da tabela "dispositivo".*/
alter table servicoManutencao
add constraint manu_dis_fk
foreign key (idDispositivo) references dispositivo(idDispositivo);
 
 
/*Agora iremos adicionar valores nas colunas de cada tabela, a primeira � "dispositivo" e para isso utilizaremos o insert into.*/
 
insert into dispositivo (idDispositivo, cor, dataFabricacao, statusDispositivo, versao)
values('MACHP','marrom','01/10/2020','ativo','1.0');
 
insert into dispositivo (idDispositivo, cor, dataFabricacao, statusDispositivo, versao)
values('ZZZLO','azul','30/11/2022','ativo','2.3');
 
insert into dispositivo (idDispositivo, cor, dataFabricacao, statusDispositivo, versao)
values('DRTMA','vermelho','10/10/2021','inativo','1.2');
 
insert into dispositivo (idDispositivo, cor, dataFabricacao, statusDispositivo, versao)
values('SOPLK','amarelo' ,'09/07/2023','inativo','3.1');
 
insert into dispositivo (idDispositivo, cor, dataFabricacao, statusDispositivo, versao)
values('LUAWR','azul','12/12/2023','ativo','3.2');
 
insert into dispositivo (idDispositivo, cor, dataFabricacao, statusDispositivo, versao)
values('90IKH','roxo','11/11/2023','ativo','3.0');
 
insert into dispositivo (idDispositivo, cor, dataFabricacao, statusDispositivo, versao)
values('543LO','rosa','1/11/2019','inativo','1.1');
 
insert into dispositivo (idDispositivo, cor, dataFabricacao, statusDispositivo, versao)
values('42109','verde','1/11/2020','inativo','1.1');
 
insert into dispositivo (idDispositivo, cor, dataFabricacao, statusDispositivo, versao)
values('36670','preto','11/1/2024','ativo','4.0');
 
insert into dispositivo (idDispositivo, cor, dataFabricacao, statusDispositivo, versao)
values('LIYT3','preto','12/2/2024','ativo','4.1');
 
 
/*A segunda tabela � "cliente" e faremos outro insert into*/
insert into cliente (idCliente, nomeCliente, cpfCliente, enderecoCliente, generoCliente, email, senha, idDispositivo)
values('123SL','Welligtom Silva','987.654.321-09','Rua Ouro n50','Masculino','weve34@gmail.com','batman897','MACHP');
 
insert into cliente (idCliente, nomeCliente, cpfCliente, enderecoCliente, generoCliente, email, senha, idDispositivo)
values('243KH','Jo�o Pedro Reis','445.888.123-99','Rua Buzios','Masculino','joazinho@gmail.com','lelo9091','ZZZLO');
 
insert into cliente (idCliente, nomeCliente, cpfCliente, enderecoCliente, generoCliente, email, senha, idDispositivo)
values('434LL','Luciana de Paula','678.980.666-10','Avenida Faria Lima','Feminino','lulu@gmail.com','spiderjack','DRTMA');
 
insert into cliente (idCliente, nomeCliente, cpfCliente, enderecoCliente, generoCliente, email, senha, idDispositivo)
values('558MK','Samuel Teixeira','479.345.779-24','Avenida Padre Vincente Melillo','Masculino','samy@gmail.com','samuca2425','SOPLK');
 
insert into cliente (idCliente, nomeCliente, cpfCliente, enderecoCliente, generoCliente, email, senha, idDispositivo)
values('213DD','Marinete Silveira','654.321.098-76','Rua marapes, n100','Feminino','marinete@yahoo.com','barbie4567','LUAWR');
 
insert into cliente (idCliente, nomeCliente, cpfCliente, enderecoCliente, generoCliente, email, senha, idDispositivo)
values('447SS','Luis Campos Ramalho','876.543.210-98','Rua Borba Gato, n99','Masculino','ramalho34@yahoo.com','cr7goat00','90IKH');
 
insert into cliente (idCliente, nomeCliente, cpfCliente, enderecoCliente, generoCliente, email, senha, idDispositivo)
values('789GL','Gustavo Marques','543.210.987-65','Rua Augusta, n180','Masculino','gugu1234@gmail.com','messifraco','543LO');
 
insert into cliente (idCliente, nomeCliente, cpfCliente, enderecoCliente, generoCliente, email, senha, idDispositivo)
values('889WQ','Kaique Oliveira','123.745.785-98','Rua Jap�o 81','Masculino','kzth23@gmail.com','neymar9000','42109');
 
insert into cliente (idCliente, nomeCliente, cpfCliente, enderecoCliente, generoCliente, email, senha, idDispositivo)
values('007IU','Arthur Degan','123.456.789-00','Parque dos Principes, n77','Masculino','art98@gmail.com','98parmera','36670');
 
insert into cliente (idCliente, nomeCliente, cpfCliente, enderecoCliente, generoCliente, email, senha, idDispositivo)
values('3359H','Natalia Maiara','765.432.109-87','Itaim Bibi 766','Feminino','natyff@gmail.com','barbiezinha','LIYT3');
 
 
/*A terceira tabela � "cuidador" e faremos outro insert into*/
insert into cuidador (idCuidador, nomeCuidador, cpfCuidador, generoCuidador, enderecoCuidador, numTelefone)
values('0LI90','Carlos Santos', '111.222.333-44', 'Masculino','Rua Croata ,43', 9876543210);
 
insert into cuidador (idCuidador, nomeCuidador, cpfCuidador, generoCuidador, enderecoCuidador, numTelefone)
values('ERT88','Maria Oliveira', '012.123.234-45', 'Feminino','Rua Venezuela, 55', 1112223334);
 
insert into cuidador (idCuidador, nomeCuidador, cpfCuidador, generoCuidador, enderecoCuidador, numTelefone)
values('BRY54','Josefina Silva','345.456.567-78','Feminino','Rua Estados Unidos, 34', 8765432109);
 
insert into cuidador (idCuidador, nomeCuidador, cpfCuidador, generoCuidador, enderecoCuidador, numTelefone)
values ('JQA33','Jurisvaldo Pedro','789.890.901-12','Masculino','Avenida Paulista, 332',5551234567);
 
insert into cuidador (idCuidador, nomeCuidador, cpfCuidador, generoCuidador, enderecoCuidador, numTelefone)
values ('KIS67','Jos� Roberto Machado','567.678.789-90','Masculino','Avenida Cruzes,98',6667778888);
 
insert into cuidador (idCuidador, nomeCuidador, cpfCuidador, generoCuidador, enderecoCuidador, numTelefone)
values ('FGH32','Dirce Polastro Machado','322.433.544-65','Feminino','Avenida Valadares',9071234567);
 
insert into cuidador (idCuidador, nomeCuidador, cpfCuidador, generoCuidador, enderecoCuidador, numTelefone)
values ('HYOL4','Larissa Alves','234.345.456-54','Feminino','Rua Limoeiro 76',4443332222);
 
insert into cuidador(idCuidador, nomeCuidador, cpfCuidador, generoCuidador, enderecoCuidador, numTelefone)
values ('LQZP9','Murilo Machado','888.654.321-09','Masculino','Rua Lavoeira 95',9990001111);
 
insert into cuidador(idCuidador, nomeCuidador, cpfCuidador, generoCuidador, enderecoCuidador, numTelefone)
values ('REY88','Jonathan Pereira','909.876.245-55','Masculino','Rua Patricios, 89',7778889999);
 
insert into cuidador(idCuidador, nomeCuidador, cpfCuidador, generoCuidador, enderecoCuidador, numTelefone)
values ('TTU90','Marcos Valdo','776.843.980-43','Masculino','Rua Jerus�lem, 95',5552224444);
 
 
 
 
 
/*A quarta tabela � "servicoEmergencia" e faremos outro insert into*/
insert into servicoEmergencia (idServicoEmergencia, tipoServicoEmergencia, tipoEmergencia, gravidade, medicoResponsavel)
values ('9871','Traumatologista','Quebrou o bra�o direito','Grave','Derek Luccas');
 
insert into servicoEmergencia (idServicoEmergencia, tipoServicoEmergencia, tipoEmergencia, gravidade, medicoResponsavel)
values ('67531','Ortopedista','Tor��o no p� direito','M�dia','Micael Bastos');
 
insert into servicoEmergencia (idServicoEmergencia, tipoServicoEmergencia, tipoEmergencia, gravidade, medicoResponsavel)
values ('43219','Cardiologista','Batimentos card�acos muito alto','M�dia','Rafael Lima');
 
insert into servicoEmergencia (idServicoEmergencia, tipoServicoEmergencia, tipoEmergencia, gravidade, medicoResponsavel)
values ('55699','Ortopedista','Fratura na clav�cula','Grave','Paulo Andreolli');
 
insert into servicoEmergencia (idServicoEmergencia, tipoServicoEmergencia, tipoEmergencia, gravidade, medicoResponsavel)
values ('98032','Clinico Geral','Escorregou e ralou o bra�o','Baixa','Matheus Silva');
 
insert into servicoEmergencia (idServicoEmergencia, tipoServicoEmergencia, tipoEmergencia, gravidade, medicoResponsavel)
values ('00865','Ortopedista em Quadril','Escorregou e fraturou a bacia','Grave','Leonardo Campos');
 
insert into servicoEmergencia (idServicoEmergencia, tipoServicoEmergencia, tipoEmergencia, gravidade, medicoResponsavel)
values ('68801','Traumatologista','Fratura exposta na perna','Grave','Rodrigo Apim');
 
insert into  servicoEmergencia (idServicoEmergencia, tipoServicoEmergencia, tipoEmergencia, gravidade, medicoResponsavel)
values ('76780','Neurologista','Caiu e ocorreu trauma craniano','Grave','Henrique Lopes');
 
insert into  servicoEmergencia (idServicoEmergencia, tipoServicoEmergencia, tipoEmergencia, gravidade, medicoResponsavel)
values ('00077','Clinico Geral','Queimaduras leves no bra�o','Baixa','Yago Martins');
 
insert into  servicoEmergencia (idServicoEmergencia, tipoServicoEmergencia, tipoEmergencia, gravidade, medicoResponsavel)
values ('09854','Cardiologista','Parada Card�aca','Grave','Filipe Alves');
 
 
 
/*A quinta tabela � "servicoManutencao" e faremos outro insert into*/
insert into servicoManutencao (idServicoManutencao,custo,tipoServicoManutencao, dataManutencao, statusManutencao, idDispositivo)
values('QSA33',150.00,'Trincou a lente do aparelho e consequentemente o touch parou de funcionar','12/03/2021','Conclu�da','MACHP');
 
insert into servicoManutencao (idServicoManutencao,custo,tipoServicoManutencao, dataManutencao, statusManutencao, idDispositivo)
values('DFG45',200.50,'Quebra da lente do aparelho','13/11/2023','Em andamento','ZZZLO');
 
insert into servicoManutencao (idServicoManutencao,custo,tipoServicoManutencao, dataManutencao, statusManutencao, idDispositivo)
values('FFG90',75.20,'Entrou �gua al�m do recomend�vel','15/11/2022','Conclu�da','DRTMA');
 
insert into servicoManutencao (idServicoManutencao,custo,tipoServicoManutencao, dataManutencao, statusManutencao, idDispositivo)
values('GHJ00',120.75,'Pegou fogo o aparelho','18/11/2023','Pendente','SOPLK');
 
insert into servicoManutencao (idServicoManutencao,custo,tipoServicoManutencao, dataManutencao, statusManutencao, idDispositivo)
values('KJL88',90.00,'Encaixe regulador do pulso quebrou','30/11/2022','Conclu�da','LUAWR');
 
insert into servicoManutencao (idServicoManutencao,custo,tipoServicoManutencao, dataManutencao, statusManutencao, idDispositivo)
values('LOP56',180.25,'Pulseira do aparelho rasgou','09/11/2023','Em andamento','90IKH');
 
insert into servicoManutencao (idServicoManutencao,custo,tipoServicoManutencao, dataManutencao, statusManutencao, idDispositivo)
values('RET65',110.50,'Quebra da lente do aparelho','17/10/2023','Conclu�da','543LO');
 
insert into servicoManutencao (idServicoManutencao,custo,tipoServicoManutencao, dataManutencao, statusManutencao, idDispositivo)
values('MKL12',95.80,'Touch screen do aparelho para acionar emerg�ncia parou de funcionar','01/08/2023','Pendente','42109');
 
insert into servicoManutencao (idServicoManutencao,custo,tipoServicoManutencao, dataManutencao, statusManutencao, idDispositivo)
values('WSW87',160.00,'Troca de pulseira do aparelho','12/10/2023','Conclu�da','36670');
 
insert into servicoManutencao (idServicoManutencao,custo,tipoServicoManutencao, dataManutencao, statusManutencao, idDispositivo)
values('RTY98',75.50,'Troca de lente do aparelho','04/04/2023','Em andamento','LIYT3');
 
 
/*A sexta tabela � "diagnostico" e faremos outro insert into*/
insert into diagnostico (idDiagnostico, estadoGeral, sinaisVitais, sinaisQueda, dataSolicitacao, dataEmissao, idDispositivo, idCuidador, idServicoEmergencia)
values ('PP668', 'Est�vel', 'Pulso regular, Press�o arterial normal', 'Sem sinais de queda', '05/12/2023', '06/12/2023', 'MACHP', '0LI90', '9871');
 
insert into diagnostico (idDiagnostico, estadoGeral, sinaisVitais, sinaisQueda, dataSolicitacao, dataEmissao, idDispositivo, idCuidador, idServicoEmergencia)
values ('AS907', 'Est�vel', 'Pulso regular, Press�o arterial normal', 'Sem sinais de queda', '01/12/2023', '02/12/2023', 'ZZZLO', 'ERT88', '67531');
 
insert into diagnostico (idDiagnostico, estadoGeral, sinaisVitais, sinaisQueda, dataSolicitacao, dataEmissao, idDispositivo, idCuidador, idServicoEmergencia)
values ('QWR56', 'Inst�vel', 'Pulso irregular, Press�o arterial baixa', 'Sem sinais de queda', '15/10/2023', '16/10/2023', 'DRTMA', 'BRY54', '43219');
 
insert into diagnostico (idDiagnostico, estadoGeral, sinaisVitais, sinaisQueda, dataSolicitacao, dataEmissao, idDispositivo, idCuidador, idServicoEmergencia)
values ('HFV56', 'Est�vel', 'Pulso regular, Press�o arterial normal', 'Sinais de queda detectados', '10/07/2023', '11/07/2023', 'SOPLK', 'JQA33', '55699');
 
insert into diagnostico (idDiagnostico, estadoGeral, sinaisVitais, sinaisQueda, dataSolicitacao, dataEmissao, idDispositivo, idCuidador, idServicoEmergencia)
values ('JKPO7', 'Est�vel', 'Pulso regular, Press�o arterial normal', 'Sem sinais de queda', '15/12/2023', '16/12/2023', 'LUAWR', 'KIS67', '98032');
 
insert into diagnostico (idDiagnostico, estadoGeral, sinaisVitais, sinaisQueda, dataSolicitacao, dataEmissao, idDispositivo, idCuidador, idServicoEmergencia)
values ('CTR6K', 'Inst�vel', 'Pulso irregular, Press�o arterial alta', 'Sinais de queda detectados', '13/11/2023', '14/11/2023', '90IKH', 'FGH32', '00865');
 
insert into diagnostico (idDiagnostico, estadoGeral, sinaisVitais, sinaisQueda, dataSolicitacao, dataEmissao, idDispositivo, idCuidador, idServicoEmergencia)
values ('DSAI5', 'Est�vel', 'Pulso regular, Press�o arterial normal', 'Sem sinais de queda', '01/11/2023', '02/11/2023', '543LO', 'HYOL4', '68801');
 
insert into diagnostico (idDiagnostico, estadoGeral, sinaisVitais, sinaisQueda, dataSolicitacao, dataEmissao, idDispositivo, idCuidador, idServicoEmergencia)
values ('HJUN3', 'Inst�vel', 'Pulso irregular, Press�o arterial baixa', 'Sinais de queda detectados', '01/11/2022', '02/11/2022', '42109', 'LQZP9', '76780');
 
insert into diagnostico (idDiagnostico, estadoGeral, sinaisVitais, sinaisQueda, dataSolicitacao, dataEmissao, idDispositivo, idCuidador, idServicoEmergencia)
values ('TYZX2', 'Est�vel', 'Pulso regular, Press�o arterial normal', 'Sem sinais de queda', '15/02/2024', '16/02/2024', '36670', 'REY88', '00077');
 
insert into diagnostico (idDiagnostico, estadoGeral, sinaisVitais, sinaisQueda, dataSolicitacao, dataEmissao, idDispositivo, idCuidador, idServicoEmergencia)
values ('FGB77', 'Est�vel', 'Pulso regular, Press�o arterial normal', 'Sem sinais de queda', '16/02/2024', '17/02/2024', 'LIYT3', 'TTU90', '09854');
 
 
/*O primeiro relat�rio, faz uma consulta em uma tabela chamada "cuidador". Ele est� filtrando os resultados
para incluir apenas as linhas onde o valor da coluna "generoCuidador" seja igual a
"Feminino". Ou seja, os resultados s�o ordenados em ordem decrescente com base na coluna "nomeCuidador". 
Portanto, o relat�rio est� buscando todos os registros de cuidadores do sexo feminino e mostra em ordem alfab�tica.*/
select * from cuidador
where generoCuidador = 'Feminino'
order by nomeCuidador ASC;


/*Esse segundo relat�rio faz uma rela��o entre duas tabelas: "dispositivo" e "servicoManutencao".
E esse select inclui colunas espec�ficas das duas tabelas, como id do Dispositivo, cor, data de fabrica��o, id do Servi�o de manuten��o,
custo, tipo de servi�o de manuten��o e data de manuten��o. O join � utilizado para combinar registros onde o ID do dispositivo � igual ao ID do dispositivo 
na tabela de servi�o de manuten��o.*/
select dispositivo.idDispositivo, dispositivo.cor, dispositivo.dataFabricacao,
       servicoManutencao.idServicoManutencao, servicoManutencao.custo,
       servicoManutencao.tipoServicoManutencao, servicoManutencao.dataManutencao
from dispositivo
join servicoManutencao on dispositivo.idDispositivo = servicoManutencao.idDispositivo
order by dispositivo.idDispositivo asc;

/*O terceiro relat�rio mostra a coluna "cor" da tabela "dispositivo" e conta o n�mero de registros na tabela "diagn�stico"
agrupados pela cor do dispositivo. O Join � usado para juntar as linhas das duas tabelas 
onde os IDs dos dispositivos correspondem. No final � uma lista que mostra a cor de cada dispositivo e o n�mero de diagn�stico 
associados a cada cor.*/
select d.cor as cor_dispositivo, count(di.idDiagnostico) as num_diagnosticos
from dispositivo d
join diagnostico di on d.idDispositivo = di.idDispositivo
group by d.cor;


/*O �ltimo relat�rio pega o nome do cliente e a m�dia do custo de servi�os de manuten��o,
para clientes que tem m�dia acima de 100. Esse relat�rio puxa informa��es de "cliente", "diagnostico","dispositivo" e "servicoManutencao"
,juntando atrav�s do join e seu resultado � agrupado atrav�s do group by. Por fim o filtro having � utilizado como filtro para os resultados que ser�o agrupados,
podendo que voc� especifique as condi��es para incluir ou excluir os grupos com base nos valores agregados e os grypos que n�o atendam essa condi��o s�o excluidos no final da
consulta.
E o commit no fim do c�digo para confirmar todas as transa��es pendentes no banco de dados e tornar permanente.*/
SELECT
  cliente.nomeCliente,
  AVG(servicoManutencao.custo) AS avg_custo_manutencao
FROM
  cliente
JOIN
  dispositivo ON cliente.idDispositivo = dispositivo.idDispositivo
JOIN
  diagnostico ON dispositivo.idDispositivo = diagnostico.idDispositivo
JOIN
  servicoManutencao ON dispositivo.idDispositivo = servicoManutencao.idDispositivo
GROUP BY
  cliente.nomeCliente
HAVING
  AVG(servicoManutencao.custo) > 100;

commit;