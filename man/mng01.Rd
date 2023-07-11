% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mng01.R
\docType{data}
\name{mng01_main}
\alias{mng01_main}
\alias{mng01_pre}
\alias{mng01_post}
\alias{mng01}
\title{\code{MNG01} Mean Plot Graph.}
\format{
An object of class \code{chevron_g} of length 1.
}
\usage{
mng01_main(
  adam_db,
  dataset = "adlb",
  x_var = "AVISIT",
  y_var = "AVAL",
  y_name = "PARAM",
  y_unit = NULL,
  arm_var = "ACTARM",
  center_fun = "mean",
  interval_fun = "mean_ci",
  show_table = TRUE,
  jitter = TRUE,
  show_n = TRUE,
  show_h_grid = TRUE,
  show_v_grid = FALSE,
  legend_pos = "top",
  line_col = nestcolor::color_palette(),
  ...
)

mng01_pre(adam_db, dataset, x_var = "AVISIT", ...)

mng01_post(tlg, ...)

mng01
}
\arguments{
\item{adam_db}{(\code{list} of \code{data.frames}) object containing the \code{ADaM} datasets}

\item{dataset}{(\code{string}) the name of a table in the \code{adam_db} object.}

\item{x_var}{(\code{string}) the name of a column in the \code{dataset} to represent on the x-axis.}

\item{y_var}{(\code{string}) the name of the variable to be represented on the y-axis.}

\item{y_name}{(\code{string}) the variable name for \code{y}. Used for plot's subtitle.}

\item{y_unit}{(\code{string}) the name of the variable with the units of \code{y}. Used for plot's subtitle. if \code{NULL}, only
\code{y_name} is displayed as subtitle.}

\item{arm_var}{(\code{string}) variable used for column splitting}

\item{center_fun}{(\code{string}) the function to compute the estimate value.}

\item{interval_fun}{(\code{string}) the function defining the crossbar range.}

\item{show_table}{(\code{flag}) should the summary statistic table be displayed.}

\item{jitter}{(\code{flag}) should data point be slightly spread on the x-axis.}

\item{show_n}{(\code{flag}) should the number of observation be displayed int the table.}

\item{show_h_grid}{(\code{flag}) should horizontal grid be displayed.}

\item{show_v_grid}{(\code{flag}) should vertical grid be displayed.}

\item{legend_pos}{(\code{string}) the position of the legend.}

\item{line_col}{(\code{character}) describing the colors to use for the lines or a named \code{character} associating values of
\code{arm_var} with color names.}

\item{...}{not used.}

\item{tlg}{(\code{TableTree}, \code{Listing} or \code{ggplot}) object typically produced by a \code{main} function.}
}
\value{
a list of \code{ggplot} objects.
}
\description{
Overview of a summary statistics across time and arm for a selected data set.
}
\details{
\itemize{
\item No overall value.
\item Preprocessing filters for \code{ANL01FL} in the selected data set.
}
}
\section{Functions}{
\itemize{
\item \code{mng01_main()}: Main TLG Function

\item \code{mng01_pre()}: Preprocessing

\item \code{mng01_post()}: Postprocessing

}}
\note{
\itemize{
\item \code{adam_db} object must contain the table specified by \code{dataset} with the columns specified by \code{x_var}, \code{y_var},
\code{y_name}, \code{y_unit} and \code{arm_var}.
}
}
\examples{
col <- c(
  "A: Drug X" = "black",
  "B: Placebo" = "blue",
  "C: Combination" = "gray"
)

run(mng01, syn_data, dataset = "adlb", x_var = c("AVISIT", "AVISITN"), line_col = col)
}
\keyword{datasets}