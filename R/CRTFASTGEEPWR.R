

CRTFASTGEEPWR <- function(
    alpha = 0.05,
    m = NULL,
    CP_size_matrix = NULL,
    corr_type = NULL,
    intervention_effect_type = NULL,
    period_effect_type = NULL,
    alpha0 = NULL,
    r0 = NULL,
    alpha1 = NULL,
    alpha2 = NULL,
    alpha3 = NULL,
    delta = NULL,
    beta_period_effects = NULL,
    max_intervention_period = NULL,
    DIST = NULL,
    link = NULL,
    phi = NULL,
    DesignPattern = NULL,
    df_choice = 1
) {
  # Check if all required arguments are present

  stopifnot(!is.null(m), !is.null(CP_size_matrix), !is.null(corr_type), !is.null(intervention_effect_type), !is.null(period_effect_type), !is.null(DIST), !is.null(DesignPattern))

}
