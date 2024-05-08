# neuro-pipeline
This is a wiki page


Circos
Official Documentation Location
http://circos.ca/
Installation Guide
Linux
Open terminal (Ctrl-Alt-T) and run sudo apt-get update
run sudo apt-get install circos
run circos - error messages will likely appear indicating which packages need to be installed
Install missing dependencies
sudo cpan to open the cpan terminal for installing new perl modules
cpan$ install Missing::Module
To test installation
Download and unzip the current version of circos repository
Navigate to the example folder in circos and ./run to check that the demo .svg and .png files are made
Windows
Download and install Windows Subsystem for Linux and follow the linux tutorial :)
Generating Circos Data Files
Navigate to the circos_scripts folder in a local copy of this repository
Save the following two '.mat' files to that folder:
AreaNames.mat: contains a single variable AreaNames that is a vector of strings, with each string being the name of a brain region you want to plot.
NormalizedCrossSpectra.mat: contains two variables, UKUnorm and s. UKUnorm is a CxCxF array, where C is the number of areas to plot and F iterates over the frequencies in the plot. The values along the diagonals of the CxC slices of UKUnorm should represent the signal within each region and the off-diagonals should represent synchronization of signals between regions. The exact details of how these values are calculated may differ from model to model. For normalization - divide each of the network factors by the RMSE of the sample for that factor from each network. For example, divide the BLA 34 Hz factor in the network by the RMSE of all BLA 34 Hz factors across all learned networks.
Open MATLAB in the circos_scripts folder and run the following command to create data files that the Circos program can use: CreateCircos([f_low, f_high], thresh). Where f_low and f_high are the lowest and highest frequencies, respectively, that you want included in the plot, and thresh is the threshold value that elements of UKUnorm must be larger than in order to be included in the plot.
Aim for about 5% or less of features in the UKUnorm array to be included
You can plot a histogram of the UKUnorm values using histogram(UKUnorm(:)) to see if there is a cluster of features with high UKUnorm values. If so, you might want to set the threshold to plot only that cluster.
Making the plot
Open the terminal and navigate to the circos_scripts folder
Run circos
In terminal run {/path/to/circos/, or just type circos} -conf {/path/to/config.conf}
Note that the config file written by Kaf is in the lab Circos repo and is named circos.conf. This circos.conf is different than the circos.conf file found in the circos directory that is downloaded from circos.ca