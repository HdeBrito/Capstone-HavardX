########################## Random Forests####################################

# Run a model 
wine_rf <-randomForest(quality~.,data=training_dt,
                       mtry=2,
                       ntree=500)
# Print results
wine_rf

##################### Test model in the testing data set ###################

#Calculation of the prediction using the model and the testing data set
y_hat <- predict(wine_rf,
                 testing_dt,
                 type="class")
#Confusion matrix, comparing the prediction and the real results
cm <- confusionMatrix(data=y_hat,
                      reference=testing_dt$quality)
cm
Accu_test_rf <-cm$overall["Accuracy"]
kappa_test_rf<-cm$overall["Kappa"]
# By class
cm$byClass[,c(1:2,8)]
# Remove temporary variables
rm(cm,y_hat)

