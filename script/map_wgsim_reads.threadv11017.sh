rpgg="../input/loo_HG00171.175"
danbing=danbing-tk.threadv1.20231017.O3

# 175: error-free
# 175.err: default-error
# 175.err.1bpindel: mismatch = 0.5%, 1bp-indel = 0.1%
od=../output/threadv1.1017
id=../input/read.fa

for pref in 175  175.err  175.err.1bpindel; do
	$danbing -gc 85 6 -ae -kf 4 1 -cth 45 -o $od/$pref -k 21 -qs $rpgg -fa $id/$pref.fa -p 1 2>$pref.log | gzip >$od/$pref.aln.gz
done




#rpgg="../input/loo_NA19650.175"

# error-free
#pref="gi30.175"
#danbing-tk.threadv1.20230812 -gc 85 4 -a -kf 4 1 -cth 45 -o ../output/$pref -k 21 -qs $rpgg -fa ../input/read.fa/$pref.fa -p 1 2>$pref.log | gzip >../output/$pref.aln.gz

