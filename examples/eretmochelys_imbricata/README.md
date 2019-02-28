# *De novo* transcriptome assembly of *Eretmochelys Imbricata*

Gito was used to reproduce the pipeline present in the work of [Hernández-Fernández (2017)](https://doi.org/10.1016/j.dib.2017.10.015), which is the first *de novo* transcriptome assembly of *Eretmochelys Imbricata* published.

## Prerequisites

[Docker](https://www.docker.com) is necessary to run this pipeline. Installation instructions can be found [here](https://docs.docker.com/install). If you are using Linux, to manage docker as non-root user, follow the instructions [here](https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user).

## Preparing execution environment

```sh
$ mkdir -p ~/pipeline/eretmochelys_imbricata
$ cd ~/pipeline/eretmochelys_imbricata
$ mkdir bin/ work/
```

## Download 

```sh
$ wget https://raw.githubusercontent.com/gitobioinformatics/gito/master/examples/eretmochelys_imbricata/run_pipeline.sh -O bin/
$ chmod +x bin/run_pipeline.sh
```

## Run the pipeline

```sh
$ ./bin/run_pipeline.sh -w work/
```

## The mean pipeline execution time

Containers were created with the Gito image in the DigitalOcean cloud with a virtual server of 16 GB RAM and 8 cores using Container Linux 1800.7.0 operating system. The pipeline was run 10 times using the same dataset (5.7 GB raw sequence data with 47,555,108 raw reads), with the average execution time of each tool and the complete pipeline calculated for each run. The tools used were [Fastqc 0.11.7](http://www.bioinformatics.babraham.ac.uk/projects/fastqc), [Trimmomatic 0.38](http://www.usadellab.org/cms/?page=trimmomatic), [Trinity 2.8.4](https://github.com/trinityrnaseq/trinityrnaseq/releases) and [Bowtie 1.2.2](http://bowtie-bio.sourceforge.net/index.shtml). Average run times for the pipeline components are presented in the table below.

| Step | Average execution time |
| --- | --- |
| FastQC | 2m 47s |
| Trimmomatic | 1m 41s |
| Trinity | 10h 4m 0s |
| Bowtie2 | 51m 26s |
| Complete pipeline | 10h 59m 54s |

