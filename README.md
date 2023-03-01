# CARLOCA_mySQL
Projeto do Módulo de Banco de Dados do Programa SINQIA #dev_makers2 - Let's Code by ADA


A Locação é iniciada na Tabela 'T310_Retirada_Veículo' e dispara uma trigger que cria uma linha referente à operação na 'T300_Historico_locacao'.
Devem ser fornecidos o id do cliente, do carro e da loja onde o veículo foi retirado. 
A data e hora do momento da retirada são geradas automaticamente pelo SGBD.
A km do veículo é preenchida automaticamente, lida da tabela 'T100_Carros'.
O véiculo é listado como "indisponível" e o cliente é listado como "com_carro" enquanto o locacao_status estiver "em_curso".


A Locação é finalizada na 'T300_Historico_locacao'. 
Deve ser fornecida a km final no momento da devolução do carro, bem como o id da loja onde foi retornado o veículo.
A km fornecida atualiza a km_atual do veículo na tabela 'T100_Carros'.
A data e hora do momento da devolução são geradas automaticamente pelo SGBD.
O veículo torna-se novamente "disponível" e o cliente "sem carro" quando o locacao_status passa para "finalizada".
