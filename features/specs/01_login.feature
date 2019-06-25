#language: pt

@login
    Funcionalidade: Validar Acesso ao Sistema Tecnobank
        Eu como usuário do site, desejo validar o comportamento 
        para realizar o login na plataforma

Contexto: Acessar o site do Tecnobank
    Dado que eu esteja na tela inicial do Tecnobank

@codigoinvalido
Cenário: Código Usuário Inválido
    Quando eu clicar no botão Acesse o Sistema 
    E preencher o campo código com dados inválidos
    Então o sistema deve exibir alerta de Código Inexistente  

@logininvalido
Cenário: Login Inválido
    Quando eu clicar no botão Acesse o Sistema 
    E preencher o campo login com dados inválidos
    Então o sistema deve exibir alerta de Usuário Inexistente 

@loginsucesso
Cenário: Login com Sucesso
    Quando eu clicar no botão Acesse o Sistema 
    E eu preencher os campos código e login com dados validos
    E informar minha senha de acesso depois clicar em Entrar
    Então deve exibir a home logada 

    




