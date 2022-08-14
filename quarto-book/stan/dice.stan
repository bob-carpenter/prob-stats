generated quantities {
  int<lower=1, upper=6> x = categorical_rng(rep_vector(1.0 / 6.0, 6));
  int<lower=1, upper=6> y = categorical_rng(rep_vector(1.0 / 6.0, 6));
  int<lower=2, upper=12> z = x + y;
}
