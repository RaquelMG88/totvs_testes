#language: pt

@consulta_do_contrato
    Funcionalidade: Acesso a Plataforma de Consulta Registro do Contrato
        Ao acessar o sistema eContrato, efetivar as validações com
        validação na Consulta Registro do Contrato 

Contexto: Acessar a Home da Plataforma
    Dado que eu esteja na tela inicial do Tecnobank
    Quando eu clicar no botão Acesse o Sistema
    E eu preencher os campos código e login com dados validos
    E informar minha senha de acesso depois clicar em Entrar

@consultainvalida
Cenário: Consulta de Registro de Contrato com dados inválidos
    Quando eu clicar no botão Consulta Registro do Contrato
    E preencher os dados de Consulta de Registro de Contrato com dados inválidos
    Então o sistema deve exibir alerta de contrato não localizado

@visualizarcontrato
Cenário: Visualizar Registro do Contrato 
    Quando eu clicar no botão Consulta Registro do Contrato
    E informar os dados de Operação Registro de Contrato
    E clicar no botão visualizar de um registro da lista
    Então o sistema exibe a tela Consulta Registro de Contrato

@gerarexcel
Cenário: Gerar Relatório Excel
    Quando eu clicar no botão Consulta Registro do Contrato
    E informar os dados de Operação Registro de Contrato
    E clicar no botão Gerar Excel
    Então o navegador faz o download do arquivo Consulta.xml

@gerarimpressao
Cenário: Gerar Impressão do Contrato
    Quando eu clicar no botão Consulta Registro do Contrato
    E informar os dados de Operação Registro de Contrato
    Quando clicar no botão Imprimir
    Então o sistema exibe a tela padrão para imprimir o documento 
  



