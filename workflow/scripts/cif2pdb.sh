INPUT_DIR=$1
OUTPUT_DIR=$2
J=$3

mkdir -p "$OUTPUT_DIR"

find "$INPUT_DIR" -type f -name '*_model.cif' |
    parallel -j "$J" "gemmi convert {} '$OUTPUT_DIR/{/.}.pdb'"