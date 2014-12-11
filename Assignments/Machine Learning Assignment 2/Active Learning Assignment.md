Active Learning Assignment Report
=================================

### Key Concept:
To use less data and perform better classification by choosing better data.

### Advantages over Passive Learning:
* When training is a costly process.
* Better result for same amount of training since better data is used.

### How is better data chosen?
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