generated quantities {
  int<lower=1, upper=6> y
      = categorical_rng(rep_vector(1.0 / 6.0, 6));
  int<lower=0, upper=1> a = y <= 2;
  int<lower=0, upper=1> b = y <= 3;
  int<lower=0, upper=1> c = y % 2 == 1;
  int<lower=0, upper=1> ab = a && b;
  int<lower=0, upper=1> ac = a && c;
  int<lower=0, upper=1> bc = b && c;
}
