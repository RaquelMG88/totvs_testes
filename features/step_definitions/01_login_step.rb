# ==================== LOGIN ==========================

Dado("que eu esteja na tela inicial do Tecnobank") do
  visit "http://homologacao.tecnobank.com.br"
end

Quando("eu clicar no botão Acesse o Sistema") do
  find("a[href='/Login']").click
end

Quando("preencher o campo código com dados inválidos") do
  find("input[id='txtCdEntidade']").set "000"
  find("input[id='txtLogin']").set "rmendes"
  find("button[class='btn btn-lg btn-login']").click
end

Então("o sistema deve exibir alerta de Código Inexistente") do
  expect(page).to have_content "Código Inexistente. Contate o suporte para maiores informações."
  sleep 3
end

Quando("preencher o campo login com dados inválidos") do
  find("input[id='txtCdEntidade']").set "1001"
  find("input[id='txtLogin']").set "rmendss"
  find("button[class='btn btn-lg btn-login']").click
end

Então("o sistema deve exibir alerta de Usuário Inexistente") do
  expect(page).to have_content "Usuário Inexistente. Contate o suporte para maiores informações."
  sleep 3
end

Quando("eu preencher os campos código e login com dados validos") do
  find("input[id='txtCdEntidade']").set "1001"
  find("input[id='txtLogin']").set "rmendes"
  find("button[class='btn btn-lg btn-login']").click
end

Quando("informar minha senha de acesso depois clicar em Entrar") do
  find("input[value='2']").click
  find("input[value='3']").click
  find("input[value='0']").click
  find("input[value='4']").click
  find("input[value='1']").click
  find("input[value='6']").click
  find("input[id='Body_btnEntrar']").click
  page.execute_script("$('.bootbox-close-button').click();")
end

Então("deve exibir a home logada") do
  page.execute_script("$('iframe').hide();")
  expect(page).to have_content "Seja bem vindo,"
  sleep 3
end
