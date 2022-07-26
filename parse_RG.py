import sys
import os
import gzip
from Bio import SeqIO

file = sys.argv[1]

def parseRGIDs(file):
    """Opens FASTQ file and parses read groups from first record ID and filename"""
    # Opens each FASTQ with SeqIO.parse
    with gzip.open(file, "rt") as handle:
        recordIterator = SeqIO.parse(handle, "fastq")
        # First record (read)
        firstR = next(recordIterator)
        # SeqIO description corresponds to the read ID (after @)

        # Create read groups
        flowcellid = firstR.description.split(":")[2]
        flowcelllane = firstR.description.split(":")[3]
        RGID = (flowcellid + "." + flowcelllane)
        RGLB = firstR.description.split(".")[0]
        RGPL = "ILLUMINA"
        RGPU = (RGID + "." + RGLB)

        # Split filename on underscore to extract RGSM
        list = file.split("_")[7:13]

        string = ""
        for ele in list:
            string += ele + "_"

            RGSM1 = (string.removesuffix("_"))
            RGSM = (RGSM1.removesuffix("_1.fastq.gz"))	
        
	# Add header
        RG_header = []
        RG_header.append(str("--RGID " + RGID + " "))
        RG_header.append(str("--RGLB " + RGLB + " "))
        RG_header.append(str("--RGPL " + RGPL + " "))
        RG_header.append(str("--RGPU " + RGPU + " "))
        RG_header.append(str("--RGSM " + RGSM.removesuffix("_1") + " "))
        strInfo = " "	
        
	
        for item in RG_header:
            strInfo += item
    return strInfo


print(parseRGIDs(file))
