# append and merge are same thing
# wide format is used for group analysis
x1<-rbinom(20,1,.5)
x2<-rnorm(20,30,5)
y<-NULL
for(i in 1:20){
  y[i]<-28+1.5*x1[i]+2*x2[i]+sqrt(5)
}
head(y)
sd(y)
mean(y)
y_new<-sample(y,100,replace = T)

########resampling

data("mtcars")
head(mtcars)

surname<-c("Turkey","Venables","Tierney","Ripley","Mcneil")
nationality<-c("US","Australia","US","UK","Australia")
deceased<-c("yes","no","no","no","no")
name<-c("Turkey","Venables","Tierney","Ripley","Ripley","Mcneil")
titl<-c("Exploratory data analysis","Modern applied statistics","LISP-STAT","Spatial statistics","Stochastic simulation","Interactive data analysis")
authors<-data.frame(surname,nationality,deceased)
books<-data.frame(name,titl)
merge(authors,books,by.x = "surname",by.y="name")

df3<-data.frame(id=1:4,age=c(40,50,60,50),dose1=c(1,2,1,2),dose2=c(2,1,2,1),dose4=c(3,3,3,3))
df3
reshape(df3,direction = "long",varying=3:5,sep="")
df <- data.frame(id = rep(1:4, rep(2,4)), visit = I(rep(c("Before","After"), 4)),x = rnorm(4), y = runif(4))
reshape(df,direction = "wide",timevar="visit",idvar = "id")
