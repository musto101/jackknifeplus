compute_PIs_jacknife_plus_after_bootstrap <- function(training, test, alpha,
                                                      model, B, m, aggre) {
n <- nrow(training)
n1 <- nrow(test)

boot_samples_idx <- fit_boostrap_models(training, test, n, m , B, model)[1]
boot_pred <- fit_boostrap_models(training, test, n, m , B, model)[2]

in_boot_sample <- matrix(0, B, n)

for (b in 1:nrow(in_boot_sample)) {
  in_boot_sample[b, boot_samples_idx[b]] = True
}

resids_LOO <- matrix(0, n)
muh_LOO_vals_testpoint <- matrix(0, n, n1)

for (i in range(n)) {

  b_keep <- which(in_boot_sample == T)

  if (aggre == 'mean') {

    resids_LOO[i] <- mean(1 - boot_pred[b_keep, i])
    muh_LOO_vals_testpoint[i] <- mean(boot_predictions[b_keep,
                                                       n:ncol(boot_predictions)])

  }

}
ind_q = ceiling((1 - alpha) * (n + 1))


final_dat <- data.frame('lower' = sort(muh_LOO_vals_testpoint.T - resids_LOO),
                        'upper' = sort(muh_LOO_vals_testpoint.T + resids_LOO))

return(final_dat)
}
