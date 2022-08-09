generated quantities {
  int<lower=1, upper=6> x = categorical_rng(rep_vector(1.0 / 6.0, 6));
  int<lower=1, upper=6> y = categorical_rng(rep_vector(1.0 / 6.0, 6));
  int<lower=2, upper=12> z = x + y;
  int<lower=0, upper=1> z_eq_7 = (z == 7);
  int<lower=0, upper=1> z_lte_5 = (z <= 5);
  int<lower=0, upper=1> z_odd = (z % 2 == 1);
}
