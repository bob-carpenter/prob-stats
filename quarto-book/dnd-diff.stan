functions {
  array[] int dice_rng(int N) {
    array[N] int y;
    for (n in 1:N)
      y[n] = categorical_rng(rep_vector(1.0 / 6.0, 6));
    return y;
  }
}
generated quantities {
  int<lower=3, upper=18> y = sum(sort_desc(dice_rng(4))[1:3]);
  int<lower=3, upper=18> z = sum(dice_rng(3));
  int<lower=-15, upper=15> y_minus_z = y - z;
}
