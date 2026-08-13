rule RUN_COMBFOLD_ASSEMBLY:
    input:
        subunits_json = os.path.join(OUTDIR,"rule_PREPARE_SUBUNITS_JSON","{comb}.json"),
        pdbs = PDB_DIR,
    output:
        os.path.join(OUTDIR,"rule_RUN_COMBFOLD_ASSEMBLY","{comb}","assembled_results","confidence.txt")
    container:
        COMBFOLD_CONTAINER
    params:
        patched_script = workflow.source_path("../scripts/run_on_pdbs.py")
    shell:
        """
        rm -rf {OUTDIR}/rule_RUN_COMBFOLD_ASSEMBLY/{wildcards.comb}
        python {params.patched_script} \
        {input.subunits_json} \
        {input.pdbs} \
        {OUTDIR}/rule_RUN_COMBFOLD_ASSEMBLY/{wildcards.comb}
        """
