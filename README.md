# Dynamics in Search Engines

Investigation of Google's PageRank Algorithm.


## Search Engines

### Framework

1. crawlers: 
gather raw information from webpages;

2. indexer: 
analyzes the collected data to produce a set of word occurrences for each webpage $\rightarrow$ forward index;

    | Documents     | Words              | 
    | ------------- |:------------------:| 
    | document 1    | "cats", "are", ... | 
    | document 2    | "so", "cute", ...  | 


3. sorter: 
rearranges information by words $\rightarrow$ inverted index

    | Words      | Documents          | 
    | ---------- |:------------------:| 
    | "math"     | document 1, 7 ...  | 
    | "fun".     | document 2, 3 ...  | 

4. searcher: uses the inverted index to compile a list of documents
relevant to the keywords and phrases of the query


### Results List

Determine the order of the list:
 - relevance of the document to the query 
 (relative position, fonti cation, and frequency of the keywords)

- various ways to rank webpages
(Google: the PageRank algorithm)



## Google PageRank

### General Idea

- **Intuition**: a website should be more important if is visited more
often.

- **Model**: suppose a random surfer is wandering around the webpages
randomly. After su ciently many steps, the websites can be ranked
by how many times they were visited.

- **PageRank**: the probability that the surfer will end up on that page.
Or the fraction of time the random user spends on that page in the
long run.


### Example



