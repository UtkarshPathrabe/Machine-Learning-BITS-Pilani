Active Learning Assignment Report
=================================

### Key Concept:
To use less data and perform better classification by choosing better data.

### Advantages over Passive Learning:
* When training is a costly process.
* Better result for same amount of training since better data is used.

How is Better Data chosen?
--------------------------
The learner queries for interesting data and asks an expert to label them.

### Query scenarios:
* <b><i>Query Synthesis</i></b> -> A point is generated from the interesting space.
* <b><i>Selective Sampling</i></b> -> Only interesting points considered from a stream.
* <b><i>Pool-based Active Learning</i></b> -> More informative points chosen from unlabelled pool.

#### Query Synthesis:
<b>Advantage</b> -> Useful for Exploratory/Discovery based applications where all possibilites in data space need to be explored and no underlying distribution is present.  
&nbsp;&nbsp;&nbsp;&nbsp;Eg. Testing for Ideal Alloy for Aircrafts - Different metal combinations need to be tested but in a limited fashion. Metals like potassium, mercury and many others are quite irrelevant here, so a query will be synthesized from interesting metals like aluminium, zinc, iron etc.  
<b>Disadvantage</b> -> When the actual data has an underlying distribution. Here, most of input space may be irrelevant and only a small part of it is valid.  
&nbsp;&nbsp;&nbsp;&nbsp;Eg. Analyzing Hospital Readmission Risk from health records of patients -  Here patients above 50 years with chronic diseases, high/low blood pressure and diabetes are interesting cases, but generating random permutations in this space will yield many irrelevant cases, eg. patient with 10 - 15 diseases at once which is not practical in real life.  

#### Selective Sampling:  
<b>Advantage</b> -> Queries are always practical since they come from true data. Data is fed, no need for extensive search through large input space or pool of unlabelled data.  
<b>Disadvantage</b> -> Drawing instances can be a slow process, increasing overall time taken for learning.  

#### Pool-based Active Learning:  
<b>Advantage</b> -> Data available readily, learner controls amount of data, useful when entire data doesn't fit into memory.  
<b>Disadvantage</b> -> Repeated Confidence/ Information calculation on large data set, large data needs to stored and ready for efficient access.  

What is More Informative Data?  
------------------------------  
Instances that are less certain of the class they belong to.  
Two techniques for choosing more informative points:  
* <b><i>Uncertainty Sampling</i></b> -> Query the points model is least confident about.  
&nbsp;&nbsp;&nbsp;&nbsp;Three common uncertainty measures:-  
1) <i>Least Confident</i> -> Points with lowest confidence are most informative. Reveals information only about its relation with closest class, outliers more likely to be chosen. Causes problems when classes are unevenly sized.  
2) <i>Smallest Margin</i> -> Points with least difference between two nearest classes are more informative. Gives better result than least confident for uneven size of classes. However it again fails to take into consideration more number of classes than two. Not a considerable disadvantage for classification problems.  
3) <i>Entropy</i> -> Points with higher entropy are more informative. A much better measure as it takes into consideration relation of a point with all classes for entropy calculation.  
* <b><i>Query-By-Committee (QBC)</b></i> -> Query points most uncertain after passing through ensemble. Reduces version space quickly.  

Problems With Active Learning:  
------------------------------  
Active learning less robust to outliers and noise since they always give high information value but are to be ignored.  
&nbsp;&nbsp;&nbsp;&nbsp;Some solutions to outliers problem:  
* <i>Density Weighing</i> -> Incorporates nearby density of a point into informativeness calculation.  
* <i>Estimated Error Reduction</i> -> Incorporates risk associated with a point if used for training, outliers have higher risk.  

Problem Statement:  
------------------
Identify patients who will be admitted to a hospital within the next year using historical claims data.  

### Data source:
Heritage Provider Network has public data set released in: `https://www.heritagehealthprize.com/c/hhp/data`  

### Details of the application:  
* Application predicts number of patients who will be admitted to a hospital within the next year using historical data of the hospital.  
* Once known, health care providers can develop new care plans and strategies to reach patients before emergencies occur, thereby reducing the number of unnecessary hospitalizations. This will result in increasing the health of patients while decreasing the cost of care.  
* A large number of individuals are admitted to hospitals each year. Government wastes billions of dollars in unnecessary hospital admissions. Identifying patients who are at risk and ensuring they get the treatment they need early on can save lot of money to healthcare.  
* Available dataset comprises of 2.7 million patient records. Building a classifier using complete data set is expensive in time and memory. Hence we need to choose selected input labelled records to build a classifier and iteratively build the classifier by choosing better data. This is the reason why active learning is used to build the classifier.  

