library(caret)
library(randomForest)

set.seed(22)
EEG_data <- read.csv("Project/EEG_data.csv")

## K-Nearest Neighbor

# Creates training and test datasets
intrain <-  createDataPartition(y = EEG_data$user.definedlabeln, p = 0.8, list = F)
train <-  EEG_data[intrain,]
test <- EEG_data[-intrain,]

# Makes user.definedlabeln a factor variable
train[["user.definedlabeln"]] <- factor(train[["user.definedlabeln"]])

# Uses 10 fold cross validation to pick k
trctrl <- trainControl(method = "cv", number = 10)

# Fits the KNN model
knn.fit <- train(user.definedlabeln ~. -SubjectID -predefinedlabel, data = train,
                 method = "knn",
                 trControl = trctrl,
                 preProcess = c("center", "scale"),
                 tuneLength = 10)
knn.fit
# Accuracy was used to select the optimal model using the largest value
# The final final value used for the model was k = 5

plot(knn.fit)

# KNN model against the test dataset
pred.knn <- predict(knn.fit, newdata = test)
confusionMatrix(pred.knn, test$user.definedlabeln)

# The prediction accuracy of KNN is 69.71%




## Random Forest

# Creates training and test datasets
intrain2 <- createDataPartition(y = EEG_data$user.definedlabeln, p = 0.8, list = F)
train2 <- EEG_data[intrain2,]
test2 <- EEG_data[-intrain2,]

# Makes user.definedlabeln a factor variable
train2[["user.definedlabeln"]] <- factor(train2[["user.definedlabeln"]])

# Fits the first Random Forest model
rf = randomForest(user.definedlabeln ~. -SubjectID -predefinedlabel, data = train2,
                  importance = T)
rf

# Number of trees split: 500
# Number of variables tried at each split: 3

plot(rf)

# First Random Forest model against the test dataset
rf.pred <- predict(rf, newdata = test2)
confusionMatrix(rf.pred, test2$user.definedlabeln)

# The accuracy of this random forest with 3 variables tried at each split is 77.83%


# Fits the second Random Forest model
rf2 = randomForest(user.definedlabeln ~. -SubjectID -predefinedlabel, data = train2,
                  mtry = 4, importance = T)

rf2

# Number of trees split: 500
# Number of variables tried at each split: 4

plot(rf2)

# Second Random Forest model against the test dataset
rf.pred2 <- predict(fr2, newdata = test2)
confusionMatrix(rf.pred2, test2$user.definedlabeln)

# The accuracy of this random forest with 4 variables tried at each split is 78.96%