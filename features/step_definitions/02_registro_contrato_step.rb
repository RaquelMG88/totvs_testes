# ================== VALIDACAO DE CAMPOS ==========================

Dado("que eu clique no botão Registro de Contrato") do
  find("a[href='/eContrato/frmRegistroContrato.aspx']").click
end

Quando("informar o Estado, Chassi ou Placa do contrato") do
  find("select[id='Body_ddlDsUf']").find("option", text: "SP").select_option
  sleep 2
  find("input[id='Body_txtDsFiltro']").set "AKBBJMLCAPXTMJZW" #LTEMAGEM1303 #STUCZHERXNFLFS
  find("input[id='Body_btnPesquisarGravame']").click
  sleep 2
end

Quando("não informar os campos do contrato do veiculo e clicar em Registrar Contrato") do
  execute_script("window.scroll(0,350);")
  find("input[value=' Registrar Contrato ']").click
  sleep 2
  page.driver.browser.switch_to.alert.accept
end

Então("o sistema exibe as mensagens de preenchimento obrigatório dos campos") do
  execute_script("window.scroll(0,350);")
  expect(page).to have_content "Data do Contrato obrigatória."
  expect(page).to have_content "Qtde de meses obrigatória."
  expect(page).to have_content "Preencha uma Taxa de juros de mora válida."
  expect(page).to have_content "Preencha uma Taxa de juros de multa válida."
  expect(page).to have_content "Índice obrigatório."
  expect(page).to have_content "Valor comissão obrigatório."
  expect(page).to have_content "Descrição da penalidade obrigatório."
  expect(page).to have_content "Valor total da dívida obrigatório."
  expect(page).to have_content "Data liberação do crédito obrigatória."
  expect(page).to have_content "Município do contrato obrigatório."
  expect(page).to have_content "Vencimento da 1ª parcela obrigatório."
  expect(page).to have_content "Vencimento da última parcela obrigatório."
  expect(page).to have_content "CEP obrigatório."
  expect(page).to have_content "Endereço obrigatório."
  expect(page).to have_content "Bairro obrigatório."
  expect(page).to have_content "UF obrigatório."
  expect(page).to have_content "Município obrigatório."
  expect(page).to have_content "DDD Telefone obrigatório."
  expect(page).to have_content "Telefone obrigatório."
end

# ======================== INCLUIR REGISTRO COM SUCESSO ====================

Quando("preencher todos os campos da proposta para Registar o Contrato") do
  find("input[name$=txtDsMarca]").set ["Honda", "Toyota", "Fiat", "Ford", "GM"].sample
  find("input[name$=txtDsModelo]").set ["FOX", "UNO", "PALIO", "CIVIC"].sample
  find("select[name$=ddlEspecies]").find("option", text: "Motocicleta").select_option

  "0-1-1-2-2-0-2-4".reverse!.split("-").each do |digito|
    find("input[name$=txtDtContrato]").set digito
    sleep 0.5
  end

  find("input[name$=txtNuParcelas]").set "36"
  find("input[name$=txtVlTaxaMora]").set "2"
  find("input[name$=txtVlTaxaMulta]").set "2"
  find("input[name$=txtVlTaxaJurosMes]").set "1"
  find("input[name$=txtVlTaxaContrato]").set "2"
  find("input[name$=txtVlIOF]").set "2"
  find("input[name$=txtVlTaxaJurosAno]").set "8"
  find("input[name$=txtDsIndice]").set "2"
  find("input[name$=txtVlComissao]").set "40"
  find("input[name$=txtDsPenalidade]").set "2"
  find("input[name$=txtNmRecebedorPgto]").set "1"
  find("input[name$=txtNuDocRecebedor]").set "00000014141"
  find("input[name$=txtNuDocVendedor]").set "00000001406"
  find("input[name$=xtVlTotalFinanciamento]").set "50000"
  find("input[name$=txtVlParcela]").set "799"

  "0-1-1-2-2-0-1-9".reverse!.split("-").each do |digito|
    find("input[name$=txtDtLiberacaoCredito]").set digito
    sleep 0.5
  end

  find("select[name$=ddlCdMunicipioLiberacaoCredito]").all("option").sample.select_option

  "0-1-1-2-2-0-1-9".reverse!.split("-").each do |digito|
    find("input[name$=txtDtVencPrimeiraParcela]").set digito
    sleep 0.5
  end

  "0-1-1-2-2-0-2-4".reverse!.split("-").each do |digito|
    find("input[name$=txtDtVencUltimaParcela]").set digito
    sleep 0.5
  end

  campo_cep = all("input[name$=txtDsCEP]")[0]
  "0-6-2-3-3-0-3-0".reverse!.split("-").each do |digito|
    campo_cep.set digito
    sleep 0.5
  end
  campo_cep.send_keys :tab

  all("input[name$=txtDsNumero]")[0].set "544"
  all("input[name$=txtNuDDD]")[0].set "11"
  all("input[name$=txtNuTelefone]")[0].set "33334444"
  find("input[name$=txtNuDocumentoDevedor]").set "09.353.526/0001-20"

  campo_cep = all("input[name$=txtDsCEP]")[1]
  "0-6-2-3-3-0-3-0".reverse!.split("-").each do |digito|
    campo_cep.set digito
    sleep 0.5
  end
  campo_cep.send_keys :tab

  all("input[name$=txtDsNumero]")[1].set "123"
  all("input[name$=txtNuDDD]")[1].set "11"
  all("input[name$=txtNuTelefone]")[1].set "33334444"
  find("input[value=' Registrar Contrato ']").click
  page.driver.browser.switch_to.alert.accept
  sleep 5
end

Então("o contrato é incluido com sucesso") do
  find("select[id$=CredorGravame_ddlDsUf").find("option", text: "SP").select_option
  find("select[id$=CredorGravame_ddlCdMunicipio").find("option", text: "OSASCO").select_option

  all("select[name$=ddlDsUf")[1].find("option", text: "SP").select_option
  all("select[name$=ddlCdMunicipio")[1].find("option", text: "OSASCO").select_option

  find("input[value=' Registrar Contrato ']").click
  page.driver.browser.switch_to.alert.accept
  sleep 5
  expect(page).to have_content "0030 - Registro do Contrato efetuado com sucesso."
  sleep 5
  find("img[id='wucMensagens1_imgFechar']").click
end
