# SLURM specifications made in default.cluster.yaml & the individual rules
snakemake --cluster "sbatch -A {cluster.account} --mail-type ALL --mail-user {cluster.email} -p {cluster.partition} -t {cluster.walltime} -o {cluster.output} -e {cluster.error} -c {threads} --mem {resources.mem_mb}" --cluster-config config/config.cluster.yaml --jobs 10 --latency-wait 60 --configfile config/config.default.yaml