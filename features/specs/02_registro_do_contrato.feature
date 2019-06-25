#language: pt

@registro_do_contrato
    Funcionalidade: Acesso a Plataforma de Registro de Contrato
        Ao acessar o sistema eContrato, efetivar as validações com
        referência ao Resgistro do Contrato 

Contexto: Acessar a Home da Plataforma
    Dado que eu esteja na tela inicial do Tecnobank
    Quando eu clicar no botão Acesse o Sistema
    E eu preencher os campos código e login com dados validos
    E informar minha senha de acesso depois clicar em Entrar

@validar_campos
Cenário: Validação de campos do Registro do Contrato
    Dado que eu clique no botão Registro de Contrato
    Quando informar o Estado, Chassi ou Placa do contrato
    E não informar os campos do contrato do veiculo e clicar em Registrar Contrato
    Então o sistema exibe as mensagens de preenchimento obrigatório dos campos

@registro_contrato_sucesso
Cenário: Inserir Novo Registro de Contrato
    Dado que eu clique no botão Registro de Contrato
    Quando informar o Estado, Chassi ou Placa do contrato
    E preencher todos os campos da proposta para Registar o Contrato
    Então o contrato é incluido com sucesso
