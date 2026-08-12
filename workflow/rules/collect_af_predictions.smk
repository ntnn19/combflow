rule CIF_2PDB:
    input:
        os.path.join(OUTPUT_DIR,"rule_GET_COMPLETED_MODELS","{mono}","{cluster}_seed-{seed}_sample-{sample}_model.cif"), #expecting upper for cluster
    output:
        os.path.join(OUTPUT_DIR,"rule_CIF_2PDB","{mono}","{cluster}_seed-{seed}_sample-{sample}_model.pdb"), #expecting upper for cluster
    container:
        "/gpfs/cssb/group/cssb-topf/natan/singularity_containers/modelcif-converters/modelcif-converters:44ab3080.sif"
    shell:
        """
        gemmi convert {input} {output}
        """

rule COLLECT_PDBS:
    input:
        os.path.join(OUTPUT_DIR,"rule_CIF_2PDB","{mono}","{cluster}_seed-{seed}_sample-{sample}_model.pdb"), #expecting upper for cluster
    output:
        os.path.join(OUTPUT_DIR,"rule_COLLECT_PDBS","{mono}","{cluster}_seed-{seed}_sample-{sample}_model.pdb"), #expecting upper for cluster
    container:
        "/gpfs/cssb/group/cssb-topf/natan/singularity_containers/modelcif-converters/modelcif-converters:44ab3080.sif"
    shell:
        """
        cp {input} {output}
        """