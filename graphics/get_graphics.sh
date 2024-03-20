rm -f *.pdf *.png *.sha256

cp ~/github/DyadicKDE.jl/replication/plots/* .
cp ~/github/MondrianForests.jl/replication/partition_plots/plot_mondrian_process_*.pdf .
cp ~/github/MondrianForests.jl/replication/weather/weather_data.png .
cp ~/github/MondrianForests.jl/replication/weather/weather_data_filled_partition.png .
cp ~/github/MondrianForests.jl/replication/weather/weather_forest_2.png .
cp ~/github/MondrianForests.jl/replication/weather/weather_forest_30.png .
cp ~/github/MondrianForests.jl/replication/weather/weather_gcv.png .
cp ~/github/MondrianForests.jl/replication/weather/weather_forest_design.png .
cp ~/github/research-martingale-yurinskii/julia/sim_*.pdf .

pngquant --quality=30 --ext=.png --force *.png
compress-pdf *.pdf
compress-pdf *.pdf
compress-pdf *.pdf

rm -f *.sha256
