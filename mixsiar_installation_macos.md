# MixSAIR Installation Tutorial for MacOS

This tutorial will walk you through all of the steps needed to use MixSIAR (Stock et al., 2018); a framework for creating an running Bayesian mixing models. Instructions here are provided for MacOS, see mixsiar_installation_windows.md and mixsiar_installation_linux.md for installation instructions for Windows and Linux, respectively. These instructions assume R ($`\geq`$4.4.0) is already installed on your system. It is also recommended to have a graphical Integrated Development Environment (IDE), like RStudio, installed for running MixSIAR scripts line by line and to help debug. These instructions also provide you with everything you need to run LipidMM (Yang & Bowen, 2022); another, plant leaf wax-specific Bayesian mixing model framework that uses all of the same resources.

_Notes:_\
Requires MacOS 12+. Tested using MacOS 12.7.6 (Monterey)

## Install R packages (pre-JAGS-install)
- This tutorial will (mostly) go over installing the necessary R packages using the `install.packages()` command.
- Open and R console in your terminal (or IDE):\
`R`
- Some packages may reutrn an error when installing due to unment Linux dependencies. Most of the time, the error message will list the missing libraries under a few general categories of operating system type (i.e. deb, rpm, Mac). Open a new tab for your terminal (not in an R console) to install the missing packages:\
`brew install <package_names>`
- The following packages should be installed prior to installing JAGS:
  - ggplot2
  - RColorBrewer
  - MASS
  - reshape
  - reshape2
  - lattice
  - MCMCpack
  - ggmcmc
  - coda
  - loo
  - bayesplot
  - splancs
  - usethis
  - devtools
  - viridisLite
  - EnvStats
  - dplyr

## Install JAGS
- JAGS (Just Another Gibbs Sampler) is the "engine" that power the MixSIAR model and is installed separately from the supporting R packages.
- Before installing JAGS, you will need to install command line compilers for you terminal. Enter the following commands to install the basic command line compilers from "xcode-select" and the Fortran compiler "gfortran":\
`xcode-select --install`\
`brew install gfortran`
- Download the latest version "JAGS-4.3.2.tar.gz" from SourceForge: https://sourceforge.net/projects/mcmc-jags/files/
- Move the JAGS-4.3.2.tar.gz file to a suitable working space on your computer (home folder is probably easiest), and double click on the file to extract it as a new directory.
- Move to the newly-created JAGS-4.3.2 directory/folder (change the file path to wherever you extracted the JAGS file to):\
`cd JAGS-4.3.2`
- Enter the following command in the terminal to include the Accelerate framework for installing JAGS:\
`export LDFLAGS="-framework Accelerate"`
- Run the following commands in order to install JAGS:\
`./configure`\
`make -j 8`\
`sudo make install`

## Install remaining R packages (post-JAGS-install)
- The remaining R packages depend on JAGS being installed on your system and will fail to install if that cannot locate JAGS.
- The following R packages that depend on JAGS can now be installed:
  - rjags
  - R2jags
  - MixSIAR

## Post-Installation & References
You should now have everything you need to start using MixSIAR on MacOS! Consider exploring the very helpful MixSIAR documentation and vignettes here (https://cran.r-project.org/web/packages/MixSIAR/index.html) to start learning how to use the model.

**References:**\
Stock, B. C., Jackson, A. L., Ward, E. J., Parnell, A. C., Philips, D. L., & Semmens, B. X. (2018). Analyzing mixing systems using a new generation of Bayesian tracer mixing models. _PeerJ, 6,_ e5096. https://doi.org/10.7717/peerj.5096

Yang, D., & Bowen, G. J. (2022). Integrating platn wax abundance and isotopes for paleo-vegetation and paleoclimate reconstructions: A multi-source mixing model using a Bayesian framework. _Climate of the Past, 18_(10), 2181-2210. https://doi.org/10.5194/cp-18-2181-2022
