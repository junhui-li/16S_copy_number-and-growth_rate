# open-reference OTU picking using QIIME1 against 'Silva_132_release' database for QIIME

#0 due to big dataset and limited local cpomputer resource, using the subsampled (splitted to 3 subsamples) open-reference OTU picking workflow in iterative mode

#1 split Dimensions.filtered.fna to 3 subsamples: dim1.fna, dim2.fna, dim3.fna: 
sed -n '1,88429466p' Dimensions.filtered.fna > dim1.fna
sed -n '88429467,176858937p' Dimensions.filtered.fna > dim2.fna
sed -n '176858937,265288405p' Dimensions.filtered.fna > dim3.fna


#2 OTU picking: 
pick_open_reference_otus.py -i $PWD/Dimensions/dim1.fna,$PWD/Dimensions/dim2.fna,$PWD/Dimensions/dim3.fna -p otu_SILVA132_settings.txt -r /home/username/silva/SILVA_132_QIIME_release/rep_set/rep_set_16S_only/97/silva_132_97_16S.fna -o $PWD/Dimensions/SILVA132/ -a -O 8


#3 transform to 'OTU seq' fromat:
biom convert -i $PWD/Dimensions/SILVA132/otu_table_mc2_w_tax.biom -o $PWD/Dimensions/SILVA132/otu_table_mc2_w_tax.txt --to-tsv --header-key taxonomy


#4 create the mapping file (sequence to otu), do these three generated 'final_otu_map_mc2.txt' (for dim1.fna, dim2.fna, dim3.fna) individually, then combine: 
awk -F"\t" '{ for (i=2; i<=NF; i++) print $1"\t"$i }' final_otu_map_mc2.txt > silva_otu_seq.txt
cat silva_otu_seq1.txt silva_otu_seq2.txt silva_otu_seq2.txt > silva_otu_seq.txt


#5 filter OTUs with < 0.001% based on the average relative abundance: 
dim_OTU_sub.txt #run in R


#6 convert the filtered OTU table to *.biom format in QIIME: 
biom convert -i $PWD/Dimensions/SILVA132/dim_OTU_sub.txt -o $PWD/Dimensions/SILVA132/dim_OTU_sub.biom --to-hdf5 --table-type="OTU table"


#7 summarize sequences in each sample:
biom summarize-table -i dim_OTU_sub.biom -o dim_summary.txt


#8 the otu table were subsampled (rarefied) at 400 seqs/sample (-d) 100 times (-n) using the command in QIIME: multiple_rarefactions_even_depth.py


#9 convert all the rarefied_otu_tables.biom to *.txt format in QIIME: 
biom convert -i $PWD/Dimensions/SILVA132/rarefied_otu_tables/rarefaction_4000_0.biom -o $PWD/Dimensions/SILVA132/rarefied_otu_tables/rarefaction_4000_0.txt --to-tsv


#10 remove # in the rarefaction_4000_*.txt: 
merge_rarefactions.R --> dimensions_OTU_un_sub_rarefaction_ave.txt


#11 convert the dimensions_OTU_un_sub_rarfaction_ave.txt to dimensions_OTU_un_sub_rarfaction_ave.biom: 
biom convert -i /home/username/Dimensions/SILVA132/rarefied_otu_tables/dimensions_OTU_un_sub_rarfaction_ave.txt -o /home/username/Dimensions/SILVA132/rarefied_otu_tables/dimensions_OTU_un_sub_rarfaction_ave.biom  --to-hdf5 --table-type="OTU table"


