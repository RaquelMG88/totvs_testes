# ================ CONSULTA DADOS INVALIDOS ========================

Quando("eu clicar no botão Consulta de Contrato") do
  find("a[href='/eContrato/frmConsultaStatusRegContrato.aspx']").click
end

Quando("preencher os dados de Consulta de Registro de Contrato com dados inválidos") do
  find("select[id='ddlUfPesquisa']").find("option", text: "SP").select_option
  find("select[id='Body_ddlOperacao']").find("option", text: "Registro de Contrato").select_option
  find("select[id='Body_ddlSituacaoRegistro']").find("option", text: "Ativo").select_option
  find("input[id='Body_txtNmCredor']").set "Mariaze"
  find("input[value='Chassi']").click
  find("input[id='Body_txtDsFiltro']").set "LTEMAGEM1303"
  find("input[id='Body_btnSolicitar']").click
  sleep 3
end

Então("o sistema deve exibir alerta de contrato não localizado") do
  expect(page).to have_content "Contrato não localizado pela chave informada."
  find("img[id='wucMensagens1_imgFechar']").click
end

# ================ CONSULTA REGISTRO DE CONTRATO ========================

Quando("eu clicar no botão Consulta Registro do Contrato") do
  find("a[href='/eContrato/frmConsultaStatusRegContrato.aspx']").click
end

Quando("informar os dados de Operação Registro de Contrato") do
  find("select[id='ddlUfPesquisa']").find("option", text: "SP").select_option
  find("select[id='Body_ddlOperacao']").find("option", text: "Registro de Contrato").select_option
  find("select[id='Body_ddlSituacaoRegistro']").find("option", text: "Ativo").select_option
  find("input[value='Chassi']").click
  find("input[id='Body_txtDsFiltro']").set "LTEMAGEM1303"
  find("input[id='Body_btnSolicitar']").click
  page.execute_script("$('iframe').hide();")
  execute_script('window.scroll(0,350);')
  sleep 3
end

Então("clicar no botão visualizar de um registro da lista") do
  execute_script("document.querySelector('#Body_gridProcesso_btnConsultar_0').click()")
end

Então("o sistema exibe a tela Consulta Registro de Contrato") do
  expect(page).to have_content "Consulta Registro de Contrato"
  sleep 3
end

# ============ GERA EXCEL ====================

Quando("clicar no botão Gerar Excel") do
  execute_script("document.querySelector('#Body_lnkExcel').click()")
  sleep 5
end

Então("o navegador faz o download do arquivo Consulta.xml") do
  #expect(page).to have_content
end

# ============ GERA IMPRESSAO ====================

Quando("clicar no botão Imprimir") do
  execute_script("document.querySelector('#imprimir > table > tbody > tr:nth-child(1) > td:nth-child(2) > a:nth-child(3)').click();")
  sleep 5
end

Então("o sistema exibe a tela padrão para imprimir o documento") do
  #expect(page).to have_content
end

