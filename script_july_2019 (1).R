a. Install the reshape2 package, load the library, and access the dataset tips. 
Include the commands needed to look at both the structure of the dataset and 
its help file. Summarise the dataset.     [8 marks] 

install.packages('reshape2') 
library(reshape2)
View(tips)
colnames(tips)
#[1] "total_bill" "tip"        "sex"        "smoker"     "day"       
#[6] "time"       "size" 
help(tips)
 
b. The smoke variable records if there were any smokers at the table. 
How many tables had smokers present?       [4 marks] 

tips[which(tips$smoker=='Yes'),]
nrow(tips[which(tips$smoker=='Yes'),])
#93
 
c. What is the size of the largest group of diners? How many groups of this 
size dined at the restaurant? What was the largest bill amongst these groups? 
         [8 marks] 


max(tips$size)
#6
which(tips$size==6)
#[1] 126 142 144 157
tips$total_bill[126]
#29.8
tips$total_bill[142]
#34.3
tips$total_bill[144]
#27.05
tips$total_bill[157]
#48.17
 
d. It’s difficult to analyse the amount left as a tip, without taking the 
size of the corresponding bill into consideration. In order to do this, 
form a new column called percentage.tip which contains the percentage of the 
bill which the tip constitutes (e.g., if a bill is €50 and the tip is €5, 
then this new column would record that the percentage.tip is 10 - i.e., 10%).
 What is the average percentage tip?                [6 marks] 
 
percentage.tip<-data.frame((tips$tip/tips$total_bill)*100)
View(percentage.tip)
colnames(percentage.tip)
percent<-percentage.tip
colnames(percentage.tip) <- c("percentage.tip")
View(percentage.tip)

tips<-cbind(tips,percentage.tip)
View(tips)

e. Which sex/day combination left the smallest mean percentage.tip?         
 [8 marks] 
 
aggregate(tips[, 8], list(tips$sex,tips$day), mean)
#  Group.1 Group.2        x
#1  Female     Fri 19.93884
#2    Male     Fri 14.33852
#3  Female     Sat 15.64702
#4    Male     Sat 15.15768
#5  Female     Sun 18.15688
#6    Male     Sun 16.23441
#7  Female    Thur 15.75248
#8    Male    Thur 16.52765


f. Create a new column called rating which converts percentage.tip to an 
ordered factor using the cut() function. Use bins of 0 - 10% (“Normal”), 
10 - 20% (“Generous”), and 20 - 50% (“Very generous”).            [8 marks] 


data2cut<- 
data.frame(  cut(as.double(unlist(percentage.tip)), breaks = c(0,10, 20, 50),
    labels = c("Normal","Generous","Verygenerous"),
      include.lowest = TRUE))
 View(data2cut)
colnames(data2cut)<-c("rating")
tips2<-cbind(tips,data2cut)
View(tips2)
g. The time variable records whether a table of diners sat at Dinner or Lunch.
 Make a two-way table of time vs. rating. How many tables at lunch are 
considered generous?                 [8 marks] 

colnames(tips)
#[1] "total_bill" "tip"        "sex"        "smoker"     "day"       
#[6] "time"       "size" 

 smoke <- table(tips2$time,tips2$rating)
View( smoke)


2:::::::


Load the dublin.Rdata object, which you will find in the Exam folder on Moodle.
 It includes a dataframe with daily measurements of the following variables: 
 mean temperature (meantp); maximum temperature (maxtp); minimum temperature
 (mintp); precipitation (rain); mean windspeed (wdsp); and sunshine duration 
(sun). Temperature is measured in degrees Celsius; precipitation in 
millimetres (mm); mean windspeed in knots; and sunshine duration is 
measured in hours. 

# I need the dublin.Rdata file . the file is not present on the internet 
# I need the dublin.Rdata file . the file is not present on the internet
# I need the dublin.Rdata file . the file is not present on the internet

a. A data analyst wants to study the daily mean windspeed (wdsp) variable. 
Produce a histogram of this variable, and make the graph look neat and 
presentable (paying particular attention to labels, colour, titles etc.). 
Comment on the resulting histogram.          [10 marks] 

hist(dublin$wdsp,ylab="Windspeed",xlab="Measure of windspeed",main="Dublin Windspeed data",
col="red")

 
b. The data analyst is also interested in learning more about the 
relationship between the mean temperature (meantp) variable and the
 month variable. Produce a plot showing boxplots of the mean temperature 
variable grouped by month.  
 
In addition to producing this plot, you should: 
 
¦ colour the boxplots ¦ include x- and y-axis labels and a main title 
¦ make the plot look neat (e.g., change the numbers on the y-axis to 
appear horizontal rather than vertical)    
 
Comment on the resulting plot.              [15 marks] 


boxplot(meantemp ~ month, data="dublin",xlab="month",ylan="mean temp"
,col="green",las=1)

 
 
3:::::::::::::

3. This question is worth 25 marks. 
 
This questions uses the dublin.RData object from Question 2. 
Reload this object. Using the class() function, 
assign the class weather to the list dublin. 
 
a. Write a summary method for an object of class weather which includes 
the following information in its output: 
¦ The beginning and end years in the dataset 
¦ The minimum of the mintp variable 
¦ The maximum of the maxtp variable 
¦ One other piece of information from the dataset   
     Your summary method should be neat and clear and easy to read. 
   Test your summary method on the object dublin.            [17 marks] 
 


b. Explain in your own words what the following object-oriented programming 
(OOP) terms mean in the R language: 
 ¦ Polymorphism ¦ Inheritance                [8 marks] 


polymorphism can be implemented into different ways, from inside or from outside objects. When it’s implemented from inside objects, each object must provide a definition on how it will deal with a given message.
R is very special in this manner and implements the outside approach, formally know as generics or parametric polymorphism.
The outside approach lets you define a generic method or function for types of objects that you have not yet defined and may never do

Inheritance forms a hierarchy of class just like a family tree. Important thing to note is that the attributes define for a base class will automatically be present in the derived class.
we can derive new classes from existing base classes and adding new features. We don’t have to write from scratch. Hence, inheritance provides reusability of code.



