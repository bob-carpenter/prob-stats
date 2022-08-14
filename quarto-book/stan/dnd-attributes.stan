functions {
  array[] int dice_rng(int N) {
    array[N] int y;
    for (n in 1:N)
      y[n] = categorical_rng(rep_vector(1.0 / 6.0, 6));
    return y;
  }
}
generated quantities {
  array[6] int<lower=3, upper=18> y;
  for (n in 1:6)
    y[n] = sum(sort_desc(dice_rng(4))[1:3]);
}
