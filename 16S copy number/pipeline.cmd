#split dim1.fna, dim2.fna, dim3.fna to 10 samller files indiviually
sed -n '1,88429466p' Dimensions_chimera_filtered_seqs.filtered.fna > dim1.fna
sed -n '1,8842944p' dim1.fna > dim1.0.fna
sed -n '8842945,17685888p' dim1.fna > dim1.1.fna
sed -n '17685889,26528829p' dim1.fna > dim1.2.fna
sed -n '26528830,35371773p' dim1.fna > dim1.3.fna
sed -n '35371774,44214720p' dim1.fna > dim1.4.fna
sed -n '44214721,53057660p' dim1.fna > dim1.5.fna
sed -n '53057661,61900606p' dim1.fna > dim1.6.fna
sed -n '61900607,70743548p' dim1.fna > dim1.7.fna
sed -n '70743549,79586496p' dim1.fna > dim1.8.fna
sed -n '79586497,88429466p' dim1.fna > dim1.9.fna


sed -n '88429467,176858937p' Dimensions_chimera_filtered_seqs.filtered.fna > dim2.fna

sed -n '1,8842944p' dim2.fna > dim2.0.fna
sed -n '8842945,17685887p' dim2.fna > dim2.1.fna
sed -n '17685888,26528825p' dim2.fna > dim2.2.fna
sed -n '26528826,35371770p' dim2.fna > dim2.3.fna
sed -n '35371771,44214717p' dim2.fna > dim2.4.fna
sed -n '44214718,53057660p' dim2.fna > dim2.5.fna
sed -n '53057661,61900604p' dim2.fna > dim2.6.fna
sed -n '61900605,70743546p' dim2.fna > dim2.7.fna
sed -n '70743547,79586495p' dim2.fna > dim2.8.fna
sed -n '79586496,88429471p' dim2.fna > dim2.9.fna


sed -n '176858937,265288405p' Dimensions_chimera_filtered_seqs.filtered.fna > dim3.fna

sed -n '1,8842941p' dim3.fna > dim3.0.fna
sed -n '8842942,17685883p' dim3.fna > dim3.1.fna
sed -n '17685882,26528825p' dim3.fna > dim3.2.fna
sed -n '26528826,35371768p' dim3.fna > dim3.3.fna
sed -n '35371769,44214713p' dim3.fna > dim3.4.fna
sed -n '44214714,53057656p' dim3.fna > dim3.5.fna
sed -n '53057657,61900603p' dim3.fna > dim3.6.fna
sed -n '61900604,70743546p' dim3.fna > dim3.7.fna
sed -n '70743547,79586492p' dim3.fna > dim3.8.fna
sed -n '79586493,88429468p' dim3.fna > dim3.9.fna
