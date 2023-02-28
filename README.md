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

We consider the following webpages from BYU.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./figures/byu.png" width="600">
  <img alt="The physical formation of ghosting." src="./figures/byu.png">
</picture>

And we constructed the following model accordingly. 

```math
    A = \begin{bmatrix}
    0 & 1 & 1 & 1 & 1 \\
    1 & 0 & 0 & 0 & 0 \\
    1 & 0 & 0 & 1 & 1 \\
    0 & 0 & 1 & 0 & 0 \\
    0 & 0 & 0 & 0 & 0
    \end{bmatrix}, 
    \quad e = \begin{bmatrix}
    1\\
    1\\
    1\\
    1\\
    1
    \end{bmatrix},
    \quad Ae = \begin{bmatrix}
    4 \\
    1 \\
    3 \\
    1 \\
    0
    \end{bmatrix}: \text{ number of incoming edges}
    \quad
    A^2e = \begin{bmatrix}
    5 \\
    4 \\
    5 \\
    3 \\
    0
    \end{bmatrix}: \text{counts "latent" edges}
```



