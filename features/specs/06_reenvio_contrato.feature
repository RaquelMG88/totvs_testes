#language: pt
@reenvio_de_contrato
    Funcionalidade: Acesso a Plataforma de Reenvio de Contrato
        Ao acessar o sistema eContrato, efetivar as validações com
        referência ao Reenvio de Contrato

Contexto: Acessar a Home da Plataforma
    Dado que eu esteja na tela inicial do Tecnobank
    Quando eu clicar no botão Acesse o Sistema
    E eu preencher os campos código e login com dados validos
    E informar minha senha de acesso depois clicar em Entrar

@consulta_reenvio_registro_contrato
Cenário: Consulta de reenvio de contrato
    Dado que eu acesse o  Reenvio de Contrato
    Quando informar o tipo de operação,  Estado e Chassi ou Placa do contrato e consultar
    Então o sistema deve exibir o grid de resultado de busca

@reenvio_de_registro_contrato
Cenário: Reenvio de registro de contrato
    Dado que eu deseje reenviar contrato
    Quando eu verificar as informações do formulario de registro de contrato e clicar no botão registro de contrato
    Então o sistema deve exibir mensagem de sucesso




	







