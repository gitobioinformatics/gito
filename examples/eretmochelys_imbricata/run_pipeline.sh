#!/bin/sh

set -e

docker_run() {
	docker run \
		--user $USERID:$GROUPID --rm \
		--mount type=bind,src=$PWD,dst=/data \
		--workdir /data \
		 $@
}

pipeline() {
	cd "$WORKDIR"
	mkdir -p sra refs qc trimmed assembly bowtie alignment

	if [ ! -f sra/ok ]; then
		docker_run gitobioinformatics/sra-tools \
			prefetch $NCBI_SRA --output-directory sra/

		touch sra/ok
	fi

	if [ ! -f refs/ok ]; then
		docker_run gitobioinformatics/sra-tools \
			fastq-dump --defline-seq '@$sn/$ri' --split-files --outdir refs/ \
				sra/${NCBI_SRA}.sra

		touch refs/ok
	fi

	if [ ! -f qc/ok ]; then
		docker_run gitobioinformatics/fastqc \
			fastqc \
			refs/${NCBI_SRA}_1.fastq \
			refs/${NCBI_SRA}_2.fastq \
			--outdir qc/ \
			--threads $NJOBS \
			--nogroup

		touch qc/ok
	fi

	if [ ! -f trimmed/ok ]; then
		docker_run gitobioinformatics/trimmomatic \
			trimmomatic \
			PE -phred33 -threads $NJOBS \
			refs/${NCBI_SRA}_1.fastq refs/${NCBI_SRA}_2.fastq \
			trimmed/${NCBI_SRA}_1.fastq trimmed/r1_unpaired.fastq \
			trimmed/${NCBI_SRA}_2.fastq trimmed/r2_unpaired.fastq \
			MINLEN:50 AVGQUAL:20 HEADCROP:15 \
			ILLUMINACLIP:/usr/share/trimmomatic/adapters/TruSeq3-PE-2.fa:2:30:10

		touch trimmed/ok
	fi

	if [ ! -f assembly/ok ]; then
		docker_run gitobioinformatics/trinity \
			trinity \
			--seqType fq --SS_lib_type FR \
			--left trimmed/${NCBI_SRA}_1.fastq \
			--right trimmed/${NCBI_SRA}_2.fastq \
			--output assembly/trinity_assembly \
			--max_memory ${MAXMEM}G --CPU $NJOBS \
			--full_cleanup

		touch assembly/ok
	fi

	if [ ! -f bowtie/ok ]; then
		docker_run gitobioinformatics/bowtie2 \
			bowtie2-build assembly/trinity_assembly.Trinity.fasta bowtie/paired

		touch bowtie/ok
	fi

	if [ ! -f alignment/ok ]; then
		docker_run gitobioinformatics/bowtie2 \
			bowtie2 \
			-x bowtie/paired -S alignment/result.sam \
			-1 trimmed/${NCBI_SRA}_1.fastq -2 trimmed/${NCBI_SRA}_2.fastq \
			--threads $NJOBS

		touch alignment/ok
	fi
}

usage() {
	cat <<- EOF
		Usage: run_pipeline.sh [-w WORKDIR] [options...]

		Options:
		  -g  Set group id for docker (default: current group)
		  -h  Show this help
		  -j  Set number of threads (default: 2)
		  -m  Set maximum memory available for execution (in Gb) (default: 4)
		  -s  Set NCBI run to use (default: SRR5357800)
		  -u  Set user id for docker (default: current user)
		  -w  Set working directory (default: pwd)
	EOF
	
	exit 0
}
		
while getopts "hs:w:j:m:u:g:" opt; do
	case "$opt" in
		h) usage ;;
		s) NCBI_SRA=$OPTARG ;;
		w) WORKDIR=$OPTARG ;;
		j) NJOBS=$OPTARG ;;
		m) MAXMEM=$OPTARG ;;
		u) USERID=$OPTARG ;;
		g) GROUPID=$OPTARG ;;
	esac
done

NCBI_SRA=${NCBI_SRA:-SRR5357800}

WORKDIR=${WORKDIR:-$PWD}

NJOBS=${NJOBS:-2}
MAXMEM=${MAXMEM:-4}

USERID=${USERID:-$(id -u)}
GROUPID=${GROUPID:-$(id -g)}

pipeline

