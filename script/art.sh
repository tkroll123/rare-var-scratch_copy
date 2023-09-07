# conda activate art
# HG00171
art_illumina -ss HSXt -nf 0 -sam -i 175.gi_1.fa -p -l 150 -f 15 -m 500 -s 0 -rs 6 -o sim.reads/175.gi1.rs6.read

awk 'NR%4 == 1 || NR%4 == 2 ' sim.reads/175.gi1.rs6.read?.fq | awk '{if (substr($1,1,1)=="@") {print ">"substr($0,2,length($0)-1)} else {print}}' >175.gi1.read.fa

# NA19650
gi=30
rs=162
art_illumina -ss HSXt -nf 0 -sam -i 175.gi_$gi.fa -p -l 150 -f 15 -m 500 -s 0 -rs $rs -o sim.reads/175.gi$gi.rs$rs.read

awk 'NR%4 == 1 || NR%4 == 2 ' sim.reads/175.gi$gi.rs$rs.read?.fq | awk '{if (substr($1,1,1)=="@") {print ">"substr($0,2,length($0)-1)} else {print}}' >175.gi$gi.read.fa


# generate a small test RPGG, leaving out 
indir=/project/mchaisso_100/cmb-17/vntr_genotyping/analysis/rare_var/test/input/kmers
loo=NA19650
prefs=$(for f in $(ls $indir/*); do basename $f; done | grep -v $loo | cut -b -7 | sort | uniq | awk -v d=$indir '{print d"/"$1}')
genPanKmers -o loo_$loo.175 -m - -k $prefs

ktools serialize loo_$loo.175

