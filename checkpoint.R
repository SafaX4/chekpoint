#Part 1: Univariate analysis
data<- CleanCreditScoring
data
mean(data$Income) 
median(data$Income) 
mode(data$Income) 
min(data$Income) 
max(data$Income)
quantile(data$Income)
var(data$Income)
sd(data$Income)
#autre variable
mean(data$Age) 
median(data$Age) 
mode(data$Age) 
min(data$Age) 
max(data$Age)
quantile(data$Age)
var(data$Age)
sd(data$Age)
#Bivariate analysis
cor(data$Amount, data$Income)
linearMod <- lm(Amount ~ Income, data=data)  # build linear regression model on full data
print(linearMod)
#Part 3: Multivariate analysis
data1 <-data[c("Seniority","Time","Age","Expenses","Income","Assets","Debt","Amount","Price","Finrat","Savings")]
data1_standardize <- as.data.frame(scale(data1))
data1_standardize
data1.mat <- as.matrix(data1_standardize)
cov.mat <- cor(data1_standardize)
pca <- prcomp(data1_standardize,center = T,scale. = T)
summary(pca)
data2 <-data[c("Status","Home","Marital","Expenses","Records","Job","seniorityR","timeR","ageR","expensesR","incomeR","assetsR","debtR","amountR","priceR","finratR","savingsR")]

library(ggfortify)
autoplot(pca, data = data1, colour = 'Income')
data2 <-data[c("Status","Home","Marital","Records","Job","seniorityR","timeR","ageR","expensesR","incomeR","assetsR","debtR","amountR","priceR","finratR","savingsR")]
View(data2)
#MCA
library(FactoMineR)
res.mca <- MCA(data2,ncp=2,graph=FALSE)
                
               
eig.val <- res.mca$eig
barplot(eig.val[, 2], 
        names.arg = 1:nrow(eig.val), 
        main = "Variances Explained by Dimensions (%)",
        xlab = "Principal Dimensions",
        ylab = "Percentage of variances",
        col ="steelblue")
library(ggfortify)
fviz_mca_biplot(res.mca, repel = TRUE, 
                 ggtheme = theme_minimal())
