Dado("que eu acesse o  Reenvio de Contrato") do
  find("a[href='/EContrato/frmReenvioContrato.aspx']").click
end

Quando("informar o tipo de operação,  Estado e Chassi ou Placa do contrato e consultar") do
  find("select[id='Body_ddlOperacao']").find("option", text: "Registro de Contrato").select_option
  find("select[id='Body_ddlDsUf']").find("option", text: "SP").select_option
  find("input[id='Body_txtDsFiltro']").set "5015/220"
  find("input[id='Body_btnConsultar']").click
end

Então("o sistema deve exibir o grid de resultado de busca") do
  page.execute_script("$('iframe').hide();")
  execute_script("window.scroll(0,350);")
  sleep 3
end

Dado("que eu deseje reenviar contrato") do
  find("input[name$=btnReenviar]").click
end

Quando("eu verificar as informações do formulario de registro de contrato e clicar no botão registro de contrato") do
  find("input[value=' Registrar Contrato ']").click
  page.driver.browser.switch_to.alert.accept
  sleep 5
end

Então("o sistema deve exibir mensagem de sucesso") do
  execute_script("window.scroll(0,350);")
  expect(page).not_to have_content "0030 - Contrato reenviado com sucesso."
  sleep 5
  find("img[id='wucMensagens1_imgFechar']").click
  sleep 6
end
