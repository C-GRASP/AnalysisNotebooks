        <strong>> Interpolate Percentiles from Other Dataset Percentiles </strong><br/>
    </p>                       
        
<p style="border: 1px solid #ff5733; border-left: 15px solid #ff5733; padding: 10px; text-align:justify;">
    <strong style="color: #ff5733">The purpose of this notebook</strong>  
    <br/><font color=grey> TThis notebook will output a dataframe containing all of the data from a chosen C-GRASP dataset with  new fields containing an estimated percent error for interpolation of distribution percentiles. This will only be calculated for samples where distribution percentile values are included in the source dataset, as that is the only way to establish a "known" value. As C-Grasp file sizes vary completion of this task will vary with internet connectivity and computer processing power.<font><br/>
    <br/><font color=grey> This notebook provides simple code that estimates the percent error for various interpolated distribution values in the C-Grasp dataset.<font><br/>    
    <br/><font color=grey> To do so, a user choose a CGRASP dataset of choice . <font><br/>
    <br/><font color=grey> The notebook then runs loops through each sample with known distribution percentile values, recalculates that value and calculates an estimate for percent error of the scipy interpolation function (see the "sample_compute_percentile" notebook).<font><br/>    
    </p>
