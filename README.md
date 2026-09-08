# ACE Tunisia Rare Disease Genetics and Burden Testing Tutorial
---
## Introduction:

This repository was created to support a human genetics and bioinformatics workshop given during the African Centers for Excellence (ACE) Global Council in Sept 2026. Students can find all training materials and example code. 

**Date:** Wednesday, Sept 9, 2026 @9am-noon

**Location:** Institute Pasteur Tunis (not the Sheraton Hotel Tunis): [address](https://www.google.com/maps/place/Institut+Pasteur/@36.8225779,10.1790455,17z/data=!4m14!1m7!3m6!1s0x12fd3485d1a37e79:0xd742845b5ac72989!2sInstitut+Pasteur!8m2!3d36.8225779!4d10.1790455!16s%2Fg%2F121rps8z!3m5!1s0x12fd3485d1a37e79:0xd742845b5ac72989!8m2!3d36.8225779!4d10.1790455!16s%2Fg%2F121rps8z?entry=ttu&g_ep=EgoyMDI2MDkwMi4wIKXMDSoASAFQAw%3D%3D) 
If you are leaving from the Sheraton Hotel, a shuttle will depart from the lobby at 8:30am. If you are a student staying at the hotel that was arranged by ACE, it should be only a 2min walk. 

**Contact:** Joanne Berghout joanne.berghout@nih.gov or WhatsApp +1 2072660930 

## Set up:
In order to run all materials, you will need a computer with R and R Studio and you will need some data files. We can help you with this, but it will be a great time savings if you can get this set up before we begin.

There are three ways to get R & RStudio working for you:
1. If you already have the ability to connect to [ACE Uganda HPC](https://ace-bioinformatics.github.io/ace-ug-hpc-wiki/) which can be connected to via [OnDemand](https://ondemand.ace.ac.ug/pun/sys/dashboard), you're all set! You will
    * go to the OnDemand link, click on the RStudio Server icon
    * in `Number of hours`, request 3h. Otherwise, leave as defaults
    *  click `Launch` and wait for the message `Session was successfully created.` to appear (a few seconds)
    * scroll to the bottom of the session section and click `Connect to RStudio Server`

2. If you are working with your personal laptop, you can install these from the internet. They are free and open source, and should be straightforward
   * If you have downloaded R before, or think you have - open the Terminal or Command Shell and type R --version. If this gives you a version, you have R. If this gives you an error, you need to install
   * Download R, following the instructions on this page: https://www.r-project.org/
      * you can use any mirror, I will recommend: Worldwide https://mirrors.cicku.me/cran/
   * Download RStudio, following the instructions here: https://posit.co/products/open-source/rstudio
  
3. If you do not have a laptop or ACE account, the computer room does have computers and almost all of these do have R and RStudio. This will also work. However - you can't take it home with you.

Once you have R and RStudio set up and open, you can install the following R packages from inside it: `tidyverse`, `SKAT`, `skimr`, `patchwork`, `VariantAnnotation`.

There are two ways to get the data:

1. If you have an ACE HPC account, you're all set! All data we will use are pre-loaded
2. If you do not have an ACE HPC account or just prefer to work from local files, you can download all files from the `data` folder in this github. Just open the folder, click on each file and use the icon on the right to download the raw file to your computer and keep track of where they are.

---
## Tutorial Content:

This tutorial walks through an end-to-end rare variant burden analysis workflow in R, from sample-level quality control to gene-based association testing with SKAT-O. It is designed as a practical, reproducible guide for analysts working with sequencing data and VEP-annotated VCF files. Using a synthetic cohort, this tutorial emphasizes transparent filtering logic, interpretable intermediate summaries, and a workflow that can be adapted to real-world rare disease studies.

The tutorial is split into two parts:

### Sample QC and cohort characterization
Builds an analysis-ready cohort by applying call rate, heterozygosity, and sex-concordance checks; then summarizes phenotype and ancestry structure.
This can be found in the code folder as `skat_tutorial_part1.qmd` (english) or `skat_tutorial_part1_fr.qmd` (french).

### Variant filtering and SKAT-O testing
Parses VEP consequence annotations, applies clinically and functionally informed qualifying-variant filters, constructs genotype dosage matrices, and runs per-gene SKAT-O burden tests with covariate adjustment.
This can be found in the code folder as `skat_tutorial_variants_part2.qmd` (english) or `skat_tutorial_variants_part2_fr.qmd` (french).

---

## References:

### Online resources

[GeneBass](https://app.genebass.org/): a dashboard of exome-scale burden test summary results across the UK Biobank, testing all genes for association. Variation in ~400,000 people against ~4500 electronic health records codes (a proxy for a clinical diagnosis)

[All-by-All](https://allbyall.researchallofus.org/?state=%7B%22resultLayout%22%3A%22split%22%7D): a dashboard of (coding) genome-scale burden test summary statistics across the All of Us research program, testing all genes for association. Variation in ~400,000 multi-ancestry individuals against ~3500 electronic health records codes.




### Publications

Bose D, Fuchsberger C, Boehnke M. [Rare-variant association studies: When are aggregation tests more powerful than single-variant tests?](https://pubmed.ncbi.nlm.nih.gov/40738106/) Am J Hum Genet. 2025 Aug 7;112(8):1948-1961. doi: 10.1016/j.ajhg.2025.07.002. Epub 2025 Jul 29. PMID: 40738106; PMCID: PMC12414686.

Lee S, Emond MJ, Bamshad MJ, Barnes KC, Rieder MJ, Nickerson DA; NHLBI GO Exome Sequencing Project—ESP Lung Project Team; Christiani DC, Wurfel MM, Lin X. [Optimal unified approach for rare-variant association testing with application to small-sample case-control whole-exome sequencing studies.](https://pmc.ncbi.nlm.nih.gov/articles/PMC3415556/) Am J Hum Genet. 2012 Aug 10;91(2):224-37. doi: 10.1016/j.ajhg.2012.06.007. Epub 2012 Aug 2. PMID: 22863193; PMCID: PMC3415556.

Richards S, Aziz N, Bale S, Bick D, Das S, Gastier-Foster J, Grody WW, Hegde M, Lyon E, Spector E, Voelkerding K, Rehm HL; ACMG Laboratory Quality Assurance Committee. [Standards and guidelines for the interpretation of sequence variants: a joint consensus recommendation of the American College of Medical Genetics and Genomics and the Association for Molecular Pathology.](https://pmc.ncbi.nlm.nih.gov/articles/PMC4544753/) Genet Med. 2015 May;17(5):405-24. doi: 10.1038/gim.2015.30. Epub 2015 Mar 5. PMID: 25741868; PMCID: PMC4544753.



