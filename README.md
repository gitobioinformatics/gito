[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.2529383.svg)](https://doi.org/10.5281/zenodo.2529383)

![Gito](https://raw.githubusercontent.com/gitobioinformatics/gito/master/images/gito.png)

# GITO - A lightweight and safe container for bioinformatics

GITO is a lightweight and safe [Docker](https://www.docker.com) image based on [Alpine](https://alpinelinux.org) containing bioinformatics tools ready to be used. It's is an open source project that provides an easy and modular method for building, distributing, and replicating pipelines, those of which hava a base image ("GITO-based") that forms the foundation layer on which each container is built. A base image is only 4.41 MB in size and contains only the OS libraries and language dependencies required to run the tools, but robust enough to run bioinformatics pipelines with security.

GITO was conceived with the "start with the minimum and add dependencies as needed" philosophy in mind, meaning we encourage separate containers for each bioinformatics tool configured with the minimum to run. GITO uses [*musl libc*](https://www.musl-libc.org) as the standard C library for Linux-based systems. *Musl libc* is free, lightweight, security-oriented and smaller in size compared to 
the *Glibc* library. The source codes for bioinformatics tools, written in C, C++ and Java, have been compiled for native Alpine executables.

## Guide to downloading and running this Docker image
### Step 1: Install Docker

To download and run this Docker image, you first need to set up Docker on your machine. The easiest way to start with Docker is to install the Docker Desktop (https://www.docker.com/products/docker-desktop) by simply downloading and clicking the installer which is available for both Mac OSX and Windows. For Linux users, follow the instructions [here](https://docs.docker.com/install), and to use the CLI without `sudo`, follow the [post-installation steps](https://docs.docker.com/install/linux/linux-postinstall).

### Step 2: Download and run the Docker image

The image can be downloaded and executed through the Docker's CLI with the following commands:

1. Pull (download) the Docker images:

     ```
      $ docker pull gitobioinformatics/fastqc
     ```
        
     ```
      $ docker pull gitobioinformatics/trimmomatic
     ```
        
     ```
      $ docker pull gitobioinformatics/trinity
     ```
        
     ```
      $ docker pull gitobioinformatics/bowtie2
     ```

2. Change the working directory to a project and run the following commands:

   - FastQC
   
        ```
         $ docker run -u $(id -u):$(id -g) -v $PWD:/data -w /data --rm gitobioinformatics/fastqc
        ```
       
   - Trimmomatic
       
        ```
         $ docker run -u $(id -u):$(id -g) -v $PWD:/data -w /data --rm gitobioinformatics/trimmomatic
        ```
        
   - Trinity
       
        ```
         $ docker run -u $(id -u):$(id -g) -v $PWD:/data -w /data --rm gitobioinformatics/trinity
        ```
       
   - Bowtie2
       
        ```
         $ docker run -u $(id -u):$(id -g) -v $PWD:/data -w /data --rm gitobioinformatics/bowtie2
        ```

### Deploy this Docker image onto your cloud

You can download and deploy this Docker image with your cloud provider such as DigitalOcean, Amazon Web Services, HP Enterprise, IBM, Microsoft Azure Cloud or others.

## Reproducing a pipeline example

GITO was used to reproduce the pipeline present in the work of [Hernández-Fernández (2017)](https://doi.org/10.1016/j.dib.2017.10.015), which is the first *de novo* transcriptome assembly of *Eretmochelys imbricata* published. Instructions used and execution results can be [accessed here](https://github.com/gitobioinformatics/gito/tree/master/examples/eretmochelys_imbricata).

## Building from source
To build GITO images from source, you can use the following process:

1. Install latest version of [Docker](https://docs.docker.com/install):

   For Linux users, you can follow the instructions [here](https://docs.docker.com/install/linux/linux-postinstall/) to manage Docker as non-root user. Otherwise, execute `gitobld` script using `sudo`.

2. Get the source code:

   ```
    $ git clone https://github.com/gitobioinformatics/gito.git
    $ cd gito
   ```

3. Create a private and public key to sign the apk packages:

   ```
    $ mkdir -p keys
    $ openssl genrsa -out keys/packager_key.rsa 2048
    $ openssl rsa -in keys/packager_key.rsa -pubout -out keys/packager_key.rsa.pub
   ```

4. Run the helper script to build the images:

   ```
    $ ./gitobld build -SR all
   ```

   You can build individual images by using the tool name instead of `all`.

## Directory structure

| Directory | Description                                                                            |
|-----------|----------------------------------------------------------------------------------------|
| base      | Contains Dockerfile used to build GITO base image.                                     |
| build     | Utilities to create Docker images using GITO as base.                                  |
| examples  | Contains examples of bioinformatics pipelines using GITO images.                       |
| images    | Contains images used by this README.                                                   |
| library   | Dockerfiles used to build several tools, using Alpine packages from `ports` directory. |
| ports     | Contains APKBUILD files for bioinformatic tools.                                       |

## Security and vulnerabilities

Due to the extremely small size, the GITO has a smaller attack surface compared to the containers that are based on larger images. To assess safety, we used [Quay Security Scanner](https://quay.io) to assess vulnerabilities in the GITO. Quay identifies insecure packages by matching the metadata against Common Vulnerabilities and Exposures (CVE) vulnerability database. The results of the analysis were published in the Quay portal, and the scanning of each tool can be accessed below:

| Image | Scanning Result |
| --- | --- |
| Bowtie2 | [![Quay Security Scan](https://img.shields.io/badge/Quay%20Security%20Scan-Passed-brightgreen.svg)](https://quay.io/repository/gitobioinformatics/bowtie2?tab=tags)
| FastQC | [![Quay Security Scan](https://img.shields.io/badge/Quay%20Security%20Scan-Passed-brightgreen.svg)](https://quay.io/repository/gitobioinformatics/fastqc?tab=tags)
| Jellyfish | [![Quay Security Scan](https://img.shields.io/badge/Quay%20Security%20Scan-Passed-brightgreen.svg)](https://quay.io/repository/gitobioinformatics/jellyfish?tab=tags)
| Salmon | [![Quay Security Scan](https://img.shields.io/badge/Quay%20Security%20Scan-Passed-brightgreen.svg)](https://quay.io/repository/gitobioinformatics/salmon?tab=tags)
| Samtools | [![Quay Security Scan](https://img.shields.io/badge/Quay%20Security%20Scan-Passed-brightgreen.svg)](https://quay.io/repository/gitobioinformatics/samtools?tab=tags)
| SRA Tools | [![Quay Security Scan](https://img.shields.io/badge/Quay%20Security%20Scan-Passed-brightgreen.svg)](https://quay.io/repository/gitobioinformatics/sra-tools?tab=tags)
| Trimmomatic | [![Quay Security Scan](https://img.shields.io/badge/Quay%20Security%20Scan-Passed-brightgreen.svg)](https://quay.io/repository/gitobioinformatics/trimmomatic?tab=tags)
| Trinity | [![Quay Security Scan](https://img.shields.io/badge/Quay%20Security%20Scan-Passed-brightgreen.svg)](https://quay.io/repository/gitobioinformatics/trinity?tab=tags)

## License

MIT License. See [LICENSE](LICENSE) for more information

## Contributions

GITO is open-source (see [LICENSE](LICENSE)), and we welcome contributions from anyone who is interested in contributing. To contribute, please make a pull request on github. The issue tracker for GITO is also available on github.

See [CONTRIBUTING.md](CONTRIBUTING.md) for more information.

## Inspirations

The word "gito" is used by people from the North of Brazil when they refer to something "very small, smaller than normal".
The logo of the project was inspired by the tucuxi (*Sotalia fluviatilis*), which is one of the smallest dolphins of the Delphinidae family and the only one of this family that lives in the rivers. It is a very agile dolphin and although it is an endangered species, it is still possible to find it in Amazonian rivers jumping in the air.

## Acknowledgements

We thank the following institutions, which contributed to ensuring the success of our work:<br>

Ministério da Ciência, Tecnologia, Inovação e Comunicação (MCTIC)
    
Museu Paraense Emílio Goeldi (MPEG)
    
Centro Universitário do Estado do Pará (CESUPA)

## Funding

This work has been supported by Conselho Nacional de Desenvolvimento Científico e Tecnológico - CNPq (grants 149985/2018-5; 129954/2018-7)

## Authors

 Marcos Paulo Alves de Sousa<br>
 Franklin Gonçalves Sobrinho <br>
 Lucas Peres Oliveira <br>
 Kayke Correa Conceição Lins Pereira
 
 ## Contact
 
 Dr. Marcos Paulo Alves de Sousa (Project leader)<br>
 
 <i><b>Email:</b> msousa@museu-goeldi.br<br>
 Laboratório de Biologia Molecular<br>
 Museu Paraense Emílio Goeldi<br>
 Av. Perimetral 1901. CEP 66077- 530. Belém, Pará, Brasil.</i>
