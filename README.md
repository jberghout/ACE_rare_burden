# ACE Tunisia Rare Disease Genetics and Burden Testing Tutorial
---
## Introduction:

This repository was created to support a human genetics and bioinformatics workshop given during the African Centers for Excellence (ACE) Global Council in Sept 2026. Students can find all training materials and example code. 

In order to run all materials, students will need:
1. RStudio or Positron installed on their computer
2. The ability to connect to the [ACE Uganda HPC](https://ace-bioinformatics.github.io/ace-ug-hpc-wiki/)

Optional, but very useful: 

3. A github account

---
## Tutorial Content:

This tutorial walks through an end-to-end rare variant burden analysis workflow in R, from sample-level quality control to gene-based association testing with SKAT-O. It is designed as a practical, reproducible guide for analysts working with sequencing data and VEP-annotated VCF files. Using a synthetic cohort, this tutorial emphasizes transparent filtering logic, interpretable intermediate summaries, and a workflow that can be adapted to real-world rare disease studies.

The tutorial is split into two parts:

### Sample QC and cohort characterization
Builds an analysis-ready cohort by applying call rate, heterozygosity, and sex-concordance checks; then summarizes phenotype and ancestry structure.

### Variant filtering and SKAT-O testing
Parses VEP consequence annotations, applies clinically and functionally informed qualifying-variant filters, constructs genotype dosage matrices, and runs per-gene SKAT-O burden tests with covariate adjustment.

---

## References:

### Online resources

[GeneBass](https://app.genebass.org/): a dashboard of exome-scale burden test summary results across the UK Biobank, testing all genes for association. Variation in ~400,000 people against ~4500 electronic health records codes (a proxy for a clinical diagnosis)

[All-by-All](https://allbyall.researchallofus.org/?state=%7B%22resultLayout%22%3A%22split%22%7D): a dashboard of (coding) genome-scale burden test summary statistics across the All of Us research program, testing all genes for association. Variation in ~400,000 multi-ancestry individuals against ~3500 electronic health records codes.




### Publications

Bose D, Fuchsberger C, Boehnke M. [Rare-variant association studies: When are aggregation tests more powerful than single-variant tests?](https://pubmed.ncbi.nlm.nih.gov/40738106/) Am J Hum Genet. 2025 Aug 7;112(8):1948-1961. doi: 10.1016/j.ajhg.2025.07.002. Epub 2025 Jul 29. PMID: 40738106; PMCID: PMC12414686.

Lee S, Emond MJ, Bamshad MJ, Barnes KC, Rieder MJ, Nickerson DA; NHLBI GO Exome Sequencing Project—ESP Lung Project Team; Christiani DC, Wurfel MM, Lin X. [Optimal unified approach for rare-variant association testing with application to small-sample case-control whole-exome sequencing studies.](https://pmc.ncbi.nlm.nih.gov/articles/PMC3415556/) Am J Hum Genet. 2012 Aug 10;91(2):224-37. doi: 10.1016/j.ajhg.2012.06.007. Epub 2012 Aug 2. PMID: 22863193; PMCID: PMC3415556.

Richards S, Aziz N, Bale S, Bick D, Das S, Gastier-Foster J, Grody WW, Hegde M, Lyon E, Spector E, Voelkerding K, Rehm HL; ACMG Laboratory Quality Assurance Committee. [Standards and guidelines for the interpretation of sequence variants: a joint consensus recommendation of the American College of Medical Genetics and Genomics and the Association for Molecular Pathology.](https://pmc.ncbi.nlm.nih.gov/articles/PMC4544753/) Genet Med. 2015 May;17(5):405-24. doi: 10.1038/gim.2015.30. Epub 2015 Mar 5. PMID: 25741868; PMCID: PMC4544753.



