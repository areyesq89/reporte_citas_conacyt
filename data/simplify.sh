for i in `ls raw/*tsv`; do j=$(basename $i); k=$(echo $j | awk '{ gsub(/.tsv/, "_simple.tsv"); print }'); cut -f2,10,18,29,33 raw/$j > simple/$k; done
