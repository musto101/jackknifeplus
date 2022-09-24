data_split <- function(dat, y, size) {

  library(caret)

  dat_part <- createDataPartition(y = dat[,y], times = 1, p = 0.8)

  training <- dat[dat_part, ]
  test <- dat[-dat_part, ]

  X_train <- training[, -y]
  y_train <- training[, y]

  X_train <- training[, -y]
  y_train <- training[, y]


}

