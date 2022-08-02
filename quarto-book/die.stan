generated quantities {
  int<lower=1, upper=6> z = categorical_rng(rep_vector(1.0 / 6, 6));
}
