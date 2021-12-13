# Sample Compute Cohesive, Sand, Coarse Fraction

### This notebook can be used to estimate what percentage of a sample is composed of cohesive, sand, or coarse sized grains.

### It can be used on any dataset that has measured values for distribution percentiles (e.g. d10, d50, d90 etc.). The notebook uses these distributions and scipy's interpolation function to find the percentage of samples that are below and above the minimum and wentworth classification of sand sediment grain size in millimeters respectively to calculate grainsize compostion percentages. 


### To calculate distributions, if needed, see the sample_compute_percentile notebooks.
