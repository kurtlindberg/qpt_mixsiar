## QPT MixSIAR 
# MixSIAR R script - adaptable to all model experiments

# Bayesian modeling of plant wax sources to an Eastern Canadian Arctic lake 
# sediment record reveals stable plant wax vegetation sources following
# postglacial shrub colonization

# Mnauscript authors: Kurt R. Lindberg, Elizabeth K. Thomas, Martha K. Raynolds, Helga Bultmann

# DOI: pending

# Author: Kurt R. Lindberg
# Last edited: 02/11/2025


# Add necessary packages to R library
# If packages are missing, add them using 'install.packages("package_name")
library(ggplot2)
library(devtools)
library(MixSIAR)

# Load input tracer csv files for model sediment mixtures (mix),
# endmembers (source), and discrimination factors (discr)

# Load mixture file
mix <- load_mix_data(
  filename = "mix/mix_qpt_c22c28.csv",
  iso_names = c("c26"),
  factors = "Age",
  fac_random = FALSE,
  fac_nested = FALSE,
  cont_effects = NULL
)
# mix

# Load sources file - concentration dependence currently ON
source <- load_source_data(
  filename = "source/source_qpt_2end_c22c28.csv",
  source_factors = NULL,
  conc_dep = FALSE,
  data_type = "means",
  mix
)
# source

# Load discrimination factors file
discr <- load_discr_data(
  filename = "discr/discr_2end_c22c28.csv",
  mix
)
# discr


# Optional pre-model run plots:
# plot_data(
#   filename = "isospace_plot",
#   plot_save_pdf = FALSE,
#   plot_save_png = FALSE,
#   mix,
#   source,
#   discr
# )

# plot_prior(
#   alpha.prior = 1,
#   source
# )

# Run MixSIAR
model_filename <- "MixSIAR_model.txt"
resid_err <- FALSE
process_err <- TRUE
write_JAGS_model(
  model_filename,
  resid_err,
  process_err,
  mix,
  source
)
jags.1 <- run_model(
  run="extreme",
  mix,
  source,
  discr,
  model_filename
)

# Export MixSIAR outputs
output_options <- list(
  summary_save = TRUE,
  summary_name = "output_summary/out_qpt_2end_c22c28",
  sup_post = FALSE,
  plot_post_save_pdf = FALSE,
  plot_post_name = "posterior_density",
  sup_pairs = FALSE,
  plot_pairs_save_pdf = FALSE,
  plot_pairs_name = "pairs_plot",
  sup_xy = TRUE,
  plot_xy_save_pdf = FALSE,
  plot_xy_name = "xy_plot",
  gelman = TRUE,
  heidel = FALSE,
  geweke = TRUE,
  diag_save = TRUE,
  diag_name = "diagnostic/diag_qpt_2end_c22c28",
  indiv_effect = FALSE,
  plot_post_save_png = FALSE,
  plot_pairs_save_png = FALSE,
  plot_xy_save_png = FALSE,
  diag_save_ggmcmc = FALSE
)
output_JAGS(
  jags.1,
  mix,
  source,
  output_options
)
