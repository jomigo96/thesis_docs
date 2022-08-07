# Thesis Document


## Compiling

You will need
+ A latex distribution, which should come with
   * biber
   * lualatex
   * bib2gls

Optionally,
+ Arara


```bash
# With arara
$ arara -v main.tex

# By hand
$ lualatex --shell-escape --output-directory=build
$ biber --input-directory=build --output-directory=build
$ bib2gls --group --dir=build --tex-encoding=utf-8
$ lualatex --shell-escape --output-directory=build
$ lualatex --shell-escape --output-directory=build
$ bib2gls --group --dir=build --tex-encoding=utf-8
$ lualatex --shell-escape --output-directory=build
```

```bash
├── main.tex                # main tex file
├── .tex                    # source files
├── .bib                    # bibliography and nomenclature
├── build                   # imtermediate files directory
│   ├── clean.sh            # clear build files
├── data                    # algorithms and csv data
├── graphics                # figures in tikz source
├── ist-thesis.cls          # document class
├── main.pdf                # thesis final document
└── scripts                 # auxiliary scripts
```
