#!/bin/bash
# to fillter the samples with sequences less than 3000

for i in Dimensions.fna
do
echo $i

awk '{print $1}' $i > $i.1 # clean the header
grep '>' $i.1 > $i.2 # sequence list
awk -F "_" '{print $1}' $i.2 | awk -F ">" '{print $2}' > $i.3 # sample name list

echo -e "#! /usr/bin/env Rscript
d1<-read.csv('$i.3', header=FALSE, sep=' ')
head(d1)

d1$'seqs'<-rep(1,nrow(d1))
d2 <- aggregate(. ~ V1, d1, sum)
head(d2)
#d2 <- d2[order(-seqs),]
write.table(d2, file='$i.sample.sequence.txt', sep='\t', row.names=F, quote=F)

d3<-subset(d2, as.numeric(as.character(seqs))>=3000, select=c(V1))
head(d3)
dim(d3)

write.table(d3, file='$i.sample.txt', sep=' ', row.names=F, quote=F)
quit()" > temp.R

chmod 755 temp.R
R < temp.R --no-save

tail -n +2 $i.sample.txt > $i.sample1.txt # samples with >=3000 seqs
fgrep -F -f $i.sample1.txt $i.2 | awk -F ">" '{print $2}' > $i.filtered.sample.txt

# borrowed from from Rob Edwards’ lab at San Diego State University 
perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' $i.filtered.sample.txt $i.1 > $i.filtered.fna

rm $i.2
rm $i.3

done
