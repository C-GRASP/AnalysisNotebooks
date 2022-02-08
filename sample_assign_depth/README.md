          
        <p style="border: 1px solid #ff5733; border-left: 15px solid #ff5733; padding: 10px; text-align:justify;">
    <strong style="color: #ff5733">The purpose of this notebook</strong>  
    <br/><font color=grey> This notebook will output a dataframe containing all of the data from a chosen C-GRASP dataset with a new field containing a depth estimation from NOAA CUDEM topobathy dataset. As both C-Grasp and CUDEM file sizes vary completion of this task will vary with internet connectivity.<font><br/>
    <br/><font color=grey> This notebook provides simple code that estimates a sample's depth based on CUDEM files.<font><br/>    
    <br/><font color=grey> To do so, a user can choose a C-GRASP and CUDEM dataset of choice.  <font><br/>
    <br/><font color=grey> The notebook then downloads all of the CUDEM files of chosen resolution to the user's computer. Please choose resolution carefully as this process take a long time depending on which resolution the user chooses.<font><br/>
    <br/><font color=grey> Then the notebook converts each CUDEM cell value to a csv containing the CUDEM file's depth value and location for each cell. After, these csv's are combined into one dataframe<font><br/>
    <br/><font color=grey> After the CUDEM data conversion, the chosen C-GRASP dataset is downloaded and converted to a dataframe.<font><br/>
        <br/><font color=grey> Finally the two datasets are converted to GeoPandasData frames and are joined by proximity, assigning each downloaded CGRASP sample a depth from the nearest CUDEM value. This data is then downloaded as a csv to the user's system. <font><br/>
    </p>
  
<CUDEM>[https://www.ncei.noaa.gov/metadata/geoportal/rest/metadata/item/gov.noaa.ngdc.mgg.dem:999919/html]:
Cooperative Institute for Research in Environmental Sciences (CIRES) at the University of Colorado, Boulder. 2014: Continuously Updated Digital Elevation Model (CUDEM) - 1/9 Arc-Second Resolution Bathymetric-Topographic Tiles. [indicate subset used]. NOAA National Centers for Environmental Information. https://doi.org/10.25921/ds9v-ky35. 
