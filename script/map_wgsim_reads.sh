rpgg="../input/loo_HG00171.175"

# error-free
pref="175"
danbing-tk -gc 85 -ae -kf 4 1 -cth 45 -o ../output/$pref -k 21 -qs $rpgg -fa ../input/read.fa/$pref.fa -p 2 2>$pref.log | gzip >../output/$pref.aln.gz

# default-error
pref="175.err"
danbing-tk -gc 85 -ae -kf 4 1 -cth 45 -o ../output/$pref -k 21 -qs $rpgg -fa ../input/read.fa/$pref.fa -p 2 2>$pref.log | gzip >../output/$pref.aln.gz

# mismatch = 0.5%, 1bp-indel = 0.1%
pref="175.err.1bpindel"
danbing-tk -gc 85 -ae -kf 4 1 -cth 45 -o ../output/$pref -k 21 -qs $rpgg -fa ../input/read.fa/$pref.fa -p 2 2>$pref.log | gzip >../output/$pref.aln.gz




rpgg="../input/loo_NA19650.175"

# error-free
pref="gi30.175"
danbing-tk.threadv1.20230812 -gc 85 4 -a -kf 4 1 -cth 45 -o ../output/$pref -k 21 -qs $rpgg -fa ../input/read.fa/$pref.fa -p 2 2>$pref.log | gzip >../output/$pref.aln.gz

