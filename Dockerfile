#start from rocker/binder image
FROM rocker/rstudio

RUN apt-get update && . /etc/environment \
  && wget sourceforge.net/projects/mcmc-jags/files/JAGS/4.x/Source/JAGS-4.3.1.tar.gz  -O jags.tar.gz \
  && tar -xf jags.tar.gz \
  && cd JAGS* && ./configure && make -j4 && make install

## httr authentication uses this port
EXPOSE 1410
ENV HTTR_LOCALHOST 0.0.0.0

#set up Conda environment in Jupyter
COPY qpt_conda_env.yaml qpt_conda_env.yaml
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p /miniconda
ENV PATH=$PATH:/miniconda/condabin:/miniconda/bin
RUN Python3 source conda activate -f qpt_conda_env.yaml

#Set up renv
RUN R -e "install.packages('renv', repos = c(CRAN = 'https://cloud.r-project.org'))"
WORKDIR /home/docker_renv
COPY renv.lock renv.lock
ENV RENV_PATHS_LIBRARY renv/library

#restore environment from lockfile
RUN R -e "renv::restore()"

## Declares build arguments
ARG NB_USER
ARG NB_UID

COPY --chown=${NB_USER} . ${HOME}
USER ${NB_USER}
