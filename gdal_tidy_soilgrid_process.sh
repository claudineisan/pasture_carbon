
#projection soilgrid to egps:4326
gdalwarp -overwrite -multi -wo NUM_THREADS=val/ALL_CPUS --config GDAL_CACHEMAX 512 -wm 4096 -srcnodata 0 -dstnodata 0 -t_srs EPSG:4326 pa_br_bdod_0_30_soilgrid_250m.tif pa_br_bdod_0_30_soilgrid_250m_epgs4326.tif -co COMPRESS=LZW -co BIGTIFF=YES
gdalwarp -overwrite -multi -wo NUM_THREADS=val/ALL_CPUS --config GDAL_CACHEMAX 512 -wm 4096 -srcnodata 0 -dstnodata 0 -t_srs EPSG:4326 pa_br_clay_0_30_soilgrid_250m.tif pa_br_clay_0_30_soilgrid_250m_epgs4326.tif -co COMPRESS=LZW -co BIGTIFF=YES
gdalwarp -overwrite -multi -wo NUM_THREADS=val/ALL_CPUS --config GDAL_CACHEMAX 512 -wm 4096 -srcnodata 0 -dstnodata 0 -t_srs EPSG:4326 pa_br_phh2o_0_30_soilgrid_250m.tif pa_br_phh2o_0_30_soilgrid_250m_epgs4326.tif -co COMPRESS=LZW -co BIGTIFF=YES
gdalwarp -overwrite -multi -wo NUM_THREADS=val/ALL_CPUS --config GDAL_CACHEMAX 512 -wm 4096 -srcnodata 0 -dstnodata 0 -t_srs EPSG:4326 pa_br_sand_0_30_soilgrid_250m.tif pa_br_sand_0_30_soilgrid_250m_epgs4326.tif -co COMPRESS=LZW -co BIGTIFF=YES
gdalwarp -overwrite -multi -wo NUM_THREADS=val/ALL_CPUS --config GDAL_CACHEMAX 512 -wm 4096 -srcnodata 0 -dstnodata 0 -t_srs EPSG:4326 pa_br_silt_0_30_soilgrid_250m.tif pa_br_silt_0_30_soilgrid_250m_epgs4326.tif -co COMPRESS=LZW -co BIGTIFF=YES


#cutline soilgrid to pa_br_limit
gdalwarp -cutline pa_br_brasil_250_2013_ibge/pa_br_brasil_250_2013_ibge.shp -cwhere "Id=0" -crop_to_cutline pa_br_bdod_0_30_soilgrid_250m_epgs4326.tif pa_br_bdod_0_30_soilgrid_250m_epgs4326_cut.tif -dstnodata 0 -co COMPRESS=LZW -co BIGTIFF=YES -co TILED=YES
start gdalwarp -cutline pa_br_brasil_250_2013_ibge/pa_br_brasil_250_2013_ibge.shp -cwhere "Id=0" -crop_to_cutline pa_br_clay_0_30_soilgrid_250m_epgs4326.tif pa_br_clay_0_30_soilgrid_250m_epgs4326_cut.tif -dstnodata 0 -co COMPRESS=LZW -co BIGTIFF=YES -co TILED=YES
strat gdalwarp -cutline pa_br_brasil_250_2013_ibge/pa_br_brasil_250_2013_ibge.shp -cwhere "Id=0" -crop_to_cutline pa_br_phh2o_0_30_soilgrid_250m_epgs4326.tif pa_br_phh2o_0_30_soilgrid_250m_epgs4326_cut.tif -dstnodata 0 -co COMPRESS=LZW -co BIGTIFF=YES -co TILED=YES
start gdalwarp -cutline pa_br_brasil_250_2013_ibge/pa_br_brasil_250_2013_ibge.shp -cwhere "Id=0" -crop_to_cutline pa_br_sand_0_30_soilgrid_250m_epgs4326.tif pa_br_sand_0_30_soilgrid_250m_epgs4326_cut.tif -dstnodata 0 -co COMPRESS=LZW -co BIGTIFF=YES -co TILED=YES
start gdalwarp -cutline pa_br_brasil_250_2013_ibge/pa_br_brasil_250_2013_ibge.shp -cwhere "Id=0" -crop_to_cutline pa_br_silt_0_30_soilgrid_250m_epgs4326.tif pa_br_silt_0_30_soilgrid_250m_epgs4326_cut.tif -dstnodata 0 -co COMPRESS=LZW -co BIGTIFF=YES -co TILED=YES


#resample soilgrid to pa_br_modis_250m
#build vrt
start gdalbuildvrt -r nearest -tr 0.002091294669970 0.002091294669936 -te -73.9919755, -33.7498845, -28.8367410, 5.2736740 pa_br_bdod_0_30_soilgrid_250m_epgs4326_cut.vrt pa_br_bdod_0_30_soilgrid_250m_epgs4326_cut.tif
start gdalbuildvrt -r nearest -tr 0.002091294669970 0.002091294669936 -te -73.9919755, -33.7498845, -28.8367410, 5.2736740 pa_br_clay_0_30_soilgrid_250m_epgs4326.vrt pa_br_clay_0_30_soilgrid_250m_epgs4326.tif
start gdalbuildvrt -r nearest -tr 0.002091294669970 0.002091294669936 -te -73.9919755, -33.7498845, -28.8367410, 5.2736740 pa_br_phh2o_0_30_soilgrid_250m_epgs4326.vrt pa_br_phh2o_0_30_soilgrid_250m_epgs4326.tif
start gdalbuildvrt -r nearest -tr 0.002091294669970 0.002091294669936 -te -73.9919755, -33.7498845, -28.8367410, 5.2736740 pa_br_sand_0_30_soilgrid_250m_epgs4326_cut.vrt pa_br_sand_0_30_soilgrid_250m_epgs4326_cut.tif
start gdalbuildvrt -r nearest -tr 0.002091294669970 0.002091294669936 -te -73.9919755, -33.7498845, -28.8367410, 5.2736740 pa_br_silt_0_30_soilgrid_250m_epgs4326_cut.vrt pa_br_silt_0_30_soilgrid_250m_epgs4326_cut.tif
#translate vrt
start gdal_translate pa_br_bdod_0_30_soilgrid_250m_epgs4326_cut.vrt pa_br_bdod_0_30_soilgrid_250m_epgs4326_cut_resamp.tif -co COMPRESS=LZW -co TILED=YES -co BIGTIFF=YES -co TFW=YES
start gdal_translate pa_br_clay_0_30_soilgrid_250m_epgs4326.vrt pa_br_clay_0_30_soilgrid_250m_epgs4326_resamp.tif -co COMPRESS=LZW -co TILED=YES -co BIGTIFF=YES -co TFW=YES
start gdal_translate pa_br_phh2o_0_30_soilgrid_250m_epgs4326.vrt pa_br_phh2o_0_30_soilgrid_250m_epgs4326_resamp.tif -co COMPRESS=LZW -co TILED=YES -co BIGTIFF=YES -co TFW=YES
start gdal_translate pa_br_sand_0_30_soilgrid_250m_epgs4326_cut.vrt pa_br_sand_0_30_soilgrid_250m_epgs4326_cut_resamp.tif -co COMPRESS=LZW -co TILED=YES -co BIGTIFF=YES -co TFW=YES
start gdal_translate pa_br_silt_0_30_soilgrid_250m_epgs4326_cut.vrt pa_br_silt_0_30_soilgrid_250m_epgs4326_cut_resamp.tif -co COMPRESS=LZW -co TILED=YES -co BIGTIFF=YES -co TFW=YES


