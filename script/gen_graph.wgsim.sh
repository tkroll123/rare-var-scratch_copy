# generate a small test RPGG, leaving out HG00171
genPanKmers -o loo_HG00171.175 -m - -k $(ls kmers/*kmers | grep -v HG00171 | cut -b -13 | sort | uniq)

ktools serialize loo_HG00171.175



### SIMULATE READS, see wgsim.log for details
# error-free
wgsim -e 0 -r 0 -R 0 -X 0 -N 356 -1 150 -2 150 175.gi_1.fa fq/175.gi_1.read1.no_err.fq fq/175.gi_1.read2.no_err.fq

awk 'NR%4 == 1 || NR%4 == 2 ' fq/175.gi_1.read?.no_err.fq | awk '{if (substr($1,1,1)=="@") {print ">"substr($0,2,length($0)-1)} else {print}}' >read.fa/175.fa


# default error
wgsim -N 356 -1 150 -2 150 175.gi_1.fa fq/175.gi_1.read1.default_err.fq fq/175.gi_1.read2.default_err.fq

awk 'NR%4 == 1 || NR%4 == 2 ' fq/175.gi_1.read?.default_err.fq | awk '{if (substr($1,1,1)=="@") {print ">"substr($0,2,length($0)-1)} else {print}}' >read.fa/175.err.fa


# mismatch = 0.5%, 1bp-indel = 0.1%
wgsim -e 0.005 -r 0.0001 -R 1 -X 0 -h -N 356 -1 150 -2 150 175.gi_1.fa fq/175.gi_1.read1.err.1bpindel.fq fq/175.gi_1.read2.err.1bpindel.fq

awk 'NR%4 == 1 || NR%4 == 2 ' fq/175.gi_1.read?.err.1bpindel.fq | awk '{if (substr($1,1,1)=="@") {print ">"substr($0,2,length($0)-1)} else {print}}' >read.fa/175.err.1bpindel.fa





# generate a small test RPGG, leaving out NA19650
indir=/project/mchaisso_100/cmb-17/vntr_genotyping/analysis/rare_var/test/input/kmers
loo=NA19650
prefs=$(for f in $(ls $indir/*); do basename $f; done | grep -v $loo | cut -b -7 | sort | uniq | awk -v d=$indir '{print d"/"$1}')
genPanKmers -o loo_$loo.175 -m - -k $prefs

ktools serialize loo_$loo.175

### SIMULATE READS, see wgsim.log for details
# error-free
wgsim -e 0 -r 0 -R 0 -X 0 -N 356 -1 150 -2 150 175.gi_30.fa fq/175.gi_30.read1.no_err.fq fq/175.gi_30.read2.no_err.fq

awk 'NR%4 == 1 || NR%4 == 2 ' fq/175.gi_30.read?.no_err.fq | awk '{if (substr($1,1,1)=="@") {print ">"substr($0,2,length($0)-1)} else {print}}' >read.fa/gi30.175.fa

