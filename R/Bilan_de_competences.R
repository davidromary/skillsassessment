library(rmarkdown)
library(readr)
library(plyr)
library(dplyr)
library(knitr)
library(ggplot2)
library(forcats)
library(stringi)

# pdf_p <- "Bilan_de_competence"
pdf_p <- "Curriculum_vitae"

rmd.file <- paste(pdf_p, "rmd", sep = ".")

rmd <- paste(getwd(), "R", rmd.file, sep = "/")

render_pdf <- function(rmd.file, output.file, with_toc){
  # output.file <- paste("../data/output/", pdf_p, "-Version_du_", sep = "")

  file_date <- format(Sys.time(), format = "%d/%m/%Y %H:%M", tz = "CET")

  producted_file <- paste(output.file,
                          format(Sys.time(), format = "%Y%m%d_%H%M", tz = "CET"),
                          ".pdf",
                          sep = "")

  render(rmd.file,
         output_file = producted_file,
         encoding = "UTF-8",
         pdf_document(toc = with_toc, toc_depth = 2, number_sections = TRUE, latex_engine = "pdflatex",
                      fig_width = 6.5, fig_height = 4.5, fig_caption = TRUE))

  browseURL(substr(producted_file, 4, nchar(producted_file))) # open file in browse
  options(warn=FALSE)
}

# render_pdf(rmd, paste("../data/output/", pdf_p, "-Version_du_", sep = ""), TRUE)
render_pdf(rmd, paste("../data/output/", pdf_p, "-Version_du_", sep = ""), FALSE)
