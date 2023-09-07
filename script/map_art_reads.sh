rpgg="../input/loo_HG00171.175"

# default HiSeq TruSeq error profile
# uses a newer version of danbing-tk that corrects leading unaligned kmers subject to maxncorrection=3
# output/175 is the old danbing-tk
# output/175_new_wo_lead uses maxncorrection=3
# output/175.0810 partially fixed leading unaligned kmers
# output/175.8012 fixed bug in edit operations
pref="175.0810"
reads="../input/175.gi1.read.fa"
danbing-tk.threadv1.20230810 -gc 85 -ae -kf 4 1 -cth 45 -o ../output/$pref -k 21 -qs $rpgg -fa $reads -p 1 2>$pref.log | gzip >../output/$pref.aln.gz

danbing-tk.threadv1.20230823 -gc 85 4 -a -kf 4 1 -cth 45 -o ../output/$pref -k 21 -qs $rpgg -fa $reads -p 1 2>$pref.log | gzip >../output/$pref.aln.gz

danbing-tk.threadv1.20230829 -gc 85 4 -a -kf 4 1 -cth 45 -o ../output/$pref -k 21 -qs $rpgg -fa $reads -p 1 2>$pref.log | gzip >../output/$pref.aln.gz

danbing-tk.threadv1.20230901 -gc 85 4 -a -kf 4 1 -cth 45 -o ../output/$pref -k 21 -qs $rpgg -fa $reads -p 1 2>$pref.log | gzip >../output/$pref.aln.gz



rpgg="../input/loo_NA19650.175"
pref="NA19650.175.0812"
reads="../input/175.gi30.read.fa"
danbing-tk.threadv1.20230812 -gc 85 4 -a -kf 4 1 -cth 45 -o ../output/$pref -k 21 -qs $rpgg -fa $reads -p 1 2>$pref.log | gzip >../output/$pref.aln.gz

pref="NA19650.175.0812.gc45_0"
danbing-tk.threadv1.20230812 -gc 45 0 -a -kf 4 1 -cth 45 -o ../output/$pref -k 21 -qs $rpgg -fa $reads -p 1 2>$pref.log | gzip >../output/$pref.aln.gz
