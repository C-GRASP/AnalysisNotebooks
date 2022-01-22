# Sample Query Notebook

### This notebook serves as an easy, interactive querying method for calling  C-GRASP East Coast, US, sediment data!
------

#### To start off, you run the first cell. Below, three windows will appear: "Dataset", "Start Year", and "End Year".

"Dataset" will give you options of which sediment dataset you would like to access from the C-Grasp Zenodo site (see more at https://zenodo.org/record/5874231/#.YetG3NuIajg). Simply click on what ever dataset you prefer. These dataset so far are:
  * Entire Coastal Dataset: This is all data that is found to be within 10km of the Natural Earth coastline polyline
  * Estimated Onshore Dataset: This is all the data from "Entire Coastal Dataset" that lies within the Natural Earth United States Polygon
  * Verified Onshore Dataset: This is all data that was able to be verified onshore from either sampling method, note, or location type data
 
"Start Year" is the beginning year that you want to query all of your data from. Click on this box, delete the "y's" and enter in your four digit year.

"End Year" is the end year of dates that you want to query samples from using the sample method from "Start Year". If you only want to query dates from one year, enter in the same year that you entered in "Start Year"

------

#### Then, proceed to the next cell. When you run this cell, your chosen dataset will be called to your system. After the data is accessed, a map from the iPyleaflet toolbox will appear displaying all of the data that you queried in the first cell. On this map, you then draw a box around which data you desire to download. If you are choosing to download data from more than one year, below this map a histogram of sample year frequency will appear for the data queried in the first cell. of  Note: depending on your internet connectivity and which dataset you choose, processing time for this step may vary.

Map directions:
  * To zoom in and out of the map, press the +/- signs on the upper left hand corner.
  * To navigate/pan around the map, click and drag in the opposite direction that you want to navigate
  * To select your data, click the rectangle button in the left pannel of the map. Then, click from one corner of your region of interest, and move your mouse diagonally to cover your entire region. Click again to finish.
    * If you would like to redo this selection, click on the trash icon in the left panel, select "Clear All", and try again
  * Once you are happy with your query, simply move on to the next cell 

------

#### The last cell down your data. When you run this cell, your queried data will download to your computer in the same folder where this notebook is stored. If you wish to save this data, rename it appropriately in your file browser. The cell will show a frequency histogram for the year dates of the samples downloaded to your computer. If you would like to alter your query, select the "restart the kernel" button to your Jupyter notebook tool bar and repeat the above tasks. 





<p align="center">
  <img src="https://github.com/C-GRASP/AnalysisNotebooks/blob/main/sample_query/sample_query_git.gif" width="700" />
</p>
