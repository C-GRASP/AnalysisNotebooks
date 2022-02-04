## Sample_Compute_Distance_to_Shore
        
<p style="border: 1px solid #ff5733; border-left: 15px solid #ff5733; padding: 10px; text-align:justify;">
    <strong style="color: #ff5733">The purpose of this notebook</strong>  
    <br/><font color=grey> This notebook will output a dataframe containing a new field with an estimated of the distance between each sample from a chosen C-GRASP dataset and the coastline. As C-Grasp file sizes vary completion of this task will vary with internet connectivity and computer processing power.<font><br/>
    <br/><font color=grey> This notebook provides simple code that calculates the distance between each sample from a chosen CGRASP dataset and the NaturalEarth 1:10m physical coastline polyline.<font><br/>    
    <br/><font color=grey> To do so, a user can choose a dataset of choice. This dataset is then called to your system and then converted into a GeoDataFrame<font><br/>
    <br/><font color=grey> The notebook then uses Cartopy to call the NaturalEarth 1:10m coastline polygon<font><br/>
     <br/><font color=grey> This coastline is then converted to a GeoDataFrame object and is cropped to an extent of the Eastern United States<font><br/>  
    <br/><font color=grey> This coastline is then converted to a GeoDataFrame object and is cropped to an extent of the Eastern United States<font><br/> 
    <br/><font color=grey> Finally, using the GeoPandas distance function, the distance between nearest features in both GeoDataFrames (the chosen samples and the coastline polylines) is calculated and added to a new "Distance" field for each sample<font><br/>  
    </p>
