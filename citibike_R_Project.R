

# Path - D:/R Project/201802-citibike-tripdata.csv

# Install the below  libraries only once the first time
# Load libraries each time for a new R session

#install.packages("readr")
#install.packages("ggplot2")
#install.packages("dplyr")
#install.packages("leaflet")

library(readr)
library(ggplot2)
library(dplyr)


# Now read in the data and explore the dataset

citibike = read.csv("D:/R Project/201802-citibike-tripdata.csv",
                  stringsAsFactors = TRUE)

str(citibike)


# 'data.frame':	843114 obs. of  15 variables:
# $ tripduration           : int  771 264 819 646 1312 435 289 1454 639 530 ...
# $ starttime              : Factor w/ 842829 levels "2018-02-01 00:00:04.4340",..: 65 408 1479 2047 3339 3548 3578 3726 4968 6602 ...
# $ stoptime               : Factor w/ 842834 levels "2018-02-01 00:03:32.0260",..: 79 396 1579 2068 3941 3419 3302 4411 4923 6350 ...
# $ start.station.id       : int  72 72 72 72 72 72 72 72 72 72 ...
# $ start.station.name     : Factor w/ 763 levels "1 Ave & E 110 St",..: 714 714 714 714 714 714 714 714 714 714 ...
# $ start.station.latitude : num  40.8 40.8 40.8 40.8 40.8 ...
# $ start.station.longitude: num  -74 -74 -74 -74 -74 ...
# $ end.station.id         : int  379 478 405 2006 435 173 514 426 3173 458 ...
# $ end.station.name       : Factor w/ 770 levels "1 Ave & E 110 St",..: 701 15 753 214 692 182 19 759 598 14 ...
# $ end.station.latitude   : num  40.7 40.8 40.7 40.8 40.7 ...
# $ end.station.longitude  : num  -74 -74 -74 -74 -74 ...
# $ bikeid                 : int  14536 32820 16131 20831 15899 19749 17412 17548 18515 31050 ...
# $ usertype               : Factor w/ 2 levels "Customer","Subscriber": 2 2 2 2 2 2 2 2 2 2 ...
# $ birth.year             : int  1952 1965 1968 1990 1957 1983 1988 1988 1988 1982 ...
# $ gender                 : int  1 1 1 2 1 1 2 1 1 1 ...

"
From this command we can analyze that there are total 843114 rows and 15 columns(variables).
There are 3 types of datatype present in the dataset. 1 is int, 2 is numerical, 3 is factor.
In factorial datatype number of levels gives us information about how many type of entries present fot that attribute. e.g. in usertype variable there are 2 levels,
costumer and subscriber.
"
glimpse(citibike)

"
Rows: 843,114
Columns: 15
$ tripduration            <int> 771, 264, 819, 646, 1312, 435, 289, 1454, 639, 530, 779, 1167, 1211, 448, 529, 970, 895, 916, 653, 387, 711, 798, 1101, 868, 2359, 706, 67...
$ starttime               <fct> 2018-02-01 00:14:16.4120, 2018-02-01 05:14:45.1790, 2018-02-01 06:48:55.2290, 2018-02-01 07:12:50.1740, 2018-02-01 07:46:48.8750, 2018-02-...
$ stoptime                <fct> 2018-02-01 00:27:08.2290, 2018-02-01 05:19:09.6860, 2018-02-01 07:02:35.0290, 2018-02-01 07:23:36.5280, 2018-02-01 08:08:41.5430, 2018-02-...
$ start.station.id        <int> 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72...
$ start.station.name      <fct> W 52 St & 11 Ave, W 52 St & 11 Ave, W 52 St & 11 Ave, W 52 St & 11 Ave, W 52 St & 11 Ave, W 52 St & 11 Ave, W 52 St & 11 Ave, W 52 St & 11...
$ start.station.latitude  <dbl> 40.76727, 40.76727, 40.76727, 40.76727, 40.76727, 40.76727, 40.76727, 40.76727, 40.76727, 40.76727, 40.76727, 40.76727, 40.76727, 40.76727...
$ start.station.longitude <dbl> -73.99393, -73.99393, -73.99393, -73.99393, -73.99393, -73.99393, -73.99393, -73.99393, -73.99393, -73.99393, -73.99393, -73.99393, -73.99...
$ end.station.id          <int> 379, 478, 405, 2006, 435, 173, 514, 426, 3173, 458, 524, 496, 347, 514, 447, 465, 458, 405, 440, 495, 458, 442, 3462, 3472, 3435, 359, 200...
$ end.station.name        <fct> W 31 St & 7 Ave, 11 Ave & W 41 St, Washington St & Gansevoort St, Central Park S & 6 Ave, W 21 St & 6 Ave, Broadway & W 49 St, 12 Ave & W ...
$ end.station.latitude    <dbl> 40.74916, 40.76030, 40.73932, 40.76591, 40.74174, 40.76068, 40.76088, 40.71755, 40.77751, 40.75140, 40.75527, 40.73726, 40.72885, 40.76088...
$ end.station.longitude   <dbl> -73.99160, -73.99884, -74.00812, -73.97634, -73.99416, -73.98453, -74.00278, -74.01322, -73.98889, -74.00523, -73.98317, -73.99239, -74.00...
$ bikeid                  <int> 14536, 32820, 16131, 20831, 15899, 19749, 17412, 17548, 18515, 31050, 20522, 32013, 31524, 30755, 31657, 32613, 31032, 31388, 31365, 30135...
$ usertype                <fct> Subscriber, Subscriber, Subscriber, Subscriber, Subscriber, Subscriber, Subscriber, Subscriber, Subscriber, Subscriber, Subscriber, Subscr...
$ birth.year              <int> 1952, 1965, 1968, 1990, 1957, 1983, 1988, 1988, 1988, 1982, 1960, 1959, 1982, 1990, 1947, 1978, 1984, 1961, 1988, 1956, 1987, 1984, 1980, ...
$ gender                  <int> 1, 1, 1, 2, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 0, 2, 1, 1, 2, 1, 1, 1, 2, 2, 1, 1, 2, 2, 1, 2, 2, 1, 1, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 2, ...

"
"
From glimpse command we can get all the variables with their corresponding values.
"
dim(citibike)

"
dim command gives number of rows and columns in the dataset.
"
#head(citibike)
View(head(citibike,100))
"
It shows table containing 100 entries for 15 columns
"

# Let's explore variable usertype

str(citibike$usertype)

#  Factor w/ 2 levels "Customer","Subscriber": 2 2 2 2 2 2 2 2 2 2 ...

unique(citibike$usertype)

# Levels: Customer Subscriber

summary(citibike$usertype)

"
 Customer Subscriber 
     33358     809756 
"

table(citibike$usertype)
"

  Customer Subscriber 
     33358     809756 
     
"

# check the levels of the factor usertype
levels(citibike$usertype)

# similarly explore the gender variable
# As the gender variable is of 'int' type we have converted into factor in variable 'citi_gender'.

citi_gender <- as.factor(citibike$gender)

str(citi_gender)

# Factor w/ 3 levels "0","1","2": 2 2 2 3 2 2 3 2 2 2 ...

summary(citi_gender)
"
    0      1      2 
 40099 621749 181266 
"
levels(citi_gender)

# "0" "1" "2"

table(citi_gender)
"
     0      1      2 
 40099 621749 181266 
"
# Creates contingency table for usertype vs citi_gender

table(citibike$usertype, citi_gender)

"
            citi_gender
                  0      1      2
  Customer    25503   4809   3046
  Subscriber  14596 616940 178220
"

#--------------------Visualization using ggplot----------------------------

ggplot(citibike, aes(x = citi_gender,fill = citi_gender)) +
  geom_bar(position = "dodge") + 
  theme(axis.text.x = element_text(angle = 0))


# Conditional bar chart, using facet wrap

# plot usertype for each gender

ggplot(citibike, aes(x =usertype , fill = usertype)) +
  geom_bar() +
  facet_wrap(~ gender)




# plots for numerical data variables


"
Dotplot
Most common way to plot numerical data is dotplot
where each case is plotted as a dot on the x-axis


"
ggplot(citibike, aes(x = gender)) +
  geom_dotplot(dotsize = 0.4)

"
Histogram

"
ggplot(data = citibike, aes(x = gender)) +
  geom_histogram()

"
Density Plot
"

ggplot(citibike, aes(x = gender)) +
  geom_density()



# Boxplot


ggplot(citibike, aes(x = 1, y = gender)) +
  geom_boxplot() 



unique(citibike$start.station.id)



max_trip = max(citibike$tripduration)

min_trip = min(citibike$tripduration)

#Customer Vs Subscriber
ggplot(citibike, aes(x = citibike$usertype , fill = mean(citibike$tripduration))) +
  geom_bar()

#----------------------------------------------

(unique(citibike$start.station.id))

#Station with over 1000000sec of trip
over_ = filter(citibike , citibike$tripduration > 1000000)

unique(over_$start.station.id)

unique(over_$start.station.name)

ggplot(over_ , aes(x =start.station.name)) + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

#----------------------------------------------

#Birthyear

unique(citibike$birth.year)
table(citibike$birth.year)

ggplot(citibike , aes(x = birth.year)) + geom_bar()
#---------------------



#summary(city$end.station.latitude)





#usertype and endstationlatitude
ggplot(citibike, aes(x = citibike$usertype , fill = mean(citibike$end.station.latitude))) + geom_bar()



#bikeid
unique(citibike$bikeid)
table(citibike$bikeid)

ggplot(citibike , aes(x = bikeid)) + geom_bar()


# plotting for numerical data variables

ggplot(citibike, aes(x = bikeid)) +
  geom_dotplot(dotsize = 0.5)


#Histogram


ggplot(data = citibike, aes(x = bikeid,fill = 'red')) +
  geom_histogram()


#Density Plot


ggplot(citibike, aes(x = bikeid , fill = 'red')) +
  geom_density()



#Boxplot


ggplot(citibike, aes(x = 1, y = bikeid)) +
  geom_boxplot()

# Stations plotted geographically 
library(leaflet)




leaflet() %>%
  addTiles()%>%
  addMarkers(lng = unique(citibike$start.station.longitude), lat = unique(citibike$start.station.latitude), popup = (unique(citibike$start.station.name)))%>%
  addCircleMarkers(lng = unique(citibike$end.station.longitude), lat = unique(citibike$end.station.latitude), popup = unique(citibike$end.station.name))