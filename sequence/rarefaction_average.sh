#!/usr/bin/env bash

mkdir temp

mv rarefaction_4000_0.biom.txt rarefaction_4000.biom.txt

for r0 in rarefaction_4000.biom.txt
do

#sed 's/# Constructed from biom file//g' $r0 > rarefaction_4000_.txt
sed -i '1d' $r0
sed 's/#OTU ID/OTUID/' $r0 > ./temp/rarefaction_4000_0.biom.txt

done


for r in rarefaction_4000_*.biom.txt

do

sed -i '2d' $r
sed 's/# Constructed from biom file//g' $r > ./temp/$r

done



cat ./temp/rarefaction_4000_*.biom.txt > rarefaction.txt 

echo -e "#! /usr/bin/env Rscript
data <- read.table('rarefaction.txt', header=T, sep='\t', check.names=F)
head(data)
data1 <- aggregate(. ~ OTUID, data, mean)
write.table(data1,'GMQ_OTU_sub_rarfaction_ave.txt',quote=F,row.names = F,sep='\t')
quit()" > temp1.R

chmod 755 temp1.R
R < temp1.R --no-save

rm -r ./temp
rm temp1.R

mv GMQ_OTU_sub_rarfaction_ave.txt ..

rm *.txt
rm *.biom
