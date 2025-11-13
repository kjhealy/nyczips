insert_data_skeleton <- function(object_name) {
  # Get the object from the calling environment
  obj <- get(object_name, envir = parent.frame())

  # Extract dimensions and column names
  n_rows <- nrow(obj)
  n_cols <- ncol(obj)
  col_names <- colnames(obj)

  # Build the roxygen skeleton
  skeleton <- paste0(
    "#' TITLE\n",
    "#'\n",
    "#' DESCRIPTION\n",
    "#'\n",
    "#' @format ## `",
    object_name,
    "`\n",
    "#' A data frame with ",
    format(n_rows, big.mark = ","),
    " rows and ",
    n_cols,
    " columns:\n",
    "#' \\describe{\n"
  )

  # Add column descriptions
  for (col in col_names) {
    skeleton <- paste0(skeleton, "#'   \\item{", col, "}{DESCRIPTION}\n")
  }

  # Close the skeleton
  skeleton <- paste0(
    skeleton,
    "#' }\n",
    "#' @details DETAILS\n",
    "#' @author Kieran Healy\n",
    "#' @source <SOURCE_URL>\n",
    "\"",
    object_name,
    "\"\n"
  )

  cat(skeleton)
  clipr::write_clip(skeleton)
  invisible(skeleton)
}
