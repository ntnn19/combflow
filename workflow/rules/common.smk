# import basic packages
import pandas as pd
from snakemake.utils import validate


# read sample sheet
#samples = (
    #pd.read_csv(config["sample_sheet"], sep="\t", dtype={"sample": str})
    #.set_index("sample", drop=False)
    #.sort_index()
    #)
COMBFOLD_CONTAINER = config["combfold_container"]
OUTDIR = config["output_dir"]
FASTA = config["fasta"]
PDB_DIR = config["pdb_dir"]
STOICHIOMETRY = config["stoichiometry"]

def get_subunits_json(wildcards):
    PREPARE_SUBUNITS_JSON_DIR = checkpoints.PREPARE_SUBUNITS_JSON.get(**wildcards).output[0]
    COMBS, = glob_wildcards(os.path.join(PREPARE_SUBUNITS_JSON_DIR,"{comb}.json"))
    return expand(os.path.join(OUTDIR,"rule_RUN_COMBFOLD_ASSEMBLY","{comb}","assembled_results","confidence.txt"), comb=COMBS)

# validate sample sheet and config file
#validate(samples, schema="../schemas/samples.schema.yaml")
#validate(config, schema="../schemas/config.schema.yaml")
