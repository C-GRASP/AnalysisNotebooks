# Sample Assign Location

### This notebook provides simple code that assigns an address/location to samples within a dataset


* The example script pulls data from SandSnap, but there is also an option for the user to input their own data
*  The notebook then calls in the Open Street Maps geocoder API and uses reverse geocoding to assign an address to a lat/lon location

### This notebooks' output is the input sample dataframe with a new  field containg the address of each sample. As the API needs to be called for each individual sample, it is recommended that the user selects data sparingly if time is a constrait as processing time may take a while depending on internet connectivity. 
