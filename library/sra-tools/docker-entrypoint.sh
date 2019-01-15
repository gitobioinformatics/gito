#!/bin/sh

if [ $(id -u) = 0 ]; then
	cat <<-EOL 
		Don't run this image as root.
		
		Consider adding '--user \$(id -u):\$(id -g)' to docker run arguments

	EOL

	sleep 5
fi

if [ "$#" -eq 0 -o "${1#-}" != "$1" ]; then
	cat <<-EOL

		Hey there! You probably should use one of the following commands:

		    abi-dump        abi-load        align-info
		    bam-load        cache-mgr       cg-load
		    fasterq-dump    fastq-dump      fastq-load
		    helicos-load    illumina-dump   illumina-load
		    kar             kdbmeta         kget
		    latf-load       prefetch        rcexplain
		    sam-dump        sff-dump        sff-load
		    sra-pileup      sra-sort        sra-stat
		    srapath         srf-load        test-sra
		    vdb-config      vdb-copy        vdb-decrypt
		    vdb-dump        vdb-encrypt     vdb-lock
		    vdb-passwd      vdb-unlock      vdb-validate

	EOL

	set -- sh
	sleep 5
fi

exec $@

