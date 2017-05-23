mydata = read.table("/Users/Rudra/Desktop/math 289C/assignment 3/data2_sorted.txt",header=FALSE)
mydata=as.numeric(unlist(mydata))
#val=hist(mydata,breaks=58)#Problem is that it doesnt exactly make it to 58
sample=4000 #change sample to get different bin sizes 
val=hist(mydata,breaks=seq(0,(ceiling(229345/sample)*sample),by=sample))
temp=(table(val$counts)) 
as.vector(temp)
temp[3]=temp[1]+temp[2]+temp[3]
sum=0

############ function for chi
chi<-function(predicted,result)
{
  chi=0
  for (i in 1:length(predicted))
  {
    chi=chi+(((predicted[i]-result[i])^2)/predicted[i])
  }
  return (chi)
}

#as.vector(temp[i]) can enable to access individual elements in a table 
#names(temp[i]) gives the label of the elements in the table 
k=length(temp)
for (i in 1:length(temp))
{ 
  if (as.numeric(names(temp[i]))==9)
  {
    k=i
  }
  if (as.numeric(names(temp[i]))>=9)
  {
    sum=sum+as.vector(temp[i])
  }
}

if(names(temp[k])=='9') #condition if >9 is never reached
{
  temp[k]=sum
}
result=temp[3:k]#this stores the final freq array
No_bins=sum(result[1:length(result)])#total no of bins

predicted_poi=NULL
predicted_uni=NULL
predicted_gamma=NULL
predicted_exp=NULL

############## for poisson distributions  ###########

lambda=length(mydata)/(No_bins)#average lambda calculation

# the values in poisson function gives the cumulative P of occurence for a value x 
# so for 2 its the function call 
#for values 9+ its 1-poiss(8)
#for rest of the values it is poiss(i)-poiss(1-1) since they are discrete in nature

# NOTE : one difference from class is she has taken 4000 intervals and got 57 windows. 
# that comes upto 228000, whereas we have 229345... So i have taken the intervals from 
# 1 to 232000 and got 58 bins. 

for (i in 1:length(result))
{if(names(result[i])=='2')
  {
  predicted_poi[i]=(No_bins)*ppois(as.numeric(names(result[i])), lambda)
  }
  else if (names(result[i])=='9')
  {
  predicted_poi[i]=(No_bins)*(1-ppois(as.numeric(names(result[i]))-1, lambda))
  }
  else
  {
  predicted_poi[i]=(No_bins)*(ppois(as.numeric(names(result[i])), lambda)-ppois(as.numeric(names(result[i]))-1, lambda))
  }
}

chi_poi = chi(predicted_poi,as.vector(result))
chi_poi
################## for uniform distribution #####

average = No_bins/(as.numeric(names(temp[length(temp)])))

for (i in 1:length(result))
{ if(i==1)
{predicted_uni[i]=average*3}
  else if (i==length(result))
  {
    predicted_uni[i]=average*(as.numeric(names(temp[length(temp)]))-8)
  }
  else 
  {
    predicted_uni[i]=average
  }
}

chi_uni = chi(predicted_uni,as.vector(result))
chi_uni

######## for exp distribution between spacing ######

spacing = diff(mydata)
spacing=sort(spacing, decreasing=TRUE)
plot(density(spacing))

avg_spacing=mean(spacing)
exp_predicted=dexp(spacing,rate=1/avg_spacing)
plot(exp_predicted)
