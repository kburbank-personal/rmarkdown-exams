compiled_exam = function(full_exam = TRUE, print_answers = FALSE, z_table = TRUE, t_table = FALSE, f_table = FALSE, ...){
  lua_filter_command <- '--lua-filter=/Users/kendra/.pandoc/filters/exam_filter.lua'
  rmarkdown::pdf_document(
    pandoc_args = lua_filter_command,
    template = '/Users/kendra/.pandoc/templates/exam_template.tex',
    ...
  )
}
