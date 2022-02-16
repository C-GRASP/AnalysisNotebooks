# Sample Compute Cohesive, Sand, Coarse Fraction

### This notebook serves as a guide of how to calculate percent cohesive, percent sand, and percent coarse sediment for each sample within a chosen sample dataset.
  

* The notebook calls selected data from the CGRASP zenodo repository and runs an iterative function that interpolates the cumulative distribution of each sample, and finds the percentage of samples that are below and above the minimum and wentworth classification of sand sediment grain size in millimeters respectively.
* The code will compute and add three new fields to the input sample data dataframe for each sample that specifies the percent cohesives,sands, and coarse of the sample composition. To calculate interpolation error or to translate sample data from phi to mm units, see the other notebooks within this repository.
* The output of the notebook is a csv with the selected CGRASP dataset and the above three new fields.

### To calculate distributions, if needed, see the sample_compute_percentile notebooks.
