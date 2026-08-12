rule MULTIQC:
    input:
        get_subunits_json
    output:
        touch("results/rule_MULTIQC/multiqc_report.html"),
    log:
        "results/logs/rule_MULTIQC/multiqc.log",
