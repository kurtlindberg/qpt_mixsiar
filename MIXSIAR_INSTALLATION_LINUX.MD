# MixSIAR Installation Tutorial for Linux

This tutorial will walk you through all of the steps needed to use MixSIAR (Stock et al., 2018); a framework for creating an running Bayesian mixing models. Instructions here are provided for Linux-based operating systems, see MIXSIAR_INSTALLATION_WINDOWS.MD and MIXSIAR_INSTALLATION_MACOS.MD for installation instructions for Windows and MacOS, respectively. These instructions assume R (>= 4.4.0) is already installed on your system. It is also recommended to have a graphical Integrated Development Environment (IDE), like RStudio, installed for running MixSIAR scripts line by line and to help debug.

Tested Linux distributions:
- Ubuntu (20.04, 22.04, 24.04) and distributions based on these Ubuntu versions (Linux Mint, Pop!_OS, TuxedoOS)
- Debian (12) and distributions based on these versions (MX Linux, Linux Mint Debian Edition)
- Fedora (40, 41)
- OpenSUSE (Leap 15.6, Tumbleweed)
- Arch Linux

_Notes:_\
While many of these steps (i.e. moving, extracting, and installing files) can be done graphically on most Linux systems, the following installation instructions will use Linux terminal commands so they can be applicable to as many Linux configurations as possible.

## Install R packages (pre-JAGS-install)
- This tutorial will (mostly) go over installing the necessary R packages using the `install.packages()` command.
- Open and R console in your terminal or IDE:\
`R`
  - _Note:_ If you use Anaconda as your (base) Python environment, make sure your deactivate it in your terminal session prior to install R packages. Having Anaconda activate can cause library version conflicts between Anaconda and your regular Linux system (confirmed for OpenSUSE). Follow the documentation (https://docs.anaconda.com/anaconda/install/) for instructions on deactivating your Anacodna environment.
- Some packages may reutrn an error when installing due to unment Linux dependencies. Most of the time, the error message will list the missing libraries under a few general categories of operating system type (i.e. deb, rpm, Mac). Ubuntu and Deban distributions fall under the "deb" category while Fedora and OpenSUSE are in the "rpm" category (no missing dependencies encountered in Arch Linux). Open a new tab for your terminal (not in an R console) to install the missing packages:\
`sudo <apt/dnf/zypper> install <package_names>`
- There are some exceptions to the error message pattern that vary between Linux distributions. Here are some packages that need to be installed to avoid more cryptic error messages during the rest of the installation instructions:
  - Ubuntu and Debian:\
`sudo apt install libgdal-dev`
  - Fedora and OpenSUSE:\
`sudo <dnf/zypper> install gcc-fortran geos-devel gdal-devel proj-devel blas* lapack*`
  - Arch Linux:\
`sudo pacman -S gcc-fortran`
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
  - devtools
  - viridisLite
  - EnvStats
  - dplyr
  - OpenMX

## Install JAGS

## Install remaining R packages (post-JAGS-install)

## Post-Installation & References
You should now have everything you need to start using MixSIAR on your Linux system! Consider exploring the very helpful MixSIAR documentation and vignettes here (https://cran.r-project.org/web/packages/MixSIAR/index.html) to start learning how to use the model.

References:\
Stock, B. C., Jackson, A. L., Ward, E. J., Parnell, A. C., Philips, D. L., & Semmens, B. X. (2018). Analyzing mixing systems using a new generation of Bayesian tracer mixing models. _PeerJ, 6,_ e5096. https://doi.org/10.7717/peerj.5096

Yang, D., & Bowen, G. J. (2022). Integrating platn wax abundance and isotopes for paleo-vegetation and paleoclimate reconstructions: A multi-source mixing model using a Bayesian framework. _Climate of the Past, 18_(10), 2181-2210. https://doi.org/10.5194/cp-18-2181-2022
