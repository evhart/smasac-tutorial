#!/bin/bash
# Convert the bib files to MD and create a README index:

cat >bib/README.md <<EOL
# Slides References
The markdown version of the references can be accessed in the [references/md](../md/) directory:
EOL

cat >md/README.md <<EOL
# Slides References
The markdown version of the references can be found in this directory:
EOL

for bibfile in bib/*.bib; do

    basefile="$(basename $bibfile .bib)"
    echo "Converting: bib/${basefile}.bib to md/${basefile}.md"
    echo "\\documentclass[a4paper,10pt]{article} \\begin{document} \\nocite{*} \\bibliographystyle{unsrt} \\bibliography{bib/${basefile}.bib} \\end{document}" | cat | pandoc --from latex --to markdown_strict --bibliography bib/${basefile}.bib -o md/${basefile}.md

    echo "* References for ${basefile}: [md](../md/${basefile}.md)" >> bib/README.md
    echo "* References for ${basefile}: [md](${basefile}.md)" >> md/README.md

done
