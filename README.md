# ArrestData
HW-11
# Arrest Data Group: Team 3
# Jinshi Deng: Data Cleaning
# Vincent Fan: Graph
# Yilin Lu: Integration and improvement

Research question: 
#Is the violation type has something to do with race/gender/age?

Why is this important: 
#Although the client has the basic geographic data like age, gender and race, this graph can help to visualize the categorized offense type broke down by age/gender/race, which helps to reveal if there is an obvious crime tendency within a specific demographic group (specific age/gender/race, etc.) This might be useful to break the stereotype that certain group must be more inclined to engage in certain type of crime (for example, white people may have a higher figure of engaging in marijuana than black people, which is out of our original expectation.  

Main function: 
#Yilin Lu
Goal: Integrating the clean data function and graph function into "main.R", test and debug the code, then cunstruct a "Crime type by age" graph where the x axis is arrest age and the y axis is the number of crime, seperated by five top crime types. Also create graphs of "plot by age", "plot by gender", "plot by race" by calling "plotbyage/gender/race" function. 

Data cleaning functions:  
#Jinshi Deng
1. First extract the reason for each offender that why was he or she arrested. The method used here is to locate “/” in each offense column by using “regexpr”. Then created an index to collect cases sentenced for more than once. Then extracted the first crime type for that guy.
For example, “9501 Bench Warrant / 2709(a)(1) Harassment by Physical Contact, or Attempts or Threats” should be modified as “9501 Bench Warrant”.

2. Second, extract just the number in those offenses also by using “regexpr”. In this step, located “space” in each offense column is used. And then using the same method mentioned above.
For example, “9501 Bench Warrant” should be transferred as “9501”.
3. Third, deal with those particular cases by using the same method. For example, for codes like “13(a)”, “5902(a)”, located “(”, then used “regexpr”. Then is should look like “13” or “5902”.
4. Created a new data frame which only includes age, gender, race, offense, and code.
5. Finally, based on our topic, extract top five or top ten arrest code.


Graphing functions:  
#Vincent Fan
1. plotbygender<-function(x). This function create a bar plot showing x as a function to scaterplot the gender distribution of crime type, where the bar size is calculated by count of crimes among each gender, using the offense code of top five crime types as x axis. 
2. plotbyage<-function(x). This function create a bar plot showing x as a function to scaterplot the age distribution of crime type, where the bar size is calculated by count of crimes among age groups, using the offense code of top five crime types as x axis. 
3. plotbyrace<-function(x). This function create a bar plot showing x as a function to scaterplot the race distribution of crime type, where the bar size is calculated by count of crimes among races, using the offense code of top five crime types as x axis.

