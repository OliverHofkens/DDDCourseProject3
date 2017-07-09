Comparing trends in European internet connection prices
========================================================
author: Oliver Hofkens 
date: 09/07/2017
autosize: true
width: 1440
height: 900

Introduction
========================================================

Internet connection prices and speeds vary highly across Europe.  
This application allows the user to compare different countries and 
see trends in the price versus the speed of the connection.

Links:
* [Application](https://blarfursnarg.shinyapps.io/comparison_of_prices_of_internet_access_across_europe/)
* [Source Code](https://github.com/OliverHofkens/DDDCourseProject3)

Data
========================================================

* Data from the [European Union Open Data Portal](http://data.europa.eu/euodp/en/data/).  
* Part of the 'Digital Agenda' initiative which tries to strengthen the European digital society.
* Format:


```
  time_period     ref_area               breakdown       value        
 2014   :114   EU27   : 31   offer_100_mbps   :107   Min.   :  6.699  
 2013   :112   FI     : 31   offer_12_30_mbps :253   1st Qu.: 19.526  
 2015-02:112   SE     : 31   offer_30_100_mbps:204   Median : 27.902  
 2015-10:112   SI     : 31   offer_8_12_mbps  :219   Mean   : 33.004  
 2012   : 86   BG     : 30                           3rd Qu.: 39.273  
 2011   : 84   DK     : 30                           Max.   :148.086  
 (Other):163   (Other):599                                            
```

Application
========================================================

The application plots the price trend of all countries a user selects for the chosen connection speed.  
The maximum, minimum and mean across all countries are plotted too, and their values are shown when hovering over the plot.  

Example output:  
![plot of chunk unnamed-chunk-2](Pitch-figure/unnamed-chunk-2-1.png)

Thank you
========================================================

Feel free to check the application out [here](https://blarfursnarg.shinyapps.io/comparison_of_prices_of_internet_access_across_europe/)   
You can check the source code out or leave feedback [here](https://github.com/OliverHofkens/DDDCourseProject3)  

  
Thank you for your attention!
