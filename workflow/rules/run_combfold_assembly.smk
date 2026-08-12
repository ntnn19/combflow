rule RUN_COMBFOLD_ASSEMBLY:
    input:
        subunits_json = os.path.join(OUTDIR,"rule_PREPARE_SUBNITS_JSON","{comb}.json"),
        pdbs = PDB_DIR
    output:
        os.path.join(OUTDIR,"rule_RUN_COMBFOLD_ASSEMBLY","{comb}","assembled_results","confidence.txt")
    container:
        COMBFOLD_CONTAINER
    shell:
        """
        rm -rf {OUTDIR}/rule_RUN_COMBFOLD_ASSEMBLY/{wildcards.comb}
        python /app/CombFold-master/scripts/run_on_pdbs.py \
        {input.subunits_json} \
        {input.pdbs} \
        {OUTDIR}/rule_RUN_COMBFOLD_ASSEMBLY/{wildcards.comb}
        """
