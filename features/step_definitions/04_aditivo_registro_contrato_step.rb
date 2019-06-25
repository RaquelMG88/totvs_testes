
#registro_aditivo_contrato_sucesso

Dado("que eu acesse o Registro de Aditivo do Contrato") do
  find("a[href='/eContrato/frmRegistroAditivoContrato.aspx']").click
end

Quando("não informar os dados do aditivo do contrato e clicar em Registrar Aditivo") do
  execute_script("window.scroll(0,350);")
  find("input[value=' Registrar Aditivo ']").click
  sleep 2
  page.driver.browser.switch_to.alert.accept
end

Então("o sistema deve exibir as mensagens de preenchimento obrigatório dos campos") do
  execute_script("window.scroll(0,350);")
  expect(page).not_to have_content "Data do Aditivo obrigatória."
  sleep 3
end

Quando("preencher todos os campos da proposta para Registar o Aditivo do Contrato") do
  "0-1-1-2-2-0-2-3".reverse!.split("-").each do |digito|
    find("input[name$=txtDtAditivo]").set digito
    sleep 3
  end

  find("input[value=' Registrar Aditivo ']").click
  page.driver.browser.switch_to.alert.accept
  sleep 5
end

Então("o aditivo é incluido com sucesso") do
  execute_script("window.scroll(0,350);")
  expect(page).to have_content "0030 - Registro do Aditivo do Contrato efetuado com sucesso."
  sleep 5
  find("img[id='wucMensagens1_imgFechar']").click
  sleep 6
end
