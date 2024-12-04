#!/usr/bin/env python
import requests
from requests.adapters import HTTPAdapter
from requests.packages.urllib3.util.retry import Retry
# Read miRNAs from a text file (one miRNA per line)
with open("2_6mo_cortical_NDEV_DOWN.txt", "r") as file:
    miRNAs = [line.strip() for line in file.readlines()]
# Parameters
params = {
    "assembly": "mm10",
    "geneType": "mRNA",
    "clipExpNum": 1,  # Minimum number of clip experiments
    "degraExpNum": 0,
    "pancancerNum": 0,
    "programNum": 1,
    "target": "all",
    "cellType": "all"
}
# Output file
output_file = "ENCORI_CLIP-seq_INT.txt"
# Clear the output file if it exists
with open(output_file, "w") as file:
    pass 
# Session with retry and SSL verification
session = requests.Session()
retry = Retry(
    total=3,  # Total retries
    backoff_factor=0.3,  # Wait time between retries
    status_forcelist=[429, 500, 502, 503, 504],  # Retry on these HTTP status codes
)
adapter = HTTPAdapter(max_retries=retry)
session.mount("https://", adapter)
# Loop through each miRNA in the list
for miRNA in miRNAs:
    # Update the miRNA parameter
    params["miRNA"] = miRNA
    try:
        # Send the request with SSL verification
        response = session.get("https://rnasysu.com/encori/api/miRNATarget/", params=params, verify=Tr$
        # Check if response is complete and status code is OK
        if response.status_code == 200 and response.text.strip():
            with open(output_file, "a") as file:
                file.write(response.text)
                file.write(f"\n\n# End of interactions for {miRNA}\n\n")
            print(f"Data for {miRNA} appended to {output_file}.")
        else:
            print(f"Warning: Incomplete data or bad status code for {miRNA}")
 
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data for {miRNA}: {e}")
