<h3>DOCUMENTAÇÃO DO PROJETO<h3>

Estruturação de projeto de banco de dados para revendedora de veículos

:pushpin:**Modelo conceitual:**

**1. Requisitos de usuário:**

**Gestão de veículos:**

Adicionar novos carros ao estoque,

Visualizar os carros disponíveis,

Atualizar informações sobre os carros

**Gestão de clientes:**

Acessar informações clientes interessados,

Adicionar novos clientes,

Visualizar histórico de compras de cliente,

**Gestão de vendas:**

Registrar novas vendas,

Acompanhar desempenho de vendas ao longo do tempo,

Visualizar relatórios sobre transações concluídas.



<h6>Processo de compra de veículo:</h6>

O usuário cadastra um cliente interessado em vender um veículo. A loja avalia as condições do mesmo e firma o contrato com o cliente dono do veículo. A loja anuncia o veículo pelo valor que foi acordado com o proprietário.

<h6>Processo de venda de veículo:</h6>

O usuário cadastra um cliente interessado em comprar um veículo. Define-se o método de pagamento, que pode ser financiamento ou outro veículo como parte do pagamento.



:pushpin:**Modelo lógico:** Entidade, atributos e Relacionamentos

- Entidade Cliente:

​	Atributos: idcliente (PK,NN,AI), nome, cpf , email ,telefone, id_endereço (FK). 

- Entidade Endereço:

  Atributos: idendereco (PK,NN,AI), cep, Rua, bairro, cidade, uf.

- Entidade Conta:

  Atributos: idconta(PK), agencia, banco, id_cliente (FK).

- Entidade Negociação: 

  Atributos: idnegocio (PK,NN,AI), valor_venda, valor_compra_valor_fipe, id_veiculo (FK: id_veiculo), id_cliente (FK), valor_entrada, quantidade_parcela, valor_parcela.

- Entidade Veículo:

  Atributos: idveiculo (PK_NN_AI)marca, modelo, ano, km, renavam, cor, placa

- Entidade Pagamento: 

  Atributos: idpagamenti(PK,NN,AI)data_contrato,  validade, id_cliente (FK), id_negocio(FK).

- Entidade Contrato:  idcontrato, data_contrato, validade, id_cliente (FK), id_negocio(FK).

- Manutenção: idmanutencao(PK,NN,AI), Valor_manutenção, data_manutenção, descrição_manutenção, id_veiculo (FK).



:pushpin:**Modelo físico:**

SGDB: MySQL

