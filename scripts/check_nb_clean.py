import os

import nb_clean
import nbformat

all_files = []


## Recursively find all .ipynb files
for root, dirs, files in os.walk("."):
    for file in files:
        if file.endswith(".ipynb"):
            all_files.append(os.path.join(root, file))


## Check all .ipynb files
for file in all_files:
    print("Checking {}".format(file))
    nb_read_in = nbformat.read(file, as_version=nbformat.NO_CONVERT)
    cleaned = nb_clean.clean_notebook(nb_read_in)
    nbformat.write(cleaned, file)
