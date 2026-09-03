#!/bin/bash
#SBATCH --job-name=vep
#SBATCH --output=logs/vep_%j.log
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=4:00:00

# VEP annotation of VCF. This script was run on NIAID HPC and is not set up to run on Uganda HPC at this time. 

set -euo pipefail

# Set up environment variables for VEP; these must match your install
export VEP_MAJOR_VERSION=112
export VEP_MINOR_VERSION=0
export VEP_VERSION=${VEP_MAJOR_VERSION}.${VEP_MINOR_VERSION}
export EBROOTVEP=/path/software/containers/ensembl-vep/${VEP_VERSION} # Edit this, /path/ is a placeholder
export PERLCUSTOM=${EBROOTVEP}:${EBROOTVEP}/vep_data/Plugins:${EBROOTVEP}/vep_data/Plugins/loftee_GRCh38:${EBROOTVEP}/vep_data/Plugins/UTRannotator

INDIR="/path/ace_burden/data" # Edit this, /path/ is a placeholder
OUTDIR="/path/ace_burden/data" # Edit this, /path/ is a placeholder

mkdir -p ${OUTDIR}

IN_VCF=${INDIR}/synthetic_cohort_noInfo.vcf.gz
OUT_VCF=${OUTDIR}/synthetic_cohort_vep.vcf.gz

echo "Starting VEP annotation at $(date)"

# Run VEP via Apptainer
apptainer exec \
  --home ${PWD} \
  --nv \
  --bind /data:/data \
  --env "PERL5LIB=${PERLCUSTOM}\${PERL5LIB}" \
  ${EBROOTVEP}/ensembl-vep_release_${VEP_VERSION}.sif \
  vep \
    --input_file ${IN_VCF} \
    --output_file ${OUT_VCF} \
    --dir ${EBROOTVEP}/vep_data \
    --cache \
    --dir_plugins ${EBROOTVEP}/vep_data/Plugins \
    --assembly GRCh38 \
    --offline \
    --everything \
    --hgvs \
    --hgvsg \
    --symbol \
    --vcf \
    --pick \
    --compress_output bgzip \
    --fasta ${EBROOTVEP}/vep_data/homo_sapiens/${VEP_MAJOR_VERSION}_GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa.gz \
    --plugin SpliceAI,snv=${EBROOTVEP}/vep_data/Plugins/SpliceAI/spliceai_scores.raw.snv.hg38.vcf.gz,indel=${EBROOTVEP}/vep_data/Plugins/SpliceAI/spliceai_scores.raw.indel.hg38.vcf.gz,cutoff=0.5 \
    --plugin dbNSFP,${EBROOTVEP}/vep_data/Plugins/dbNSFP/4.5a/dbNSFP4.5a_grch38.gz,/data/bcbb/bcbb_apps/software/ncgp/scripts/../lib/vep/dbNSFP_replacement_logic,CADD_raw,CADD_phred,Reliability_index,PrimateAI_score,PrimateAI_pred,VEST4_score,REVEL_score,REVEL_rankscore,MutPred_score,MutPred_protID,MutPred_AAchange,MutPred_Top5features,Interpro_domain,clinvar_review,clinvar_trait,clinvar_clnsig,Aloft_Fraction_transcripts_affected,Aloft_prob_Tolerant,Aloft_prob_Recessive,Aloft_prob_Dominant,Aloft_pred,Aloft_Confidence,Ensembl_transcriptid,Ensembl_proteinid \
    --plugin UTRannotator,${EBROOTVEP}/vep_data/Plugins/UTRannotator/uORF_5UTR_GRCh38_PUBLIC.txt \
    --plugin AlphaMissense,file=${EBROOTVEP}/vep_data/Plugins/AlphaMissense/AlphaMissense_hg38.tsv.gz \
    --plugin LoF,loftee_path:${EBROOTVEP}/vep_data/Plugins/loftee_GRCh38,human_ancestor_fa:${EBROOTVEP}/vep_data/Plugins/loftee_GRCh38/human_ancestor.fa.gz,filter_position:0.05,min_intron_size:15,conservation_file:${EBROOTVEP}/vep_data/Plugins/loftee_GRCh38/loftee.sql,gerp_bigwig:${EBROOTVEP}/vep_data/Plugins/loftee_GRCh38/gerp_conservation_scores.homo_sapiens.GRCh38.bw \
    --fork 8

# Index the output
module load bcftools
bcftools index --threads 8 ${OUT_VCF}

echo "VEP annotation complete at $(date)"
echo "Annotated variants: $(bcftools view -H ${OUT_VCF} | wc -l)"
