comparison_output_screen <- function(comparison, input_sistec, input_rfept) {
  if (all(!is.null(input_sistec), !is.null(input_rfept), is.list(comparison))) {
    response <- comparison_result_screen(comparison)
  } else if (all(!is.null(input_sistec), !is.null(input_rfept))) {
    response <- "Aperte o bot\u00e3o \"Comparar\" para executar as compara\u00e7\u00f5es."
  } else if (is.null(input_sistec) && is.null(input_rfept)) {
    response <- "Selecione os arquivos do Sistec e do sistema acad\u00eamico."
  } else if (is.null(input_rfept)) {
    response <- "Selecione os arquivos do sistema acad\u00eamico."
  } else if (is.null(input_sistec)) {
    response <- "Selecione os arquivos do sistec."
  }

  response
}

comparison_result_screen <- function(comparison) {
  rfept <- rfept_table(comparison$rfept_complete)
  shiny::HTML(paste(paste0(
    "Compara\u00e7\u00e3o entre Sistec e ", rfept, " realizada com sucesso!"
  ),
  "", "",
  "Total de alunos:",
  paste0("&emsp; - Sistec: ", nrow(comparison$sistec_complete)),
  paste0("&emsp; - ", rfept, ": ", nrow(comparison$rfept_complete)),
  "Alunos sem CPF:",
  paste0("&emsp; - Sistec: ", nrow(comparison$sistec_without_cpf)),
  paste0("&emsp; - ", rfept, ": ", nrow(comparison$rfept_without_cpf)),
  "Alunos n\u00e3o encontrados:",
  paste0("&emsp; - Sistec: ", nrow(comparison$sistec_without_rfept)),
  paste0("&emsp; - ", rfept, ": ", nrow(comparison$rfept_without_sistec)),
  "CPF's repetidos:",
  paste0("&emsp; - Sistec: ", nrow(comparison$sistec_wrong_cpf)),
  paste0("&emsp; - ", rfept, ": ", nrow(comparison$rfept_wrong_cpf)),
  "V\u00ednculos repetidos:",
  paste0("&emsp; - Sistec: ", nrow(comparison$sistec_duplicated_registry)),
  paste0("&emsp; - ", rfept, ": ", nrow(comparison$rfept_duplicated_registry)),
  "V\u00ednculos n\u00e3o encontrados:",
  paste0("&emsp; - Sistec: ", nrow(comparison$sistec_unlinked_entry)),
  paste0("&emsp; - ", rfept, ": ", nrow(comparison$rfept_unlinked_entry)),
  "Para inspe\u00e7\u00e3o manual:",
  paste0("&emsp; - Sistec: ", nrow(comparison$sistec_pending)),
  paste0("&emsp; - ", rfept, ": ", nrow(comparison$rfept_pending)),
  "Erro no cadastro:",
  paste0("&emsp; - Na data de in\u00edcio: ", nrow(comparison$wrong_beginning)),
  "Situa\u00e7\u00f5es comparadas:",
  paste0("&emsp; - Atualizadas: ", nrow(comparison$situation_updated)),
  paste0("&emsp; - Desatualizadas: ", nrow(comparison$situation_to_update)),
  sep = "<br/>"
  ))
}
