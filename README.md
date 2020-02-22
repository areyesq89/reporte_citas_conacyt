# Generate a citation report

This repository contains instructions to generate a citation report for a list of articles using R and Rmarkdown in a semi-automatic manner. 
An example of the output generated can be found [here.](https://github.com/areyesq89/reporte_citas_conacyt/blob/master/generalize/general_conacyt.pdf)
These types of reports are often requested in applications for the SNI of CONACYT in Mexico. This repository serves as notes to Alejandro of the future, but I make these notes public in case someone else finds them useful.

# Instructions

These are the instructions that I followed to get my citation report:

1. Update your ORCID. Then download your list of publications from Web of Science by following these steps: Log in to Web of Science -> Author Search -> Web of Science ResearcherID or ORCID Search and add your ORCID -> View as a set of results to export -> Export as "Fast 5K" format. The downloaded file should look like [this](https://github.com/areyesq89/reporte_citas_conacyt/blob/master/data/raw/00_mypubs.tsv).
2. For each of the articles in the file downloaded in step 1, look for the article in Web Of Science and export the list of citations of each article also using the "Fast 5K" format. The steps to download the file for one article are: Basic Search -> Click on the article -> Click in the "Times cited" link -> Export as "Fast 5K" format. Each downloaded file should look like [this](https://github.com/areyesq89/reporte_citas_conacyt/blob/master/data/raw/2012_GENOMERESEARCH_detecting.tsv).
3. Modify the file that you downloaded in step 1 to create a tab separated file that looks like [this](https://github.com/areyesq89/reporte_citas_conacyt/blob/master/generalize/00_mypubs_simple.tsv). In this file each row corresponds to a
publication and the expected columns are:

    * `AU`: author list names separated by ";"
    * `TI`: title of the publication
    * `SO`: journal
    * `DI`: DOI of the paper
    * `PY`: year of the publication
    * `FL`: file with the list of citations retreived using step 2. 
    
    I generated this file by doing in linux `cut -f2,10,18,29,33 00_mypubs.tsv > 00_mypubs_simple.tsv`. Here, the file `00_mypubs.tsv` 
    is the one downloaded from step 1. I then added and filled the column `FL` manually.
  
4. Clone this repository and open the file [`generalize/general_conacyt.Rmd`](https://github.com/areyesq89/reporte_citas_conacyt/blob/master/generalize/general_conacyt.Rmd) using Rstudio. Modify the following lines of the Rmarkdown file:

    * Title of the document in line 2: `title: "Reporte de citas de las publicaciones del Dr. Alejandro Reyes Quiroz"`
    * The `fecha` variable in line 33. Change the date to indicate when you retreived the data in step 2. `fecha <- "5 de Febrero del 2020"`
    * The file name in line 35 to indicate the path to the file generated in step 3. `myPubs <- read.delim("00_mypubs_simple.tsv")`.
    * The `fecha` variable in line 46 to indicate the path 
    to the directory where you downloaded the files in step 2. `dataPath <- file.path("..", "data", "raw")`

5. Finally, knitr the document as a word document and the print it as a pdf. You should see a [nice citation report](https://github.com/areyesq89/reporte_citas_conacyt/blob/master/generalize/general_conacyt.pdf).
