# Sample Assign Onshore

## This r file displays the process used to estimate whether samples were gathered on or offshore for sample datasets (Such as US Seabed) that did not contain metadata specifying sample location type (e.g. berm, dune, offshore, etc.) or sampling method type (e.g. hand sample, grab sample, core sample, etc.)

* To do so we use 2 United States shapefiles from Natural Earth data (https://www.naturalearthdata.com/) of 10 and 50m resolution.
* With these two shapefiles, two new datasets are created of samples within each respective polygon.
* Any samples outside of either polygon resolution, of 1:10000000 to 1:50000000 are estimated as offshore. 

### This estimation is intended to be taken with a grain of salt as it is likely that some samples were either taken  just outside of the intertidal zone or in offshore areas missed by the lower resolution. Check the sample_type_code field in the dataset for samples with onshore verification from Metadata.
