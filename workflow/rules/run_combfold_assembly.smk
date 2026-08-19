rule RUN_COMBFOLD_ASSEMBLY:
    input:
        subunits_json = os.path.join(OUTDIR,"rule_PREPARE_SUBUNITS_JSON","{comb}.json"),
        pdbs = PDB_DIR,
    output:
        os.path.join(OUTDIR,"rule_RUN_COMBFOLD_ASSEMBLY","{comb}","assembled_results","confidence.txt")
    container:
        COMBFOLD_CONTAINER
    params:
        output_dir = os.path.join(OUTDIR, "rule_RUN_COMBFOLD_ASSEMBLY"),
        tmp_dir = lambda wc: os.path.join(OUTDIR, "rule_RUN_COMBFOLD_ASSEMBLY", f".{wc.comb}.tmp")
    log:
        os.path.join(OUTDIR, "logs", "rule_RUN_COMBFOLD_ASSEMBLY", "{comb}.log"),
    benchmark:
        os.path.join(OUTDIR, "benchmarks", "rule_RUN_COMBFOLD_ASSEMBLY", "{comb}.tsv")
    shell:
        """
        rm -rf {params.tmp_dir}
        python /app/CombFold-master/scripts/run_on_pdbs.py \
            {input.subunits_json} {input.pdbs} {params.tmp_dir} && \
        rm -rf {params.output_dir}/{wildcards.comb} && \
        mv {params.tmp_dir} {params.output_dir}/{wildcards.comb} \
        2>&1 | tee {log}
        """
