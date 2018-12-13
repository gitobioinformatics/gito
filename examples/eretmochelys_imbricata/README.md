# _De novo_ transcriptome assembly of Eretmochelys Imbricate

This pipeline is based on the work of Hernández-Fernández (2017), which is the first de novo transcriptome assembly of Eretmochelys imbricate published (https://doi.org/10.1016/j.dib.2017.10.015):

## Prerequisites
[Docker](https://www.docker.com) is necessary to run this pipeline, installation instructions can be found [here](https://docs.docker.com/install). If you are using Linux, to manage docker as non-root user, follow the instructions [here](https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user).

## Preparing execution environment
```sh
mkdir -p ~/pipeline/eretmochelys_imbricata
cd ~/pipeline/eretmochelys_imbricata
mkdir bin/ work/
```

## Download 
```sh
wget https://raw.githubusercontent.com/gitobioinformatics/gito/master/examples/eretmochelys_imbricata/run_pipeline.sh -O bin/
chmod +x bin/run_pipeline.sh
```

## Run the pipeline
```sh
./bin/run_pipeline.sh -w work/
```
