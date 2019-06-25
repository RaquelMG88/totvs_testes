#alteracao_registro_aditivo_contrato_sucesso
Dado("que eu acesse o  Alteração do Registro de Aditivo do Contrato") do
  find("a[href='/eContrato/frmAlteracaoContrato.aspx']").click
end

Quando("não informar os dados de alteração do registro de aditivo do contrato e clicar em Alterar Aditivo Contrato") do
  execute_script("window.scroll(0,350);")
  find("input[id='Body_btnRegistrarContrato']").click
  sleep 2
  page.driver.browser.switch_to.alert.accept
end

Dado("que eu preenche os campos desejados da proposta para Registar a Alteração do Aditivo do Contrato") do
  find("input[name$=txtNmAgente]").set "Tecnobank"
end

Então("a alteração do aditivo é alterado com sucesso") do
  execute_script("window.scroll(0,350);")
  expect(page).not_to have_content "0030 - Registro de Alteração do Aditivo do Contrato efetuado com sucesso."
  sleep 5
  find("img[id='wucMensagens1_imgFechar']").click
  sleep 6
end
