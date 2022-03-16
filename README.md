# AnalysisNotebooks

Preliminary (provisional) data, information, or software. This software is preliminary or provisional and is subject to revision. It is being provided to meet the need for timely best science. The software has not received final approval by the U.S. Geological Survey (USGS). No warranty, expressed or implied, is made by the USGS or the U.S. Government as to the functionality of the software and related material nor shall the fact of release constitute any such warranty. The software is provided on the condition that neither the USGS nor the U.S. Government shall be held liable for any damages resulting from the authorized or unauthorized use of the software

## Description

These analysis notebooks serve to exemplify common data access and analysis workflows for Version 1 (March 2022) of the the Coastal Grain Size Portal (C-GRASP) database. This is a preliminary internal deliverable for the National Oceanography Partnership Program (NOPP) Task 1 / USGS Getsch team and project partners only.

Preliminary dataset here
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6099266.svg)](https://zenodo.org/record/6099266#.YhaVgPuIZhE)


## Notebooks

#### Sample Query Notebook
This notebook serves as an easy, interactive querying method for calling C-GRASP East Coast, US, sediment data

[![Open In Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/C-GRASP/AnalysisNotebooks/blob/main/sample_query/sample_query.ipynb)

<p align="center">
  <img src="https://github.com/C-GRASP/AnalysisNotebooks/blob/main/sample_query/sample_query_git.gif" width="700" />
</p>

To start off, you run the first cell. Below, three windows will appear: "Dataset", "Start Year", and "End Year".

"Dataset" will give you options of which sediment dataset you would like to access from the C-Grasp Zenodo site (see more at https://zenodo.org/record/5874231/#.YetG3NuIajg). Simply click on what ever dataset you prefer. These dataset so far are:

    Entire Coastal Dataset: This is all data that is found to be within 10km of the Natural Earth coastline polyline
    Estimated Onshore Dataset: This is all the data from "Entire Coastal Dataset" that lies within the Natural Earth United States Polygon
    Verified Onshore Dataset: This is all data that was able to be verified onshore from either sampling method, note, or location type data

"Start Year" is the beginning year that you want to query all of your data from. Click on this box, delete the "y's" and enter in your four digit year.

"End Year" is the end year of dates that you want to query samples from using the sample method from "Start Year". If you only want to query dates from one year, enter in the same year that you entered in "Start Year"
Then, proceed to the next cell. When you run this cell, your chosen dataset will be called to your system. After the data is accessed, a map from the iPyleaflet toolbox will appear displaying all of the data that you queried in the first cell. On this map, you then draw a box around which data you desire to download. If you are choosing to download data from more than one year, below this map a histogram of sample year frequency will appear for the data queried in the first cell. of Note: depending on your internet connectivity and which dataset you choose, processing time for this step may vary.

Map directions:

    To zoom in and out of the map, press the +/- signs on the upper left hand corner.
    To navigate/pan around the map, click and drag in the opposite direction that you want to navigate
    To select your data, click the rectangle button in the left pannel of the map. Then, click from one corner of your region of interest, and move your mouse diagonally to cover your entire region. Click again to finish.
        If you would like to redo this selection, click on the trash icon in the left panel, select "Clear All", and try again
    Once you are happy with your query, simply move on to the next cell

The last cell down your data. When you run this cell, your queried data will download to your computer in the same folder where this notebook is stored. If you wish to save this data, rename it appropriately in your file browser. The cell will show a frequency histogram for the year dates of the samples downloaded to your computer. If you would like to alter your query, select the "restart the kernel" button to your Jupyter notebook tool bar and repeat the above tasks.

#### Assign sample water depth

This notebook will output a dataframe containing all of the data from a chosen C-GRASP dataset with a new field containing a depth estimation from NOAA CUDEM topobathy dataset. As both C-Grasp and CUDEM file sizes vary completion of this task will vary with internet connectivity.

This notebook provides simple code that estimates a sample's depth based on CUDEM files.

To do so, a user can choose a C-GRASP and CUDEM dataset of choice.

The notebook then downloads all of the CUDEM files of chosen resolution to the user's computer. Please choose resolution carefully as this process take a long time depending on which resolution the user chooses.

Then the notebook converts each CUDEM cell value to a csv containing the CUDEM file's depth value and location for each cell. After, these csv's are combined into one dataframe

After the CUDEM data conversion, the chosen C-GRASP dataset is downloaded and converted to a dataframe.

Finally the two datasets are converted to GeoPandasData frames and are joined by proximity, assigning each downloaded CGRASP sample a depth from the nearest CUDEM 

[![Open In Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/C-GRASP/AnalysisNotebooks/blob/main/sample_assign_depth/sample_assign_depth.ipynb)


#### Assign sample location

This notebook will output a dataframe containing all of the data from a chosen C-GRASP dataset with a new field containing the address of each sample. As the API needs to be called for each individual sample, it is recommended that the user selects data sparingly if time is a constrait as processing time may take a while depending on internet connectivity.

This notebook provides simple code in order to assign an address/location name to samples within a dataset.

To do so, a user can input a dataset of choice.

The notebook then calls in the Open Street Maps geocoder API and uses reverse geocoding to assign an address to a lat/lon location.

[![Open In Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/C-GRASP/AnalysisNotebooks/blob/main/sample_assign_location/sample_assign_location.ipynb)


#### Compute Cohesive, Sand, and Coarse Fractions per sample
This notebook serves as a guide of how to calculate percent cohesive, percent sand, and percent coarse sediment for each sample within a chosen sample dataset.

This notebook calls selected data from the CGRASP zenodo repository and runs an iterative function that interpolates the cumulative distribution of each sample, and finds the percentage of samples that are below and above the minimum and wentworth classification of sand sediment grain size in millimeters respectively.

The code will compute and add three new fields to the input sample data dataframe for each sample that specifies the percent cohesives,sands, and coarse of the sample composition. To calculate interpolation error or to translate sample data from phi to mm units, see the other notebooks within this repository.

The output of the notebook is a csv with the selected CGRASP dataset and the above three new fields

[![Open In Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/C-GRASP/AnalysisNotebooks/blob/main/sample_compute_cohesive_sand_coarse_fraction/sample_compute_cohesive_sand_coarse_fraction.ipynb)


#### Compute distance to shore per sample
This notebook will output a dataframe containing a new field with an estimated of the distance between each sample from a chosen C-GRASP dataset and the coastline. As C-Grasp file sizes vary completion of this task will vary with internet connectivity and computer processing power.

This notebook provides simple code that calculates the distance between each sample from a chosen CGRASP dataset and the NaturalEarth 1:50m physical coastline polyline.

To do so, a user can choose a dataset of choice. This dataset is then called to your system and then converted into a GeoDataFrame

The notebook then uses Cartopy to call the NaturalEarth 1:10m coastline polygon

This coastline is then converted to a GeoDataFrame object and is cropped to an extent of the Eastern United States

This coastline is then converted to a GeoDataFrame object and is cropped to an extent of the Eastern United States

Finally, using the GeoPandas distance function, the distance between nearest features in both GeoDataFrames (the chosen samples and the coastline polylines) is calculated and added to a new "Distance" field for each sample

[![Open In Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/C-GRASP/AnalysisNotebooks/blob/main/sample_compute_distance_to_shore/sample_compute_distance_to_shore.ipynb)


#### Compute grain size percentile interpolation error
This notebook will output a CSV containing all of the data from a chosen C-GRASP dataset with new fields containing an estimated percent error for interpolation of distribution percentiles. This will only be calculated for samples where distribution percentile values are included in the source dataset, as that is the only way to establish a "known" value. As C-Grasp file sizes vary completion of this task will vary with internet connectivity and computer processing power.

This notebook provides simple code that estimates the percent error for various interpolated distribution values in the C-Grasp dataset.

To do so, a user choose a CGRASP dataset of choice .

The notebook then runs loops through each sample with known distribution percentile values, recalculates that value and calculates an estimate for percent error of the scipy interpolation function (see the "sample_compute_percentile" notebook).

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/C-GRASP/AnalysisNotebooks/blob/main/sample_compute_interpolation_error/sample_compute_interpolation_error.ipynb)


#### Compute custom grain size percentiles
This notebook will output a CSV containing all of the data from a chosen C-GRASP dataset with a new field containing an cumulative distribution percentile interpolated from pre-existing dataset distribution percentile values. As C-Grasp file sizes vary completion of this task will vary with internet connectivity.

This notebook provides simple code that interpolates input distribution percentile values from already calculated values.

To do so, a user can choose a dataset of choice and then types the percentile they wish to calculate.

The notebook then runs uses a the scipy interpolation function to calculate the input percentile in mm units.

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/C-GRASP/AnalysisNotebooks/blob/main/sample_compute_percentiles/sample_compute_percentiles.ipynb)


#### Convert mm to phi for all grain size data fields
This notebook will output a CSV containing all of the data from a chosen C-GRASP dataset with all measurements in mm units converted to Phi units. As C-Grasp file sizes vary completion of this task will vary with internet connectivity.

This notebook provides simple code in order to convert measurements in mm to phi for each sample within a dataset.

To do so, a user can choose a dataset of choice.

The notebook then runs a simple conversion on each column containing mm untis and converts them to Phi.

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/C-GRASP/AnalysisNotebooks/blob/main/sample_convert_phi/sample_convert_phi.ipynb)



### installation

```bash
conda env create --file env/cgrasp.yml
conda activate cgrasp
```

### run jupyter

```bash
jupyter notebook
```

then in your web browser, select a notebook to run

## Third-party Data 
Calls data from [Natural Earth Data](https://www.naturalearthdata.com/downloads/) using [Cartopy](https://pypi.org/project/Cartopy/)


Calls data from [NOAA CUDEM](https://www.ncei.noaa.gov/metadata/geoportal/rest/metadata/item/gov.noaa.ngdc.mgg.dem:999919/html) 
