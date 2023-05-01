# claasp_white_paper
This repository contains all the scripts used to accompany the CLAASP publication. To run the experiments, you must first clone https://github.com/Crypto-TII/claasp on your local machine. After that, you need to clone this repository and change the variables CLAASP_LOCAL_PATH and CLAASP_WHITE_PAPER_LOCAL_PATH according to local paths in Makefile.example.

Specifically, CLAASP_LOCAL_PATH should point to the claasp library folder, while CLAASP_WHITE_PAPER_LOCAL_PATH should point to the folder where you clone this repository. After that, you need to copy the file Makefile.example to Makefile. Finally, you need to run make rundocker.
