#script to download all topobathy data from NCEI at 1/9 arc sec resolution
#DB, NOPP/C-GRASP

#download this file from https://chs.coast.noaa.gov/htdata/raster2/elevation/NCEI_ninth_Topobathy_2014_8483/
input="urllist8483.txt"

#specifiy local directory to download files to
output_direc="NCEI_ninth_Topobathy_2014_8483"

#make output directory
mkdir($output_direc)

while IFS= read -r line
do
  echo "$line"
  wget $line -P $output_direc
done < "$input"
