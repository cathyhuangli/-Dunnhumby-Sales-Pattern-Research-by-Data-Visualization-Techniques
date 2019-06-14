aggregate(transaction_data$Frequency, by=list(Category=transaction_data$PRODUCT_ID), FUN=sum)
#as transaction dataset is too big to porcess, I take seven attributes that related with aspects
#of products that I want to analysis later.
trans<-transaction_data[,1:7]
#merge the table product and the chosen part of tractions table, trans.
tp<-merge(x=product,y=trans, by="PRODUCT_ID")
write.csv(tp,file="tp.csv",row.names=FALSE,quote=FALSE)
#summary of 
summary(tp$DAY)
summary(tp$W)
tpyear1<-tp[tp$DAY<=365,]
tpyear2<-tp[tp$DAY>365,]
write.csv(tpyear1,file="tpyear1.csv",row.names=FALSE,quote=FALSE)
write.csv(tpyear2,file="tpyear2.csv",row.names=FALSE,quote=FALSE)
###change into another way
summary(transaction_data$DAY)
summary(transaction_data$WEEK_NO)
transaction_datayear1<-transaction_data[transaction_data$WEEK_NO<=56,]
transaction_datayear2<-transaction_data[transaction_data$WEEK_NO>56,]
write.csv(transaction_datayear1,file="transaction_datayear1.csv",row.names=FALSE,quote=FALSE)
write.csv(transaction_datayear2,file="transaction_datayear2.csv",row.names=FALSE,quote=FALSE)

tpyear1<-merge(x=product,y=transaction_datayear1, by="PRODUCT_ID")
tpyear2<-merge(x=product,y=transaction_datayear2, by="PRODUCT_ID")
write.csv(tpyear1,file="tpyear1.csv",row.names=FALSE,quote=FALSE)
write.csv(tpyear2,file="tpyear2.csv",row.names=FALSE,quote=FALSE)
###tp<-tpyear1[,c(1:13,16)]

causal_datayear1<-causal_data[causal_data$WEEK_NO<=56,]
causal_datayear2<-causal_data[causal_data$WEEK_NO>56,]
write.csv(causal_datayear1,file="causal_datayear1.csv",row.names=FALSE,quote=FALSE)
write.csv(causal_datayear2,file="causal_datayear2.csv",row.names=FALSE,quote=FALSE)

causalyear1<-causal_datayear1[,c(1,4:5)]
cyear1<-unique(causalyear1)
write.csv(cyear1,file="cyear1.csv",row.names=FALSE,quote=FALSE)

tpyear1sub1<-tpyear1[,-c(6,7,14,15,17,18)]
tpcyear1<-merge(x=tpyear1,y=cyear1, by="PRODUCT_ID")
write.csv(tpcyear1,file="tpcyear1.csv",row.names=FALSE,quote=FALSE)

causalyear2<-causal_datayear2[,c(1,4:5)]
tpcyear2<-merge(x=tpyear2,y=transaction_datayear2, by="PRODUCT_ID")

sub1<-tpcyear1[,c(1:4,10:13,16,19,20)]
season1<-sub1[sub1$WEEK_NO<=12,]
month1<-season1[sub1$WEEK_NO<=4,]
write.csv(season1,file="season1.csv")
write.csv(month1,file="month1.csv")


#new tpc







