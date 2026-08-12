checkpoint PREPARE_SUBUNITS_JSON:
    input:
        FASTA 
    output:
        directory(os.path.join(OUTDIR,"PREPARE_SUBUNITS_JSON"))
    params:
        s=STOICHIOMETRY,
        extra_flags=config.get("extra_prepare_subunits_json_flags", "")
    shell:
        """
        python {WORKFLOW_DIR}/scripts/prepare_subunits_json.py -f {input} -o {output} -s {params.s} \
        {params.extra_flags}
        """