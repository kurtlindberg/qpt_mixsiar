# MixSIAR Installation Tutorial for Linux

This tutorial will walk you through all of the steps needed to use MixSIAR (Stock et al., 2018); a framework for creating an running Bayesian mixing models. Instructions here are provided for Linux-based operating systems, see MIXSIAR_INSTALLATION_WINDOWS.MD and MIXSIAR_INSTALLATION_MACOS.MD for installation instructions for Windows and MacOS, respectively. The full set of instructions can be applied to a completely new system with nothing else installed so feel free to skip ahead if you have already completed steps like installing R and RStudio.

Tested Linux distributions:
- Ubuntu (20.04, 22.04, 24.04) and distributions based on these Ubuntu versions (Linux Mint, Pop!_OS, TuxedoOS)
- Debian (12) and distributions based on these versions (MX Linux, Linux Mint Debian Edition)
- Fedora (40, 41)
- OpenSUSE (Leap 15.6, Tumbleweed)
- Arch Linux

_Notes:_\
While many of these steps (i.e. moving, extracting, and installing files) can be done graphically on most Linux systems, the following installation instructions will use Linux terminal commands so they can be applicable to as many Linux configurations as possible.

## Install R
- R is generally not preinstalled or up to date on most Linux distributions
  - _Note for Ubuntu and Debian:_ Some distributions/versions may not recognize the command 'add-apt-repository' for adding a new repository in the terminal. To fix this, install the associated package containing this command by entering:\
`sudo apt install software-properties-common`
  - _Note for Arch Linux:_ Parts of the tutorial involve building packages from the Arch User Repository (AUR). Make sure you have the 'git' and 'base-devel' packages installed before proceeding:\
`sudo pacman -S --needed git base-devel`
  - You can also use an AUR wrapper like 'yay' (https://github.com/Jguer/yay), but the instructions provided here will follow the traditional steps for building packages through the AUR.

### Ubuntu (https://cran.r-project.org/bin/linux/ubuntu/fullREADME.html):

## Install RStudio (optional, but recommended)

## Install R packages (pre-JAGS-install)

## Install JAGS

## Install remaining R packages (post-JAGS-install)
