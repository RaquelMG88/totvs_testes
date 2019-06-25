#language: pt
@alteracao_registro_aditivo_do_contrato
    Funcionalidade: Acesso a Plataforma de Alteração de Registro de Aditivo de Contrato
        Ao acessar o sistema eContrato, efetivar as validações com
        referência ao Registro de Alteração de Aditivo do Contrato 

Contexto: Acessar a Home da Plataforma
    Dado que eu esteja na tela inicial do Tecnobank
    Quando eu clicar no botão Acesse o Sistema
    E eu preencher os campos código e login com dados validos
    E informar minha senha de acesso depois clicar em Entrar

@validar_campos_altaracao_aditivo
Cenário: Validação de campos de Alteração Registro de Aditivo do Contrato
    Dado que eu acesse o  Alteração do Registro de Aditivo do Contrato
    Quando informar o Estado, Chassi ou Placa do contrato e alterar 
    E informar o tipo de alteração 
    E não informar os dados de alteração do registro de aditivo do contrato e clicar em Alterar Aditivo Contrato
    Então o sistema deve exibir as mensagens de preenchimento obrigatório dos campos

@alteracao_registro_aditivo_contrato_sucesso
Cenário: Inserir Alteração Registro de Aditivo do Contrato
    Dado que eu preenche os campos desejados da proposta para Registar a Alteração do Aditivo do Contrato
    Então a alteração do aditivo é alterado com sucesso

   # Então o sistema deve exibir alerta de registro de aditivo para o chassi informado já existente 


	







