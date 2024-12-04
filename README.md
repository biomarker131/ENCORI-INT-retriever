# ENCORI-INT-retriever
Tries to ease the recovery of interactions input: list of miRNAs, output: list of interactions for the miR provided in a txt file called response.

The previous code has the following default parameters, but they can be edited in the script:

    "assembly": "mm10" – This is the version of the genome used for everything, from creating the indices for both long and short sequences to obtaining the sequences of the mature miRNAs.
    "geneType": "lncRNA" – Specifies the gene type as long non-coding RNA (lncRNA).
    "clipExpNum": 1 – The minimum number of CLIP-seq experiments. CLIP-seq is considered a powerful enough technique that only 1 experiment is required.
    "degraExpNum": 0 – The minimum number of degradome experiments supporting the interaction. It is set to 0 for the same reason as point 3.
    "pancancerNum": 0 – No cancer-related data is needed.
    "programNum": 1 – Only one program is needed for the interactions found through computational programs.
    "program": "PITA" – No specific interaction prediction program is selected; "PITA" is the default.
    "target": "all" – Captures all interactions.
    "cellType": "all" – Includes all cell types.
