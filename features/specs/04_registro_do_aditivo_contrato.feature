#language: pt


@registro_aditivo_do_contrato
    Funcionalidade: Acesso a Plataforma de Registro de Aditivo de Contrato
        Ao acessar o sistema eContrato, efetivar as validações com
        referência ao Registro de Aditivo do Contrato 

Contexto: Acessar a Home da Plataforma
    Dado que eu esteja na tela inicial do Tecnobank
    Quando eu clicar no botão Acesse o Sistema
    E eu preencher os campos código e login com dados validos
    E informar minha senha de acesso depois clicar em Entrar

@validar_campos_aditivo
Cenário: Validação de campos do Registro de Aditivo do Contrato
    Dado que eu acesse o Registro de Aditivo do Contrato
    Quando informar o Estado, Chassi ou Placa do contrato
    E não informar os dados do aditivo do contrato e clicar em Registrar Aditivo
    Então o sistema deve exibir as mensagens de preenchimento obrigatório dos campos

@registro_aditivo_contrato_sucesso
Cenário: Inserir Novo Registro de Aditivo de Contrato
    Dado que eu acesse o Registro de Aditivo do Contrato
    Quando informar o Estado, Chassi ou Placa do contrato
    E preencher todos os campos da proposta para Registar o Aditivo do Contrato
    Então o aditivo é incluido com sucesso

   # Então o sistema deve exibir alerta de registro de aditivo para o chassi informado já existente 


	







