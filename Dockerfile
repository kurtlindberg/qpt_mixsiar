#Start from miniconda base
FROM continuumio/miniconda3:latest

#Set working directory
WORKDIR /app

#Copy environment.yaml file
COPY qpt_conda_env.yaml .

# #Add R-lastest repository to apt
# RUN apt-get -y update && apt-get -y install software-properties-common

# RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# RUN gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# RUN add-apt-repository -y deb https://cloud.r-project.org/bin/linux/ubuntu noble-cran40/

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
RUN echo "conda activate $(head -1 environment.yaml | cut -d' ' -f2)" >>
~/.bashrc

#Install R kernel for Jupyter and common R packages
RUN R -e "install.packages(c('IRkernel', 'ggplot2', 'devtools', 'MixSIAR'), repos='http://cran.rstudio.com/')"
RUN R -e "IRkernel::installspec(name = 'ir44', displayname = 'R 4.4', user = FALSE)"

#Install Jupyter Lab
RUN conda install -c conda-forge jupyterlab

#Expose port for Jupyter Lab
EXPOSE 8888

#Start Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]


# #start from r-base
# FROM r-base:latest

# #update Ubuntu
# RUN apt-get -y update
# #  && apt-get install adduser

# #add python
# RUN apt-get -y install python3 python3-pip
# RUN python3 -m pip install --no-cache-dir notebook jupyterlab --break-system-packages
# RUN pip install --no-cache-dir jupyterhub --break-system-packages

# #Install JAGS
# #from apt
# RUN apt-get -y install jags

# #from source
# # RUN apt-get update && . /etc/environment \
# #   && wget sourceforge.net/projects/mcmc-jags/files/JAGS/4.x/Source/JAGS-4.3.2.tar.gz  -O jags.tar.gz \
# #   && tar -xf jags.tar.gz \
# #   && cd JAGS* && ./configure && make -j4 && make install

# ## httr authentication uses this port
# EXPOSE 1410
# ENV HTTR_LOCALHOST 0.0.0.0

# #set up environment in Jupyter
# COPY qpt_conda_env.yaml qpt_conda_env.yaml
# COPY pip_install_from_conda_yaml.py pip_install_from_conda_yaml.py
# RUN python3 pip_install_from_conda_yaml.py

# #Set up renv
# RUN R -e "install.packages('renv', repos = c(CRAN = 'https://cloud.r-project.org'))"
# WORKDIR /home/docker_renv
# COPY . .
# ENV RENV_PATHS_LIBRARY renv/library

# #restore environment from lockfile
# RUN R -e "options(renv.config.pak.enabled = TRUE); renv::restore()"

# #Jupyter NB setup
# ARG NB_USER=jovyan
# ARG NB_UID=1000
# ENV USER ${NB_USER}
# ENV NB_UID ${NB_UID}
# ENV HOME /home/${NB_USER}

# #RUN adduser --disabled-password \
# #    --gecos "Default user" \
# #    --uid ${NB_UID} \
# #    ${NB_USER}

# # Make sure the contents of our repo are in ${HOME}
# COPY . ${HOME}
# USER root
# RUN chown -R ${NB_UID} ${HOME}
# USER ${NB_USER}
