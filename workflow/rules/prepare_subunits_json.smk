checkpoint PREPARE_SUBUNITS_JSON:
    input:
        FASTA
    output:
        directory(os.path.join(OUTDIR,"rule_PREPARE_SUBUNITS_JSON"))
    params:
        s=STOICHIOMETRY,
        extra_flags=config.get("extra_prepare_subunits_json_flags", ""),
        helper = workflow.source_path("../scripts/prepare_subunits_json.py")
    conda:
        "../envs/prepare_subunits_json.yaml"
    shell:
        """
        python {params.helper} -f {input} -o {output} -s {params.s} \
        {params.extra_flags}
        """
