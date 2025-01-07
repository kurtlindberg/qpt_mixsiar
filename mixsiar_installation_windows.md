# MixSIAR Installation Tutorial for Windows (Linux Subsystem)

This tutorial will walk you through all of the steps needed to use MixSIAR (Stock et al., 2018); a framework fro creating and running Bayesian mixing models. Instructions here are provided for Windows via the Windwos Subsystem for Linux (WSL), see mixsiar_installation_linux.md and mixsiar_installation_macos.md for installation instructions for Linux and MacOS. These instructions assume R ($`\geq`$4.4.0) is already installed on your WSL system. It is also recommended to have a graphical Integrated Development Environment (IDE), like RStudio, installed for running MixSIAR scripts line by line and to help debug. These instructions also provide you with everything you need to run LipidMM (Yang & Bowen, 2022); another, plant leaf wax-specific Bayesian mixing model framework that uses all of the same resources.

Tested using Windows 10, 11

## Windows Subsystem for Linux
While, is also possible to install MixSIAR and its dependencies entirely within the Windows operating system environment. However, the steps for installing JAGS this way are a lot more complicated since JAGS is primarily designed for UNIX-based operating systems (i.e. MacOS, Linux). Therefore, it is also recommended that you install any graphical IDE you plan to use through the WSL to make it easier to interact with everything else installed in these instructions.

See the instructions for installing WSL in your system if you have not already done so: https://learn.microsoft.com/en-us/windows/wsl/install

Since the default Linux distribution installed with WSL is Ubuntu, the following instructions will assume that is the distribution you are working with. See mixsiar_installation_linux.md for potential variations in the instructions if you are planning to use a different Linux distribution through WSL. For Ubuntu, also see tutorial for installing the most up-to-date version of R on your system: https://cran.r-project.org/bin/linux/ubuntu/fullREADME.html

## Install R packages (pre-JAGS-install)
- If you already have R installed on Windows, none of your packages will carry over to your WSL version.
- This tutorial will (mostly) go over installing the necessary R packages using the `install.packages()` command.
- Open an R console in your terminal (or IDE):\
`R`
- Some packages may reutrn an error when installing due to unment Linux dependencies. Most of the time, the error message will list the missing libraries under a few general categories of operating system type (i.e. deb, rpm, Mac); Ubuntu falls under the "deb" category. Open a new tab for your terminal (not in an R console) to install the missing packages:\
`sudo apt install <package_names>`
- One notable exception to thie error message pattern is the 'libgdal-dev' package, which is often missing and returns a more confusing error message. To install this package, run the following command:\
`sudo apt install libgdal-dev`
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
  - OpenMX

## Install JAGS
- JAGS (Just Another Gibbs Sampler) is the "engine" that power the MixSIAR model and is installed separately from the supporting R packages.
- Download the latest version "JAGS-4.3.2.tar.gz" from SourceForge: https://sourceforge.net/projects/mcmc-jags/files/
- Move to your Windows "Downloads" folder in your WSL terminal:\
`cd /mnt/c/Users/<windows_username>/Downloads`
  - _Optional:_ Print the contents of the Downloads folder to make sure the JAGS file is there:\
`ls` 
- Move the JAGS file to your WSL home directory:\
`mv JAGS-4.3.2.tar.gz ~/`
- Extract the file into a new directory:\
`tar -xvzf JAGS-4.3.2.tar.gz`
- Move to the newly-created JAGS directory:\
`cd JAGS-4.3.2`
- Run the following commands in order to install JAGS:\
`./configure`\
`make`\
`sudo make install`

## Install remaining R packages (post-JAGS-install)
- The remaining R packages depend on JAGS being installed on your system and will fail to install if that cannot locate JAGS
- For some reason, the primary R package that interacts with JAGS, "rjags", does not install through the `install.pacakges()` method. To correctly install rjags, run the following command in a regular terminal (not in R console):\
`sudo apt install r-cran-rjags`
- The following R packages that depend on JAGS and rjags can now be installed:
 - R2jags
 - MixSIAR

## Post-installation & References
You should now have everything you need to start using MixSIAR on Windows (WSL)! Consider exploring the very helpful MixSIAR documentation and vignettes here (https://cran.r-project.org/web/packages/MixSIAR/index.html) to start learning how to use the model.

**References:**\
Stock, B. C., Jackson, A. L., Ward, E. J., Parnell, A. C., Philips, D. L., & Semmens, B. X. (2018). Analyzing mixing systems using a new generation of Bayesian tracer mixing models. _PeerJ, 6,_ e5096. https://doi.org/10.7717/peerj.5096

Yang, D., & Bowen, G. J. (2022). Integrating platn wax abundance and isotopes for paleo-vegetation and paleoclimate reconstructions: A multi-source mixing model using a Bayesian framework. _Climate of the Past, 18_(10), 2181-2210. https://doi.org/10.5194/cp-18-2181-2022
