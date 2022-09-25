fit_bootstrap_models <- function(training, test, model_jackknife, n, m, B, grid){

  samples_idx <- generate_bootstrap_samples(n, m, B)
  n1 <- nrow(test)
  predictions <- matrix(0, B, n1)

  for (b in 1:B) {

    predictions[b] <- model_jackknife(training, test, grid)

  }

return(list(samples_idx, predictions))

}


# def fit_bootstrap_models(X_train, Y_train, X_predict, fit_muh_fun, n, m, B):
#   '''
#       Train B bootstrap estimators and calculate predictions on X_predict
#       Return: list of matrices [M,P]
#         samples_idx = B-by-m matrix, row b = indices of b-th bootstrap sample
#         predictions = B-by-n1 matrix, row b = predictions from b-th bootstrap sample
#           (n1=len(X_predict))
#     '''
# samples_idx = generate_bootstrap_samples(n, m, B)
# n1 = len(X_predict)
# # P holds the predictions from individual bootstrap estimators
# predictions = np.zeros((B, n1), dtype=float)
# for b in range(B):
#   predictions[b] = fit_muh_fun(X_train[samples_idx[b], :],\
#                                Y_train[samples_idx[b], ], X_predict)
# return([samples_idx, predictions])
