#Start from miniconda base
FROM continuumio/miniconda3:latest

#Set working directory
WORKDIR /app

#Copy environment.yaml file
COPY qpt_conda_env.yaml .

#Add R-lastest repository to apt
RUN apt-get -y update && apt-get -y install software-properties-common
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
RUN gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
RUN add-apt-repository -y deb https://cloud.r-project.org/bin/linux/ubuntu noble-cran40/

#Install system dependencies and R
RUN apt-get -y update && apt-get install -y \
    r-base \
    r-base-dev \
    libssl-dev \
    libcurl4-openssl-dev\
    libxml2-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    jags \
    && rm -rf /var/lib/apt/lists/*

#Create conda environment from environment.yaml
RUN conda env create -f qpt_conda_env.yaml
RUN echo "conda activate $(head -1 environment.yaml | cut -d' ' -f2)" >> ~/.bashrc

#Install R kernel for Jupyter and common R packages
RUN R -e "install.packages(c('IRkernel', 'ggplot2', 'devtools', 'MixSIAR'), repos='http://cran.rstudio.com/')"
# RUN R -e "IRkernel::installspec(user = FALSE)"

#Install Jupyter Lab in conda environment
RUN conda install -c conda-forge jupyterlab

# #Expose port for Jupyter Lab
# EXPOSE 8888

#Start Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser"]
