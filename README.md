### MINERTIMER SYSTEM FOR LIMITING CHILDRENS' USE OF MINECRAFT (JAVA Edition) ON MAC COMPUTERS

Apple's screentime system is of no use in limiting childrens' use of Minecraft (Java edition) on Macintosh computers. You can read a discussion of this unresolved issue [[here]]( https://bugs.mojang.com/browse/MCL-14705?page=com.atlassian.jira.plugin.system.issuetabpanels%3Acomment-tabpanel&showAll=true).

This project aims to fix that problem. It is a zsh bash script developed by a parent developer (for Soferio Pty Limited) to allow other technically skilled parents to limit Minecraft java edition use by a child on a macos system.

## Tested successfully
The install, uninstall and active scripts have been tested and work at least on a Macbook running Sonoma 14.1.2.

## Overview of how it operates

 Once you follow the instructions below and install the script, it creates a background process which will stop minecraft (even mid-game) after 30 min of total use per day. A short sound will play when shutdown occurs. There is no warning prior to the 30min curfew. 

 *Warning*: If there are any other processes, or applications, with "minecraft" in their name, they will also be stopped immediately.

 *Warning*: the Minecraft application will not be able to be re-opened until the next day, when the next 30-minute budget will be allowed. If you remove the program (using the uninstall script), then the limit will disappear.

## NO LIABILITY
But it depends on the reader being sufficiently technically skilled to install and run scripts in 'Terminal'. If you do not have such competence, you will need to find a colleague to assist you because you can damage your system if you do not know what you are doing.
No liability accepted for any losses caused by use of code. Review code and use at own risk. No support is provided for the use of this code.

## VERSION AND COPYRIGHT
Version 0.9 - Currently under development.
Copyright held by Soferio Pty Ltd

## INDEPENDENT PROJECT
This is an independent third-party project, no affiliation with, or endorsemnent by Mojang or Minecraft.

### INSTALLATION and UNINSTALLATION INSTRUCTIONS

To install the system copy all files to a single directory and then go to terminal, go the directory where those files are located, and run "sudo zsh install_minertimer.sh". You may need to enter your password. To uninstall system, again go to that directory and run "sudo zsh uninstall_minertimer.sh".

### SUPPORT FURTHER DEVELOPMENT
If our code helps you limit your child's Minecraft use to a reasonable amount, please donate here:
[![Donate](https://img.shields.io/badge/Donate-Stripe-green.svg)](https://donate.stripe.com/14kaER0xs4L13cI000). Note that donating does not entitle anyone to any support services in relation to this program. No support will be provided. This is entirely a hobby project and is provided for free and at users' own risk.
