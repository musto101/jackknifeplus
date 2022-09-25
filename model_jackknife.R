model_jackknife <- function(training, test, grid, model) {
  library(performanceEstimation)
  library(doParallel)

  ctrl <- trainControl(method = 'cv', number = 5, classProbs = T,
                       summaryFunction = twoClassSummary, sampling = 'smote',
                       verboseIter = F)

  cl <- makeCluster(detectCores())
  # cl <- makeCluster(7)
  registerDoParallel(cl)

  impute_train <- preProcess(training, method = "knnImpute")
  training <- predict(impute_train, training)

  test[,-1] <- predict(object = impute_train, test[,-1])

  ml_model <- train(last_DX ~ .,
                    data = training, method = model,
                    metric = "ROC",
                    #na.action = na.pass,
                    #preProcess = c("knnImpute", "scale", "center"),
                    tuneGrid = grid, trControl = ctrl)

  predictions <- predict(ml_model, test, type = "prob")[, 1]

  return(predictions)



}
