compiled_exam = function(full_exam = TRUE, print_answers = FALSE, z_table = TRUE, t_table = FALSE, f_table = FALSE, ...){
  lua_filter_command <- paste0('--lua-filter=',system.file("lua/exam_filter.lua",package="rmarkdownExams"))
  rmarkdown::pdf_document(
    pandoc_args = lua_filter_command,
    template = system.file("latex/exam_template.tex",package="rmarkdownExams"),
    ...
  )
}
