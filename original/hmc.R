library(ggplot2)

source("hmc-sampler.R")

# ESTIMATE MONTE CARLO STANDARD ERROR FOR Y, Y^2
#
M <- 500
sq_err <- rep(NA, 10000)
sd_sq_err <- rep(NA, 10000)
for (i in 1:10000) {
  y_mc <- rnorm(M)
  sq_err[i] <- (mean(y_mc) - 0)^2
  sd_sq_err[i] <- (mean(y_mc^2) - 1)^2
}
printf("Independent Draws:  mc se Y = %4.3f;  mc se Y^2 = %4.3f;  ess Y = %3.0f;  ess Y^2 = %3.0f",
       sqrt(mean(sq_err)), sqrt(mean(sd_sq_err)),
       1 / mean(sq_err), 2 / mean(sd_sq_err))


# Stan run edited out to save time as I only need them once

# # ESTIMATE STAN MARKOV CHAIN MONTE CARLO STANDARD ERROR FOR Y, Y^2
#
# library(rstan)
# program <- "parameters { vector[1000] theta; } model { theta ~ normal(0, 1); }"
# model <- stan_model(model_code = program)
# J <- 100
# sq_err_y <- rep(NA, J)
# sq_err_y_sq <- rep(NA, J)
# for (j in 1:J) {
#   printf("Stan run = %d / %J", j, J)
#   stan_fit <- sampling(model, chains = 1, iter = 1500, warmup = 1000,
#                        refresh = 0, control = list(metric = "unit_e"))
#   sim_theta_1 <- extract(fit)$theta[ , 1]
#   y_hat <- mean(sim_theta_1)
#   y_sq_hat <- mean(sim_theta_1^2)
#   sq_err_y[j] <- y_hat^2
#   sq_err_y_sq[j] <- (y_sq_hat - 1)^2
# }
# printf("Stan NUTS (default):  mcmc se Y = %4.3f  mcmc se Y^2 = %4.3f",
#        sqrt(mean(sq_err_y)), sqrt(mean(sq_err_y_sq)))
# sampler_params <- get_sampler_params(stan_fit, inc_warmup = FALSE)



# STANDARD NORMAL DENSITY AND GRADIENT
N <- 1000                               # dimensionality
norm_lpdf <- function(theta) -0.5 * sum(theta^2)
grad_norm_lpdf <- function(theta) -theta


# ESTIMATE HMC STANDARD ERROR Y, Y^2
theta0 <- rnorm(N)                      # initialize from posterior, so chain is stationary
rmse_mean <- c()
rmse_sd <- c()
accept_rates <- c()
algorithms <- c("hmc", "hmc-jitter")
Ls <- c(4, 16, 64)
epsilons <- seq(0.01, 0.8, by = 0.01)
dfs <- vector(mode = "list", length = length(Ls) * length(epsilons) * length(algorithms))
M <- 500
K <- 100                               # simulations per configuration
sq_err <- rep(NA, K)
sq_sq_err <- rep(NA, K)
accept_rate <- rep(NA, K)
evals <- NA
df_hmc <- data.frame()
for (algorithm in algorithms) {
  for (L in Ls) {                    # number of steps
    for (epsilon in epsilons) {
      for (k in 1:K) {
        fit <- hmc(norm_lpdf, grad_norm_lpdf, theta0,
                   epsilon = epsilon, max_leapfrog_steps = L, num_draws = M,
		   algorithm = algorithm)
        theta_draws <- fit$theta[, 1]                         # first dimension
        sq_err[k] <- (mean(theta_draws) - 0)^2                # true value 0
        sq_sq_err[k] <- (mean(theta_draws^2) - 1)^2           # true value 1
        accept_rate[k] <- fit$accept_rate
	evals <- fit$evals
      }
      rmse_y <- sqrt(mean(sq_err))
      rmse_y_sq <- sqrt(mean(sq_sq_err))
      ess_y <-  1 / rmse_y^2       # normal(0, 1), so sd = 1
      ess_y_sq <- 2 / rmse_y_sq^2  # chisq(1), so sd = sqrt(2)
      ess_y_per_eval <- ess_y / (evals * M)
      ess_y_sq_per_eval <- ess_y_sq / (evals * M)
      avg_accept_rate <- mean(accept_rate)
      df_hmc <- rbind(df_hmc,
                      data.frame(L = L, epsilon = epsilon, algorithm = algorithm,
                                 accept_rate = avg_accept_rate,
		                 rmse_y = rmse_y, rmse_y_sq = rmse_y_sq,
		                 ess_y = ess_y, ess_y_sq = ess_y_sq,
		                 ess_y_per_eval = ess_y_per_eval, ess_y_sq_per_eval = ess_y_sq_per_eval))
      printf("%s:  L %3.0f; epsilon %4.3f;  rmse(Y) %4.3f;  rmse(Y^2) %4.3f;  ess(Y) %7.0f;  ess(Y^2) %7.0f;  ess(Y)/eval %9.3f; ess(Y^2)/eval % 9.3f; accept rate %4.3f",
             algorithm, L, epsilon, rmse_y, rmse_y_sq, ess_y, ess_y_sq, ess_y_per_eval, ess_y_sq_per_eval, avg_accept_rate)
    }
    printf("")
  }
}

# PLOT LEARNING RATE x RMSE (Y, Y^2) FACETED BY L & ALGORITHM

plot_hmc <-
  ggplot(df_hmc, aes(x = epsilon, y = ess_y_per_eval)) +
  facet_grid(algorithm ~ L) +
  geom_hline(yintercept = 1480 / (16 * 500), color = "blue", size = 0.25, alpha = 1, linetype = "dashed") +
  geom_hline(yintercept = 160 / (16 * 500), color = "red", size = 0.25, alpha = 1, linetype = "dashed") +
  geom_vline(xintercept = 0.315, color = "darkgreen", size = 0.25) +  # NUTS STEP SIZE
  geom_line(color = "blue") +
  geom_line(mapping = aes(x = epsilon, y = ess_y_sq_per_eval),  color = "red") +
  scale_x_continuous(breaks = c(0, 0.2, 0.4, 0.6, 0.8, 1.0)) +
  scale_y_log10() +                # breaks = c(1e0, 1e1, 1e2, 1e3, 1e4, 1e5),
                                   # labels = c("1", "10", "100", "1,000", "10,000", "100,000")) +
  xlab("step size (epsilon)") +
  ylab("E[ESS] / leapfrog")
plot_hmc
