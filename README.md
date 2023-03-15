# uchi-astro-lab-manuals

See the LICENSE.md for the license granted to you regarding this repository.

## Latex Setup

* Each lab write-up and appendix lives in its own directory, to be included in the main course lab manual's .tex file at the repository root. The lab write-up can then have the convenient file name `lab.tex` or something similar.
* Each lab write-up or appendix file should start with its title as a chapter. For example, the source file for the lab about measuring the local acceleration of gravity starts with `\chapter{Little g}`.
* The name of the course lab manual .tex file follows the convention {lowercase course prefix}{course number}-{`lab-manual.tex`}. For example, the 2018 Autumn quarter lab manual for PHSC 12700 Stars filename should be `phsc12700-lab-manual.tex`.
* Compile using pdflatex and biber. At the command line, type
```$ pdflatex lab-manual-phy252.tex
$ biber lab-manual-phy252
$ pdflatex lab-manual-phy252.tex
$ pdflatex lab-manual-phy252.tex
```
* Latex packages required for compilation:
  * latex, biblatex-biber
  * several texlive packages including texlive-fonts-extra

### Text Style Guide

* Figures should be referenced by `Fig.~\ref{foo}`. The `~` is a space that prevents line breaking on that space. Similarly, equations should be referenced as `Eq.~`, tables as `Table~`, and questions as `Question~`.
* To refer to two referants, use the plural. For example, Figs.~\ref{foo} and \ref{bar}.
* All labels should have a prefix giving the abbreviation of the lab and type of reference. For example, figures in the Rydberg Constant lab start with `ryd:fig:`. This creates a 'namespace' for each lab, so that a lab never refers to a figure in a different lab.
* If there is a sentence that defines a term, that term should be in italics. For example,
...The distance $f$ is called the \textit{focal length} of the lens.
* Symbols used in formulas should be also displayed in math mode in the inline text.
...$h$ is the height of the object
* Hyphens in words use '-', a hyphen indicating a range of values is '--', and the hyphen as a form of clause separation is '---'.
...A two-level system in the range 10--20 MeV is just that --- a two-level system.
* Avoid capitalizing an entire word for emphasis. It reads as shouting and can be confused with acronyms. Instead, use boldface and underlining.
* For acronyms, use the smallcaps fontface, e.g. \textsc{MSU}. This makes the acronym read more easily with text.
* For labels of buttons on hardware, software menu items, and spreadsheet commands, use \texttt{} to differentiate. For example,

...To average the cells \texttt{A1}--\texttt{A3} in a spreadsheet, type \texttt{=AVERAGE(A1:A3)}.
* For descending into menus, use a right-facing triangle:

```\texttt{Plot} $\blacktriangleright$ \texttt{Axis Options}```
* Images should be kept at 512 kb or less, to keep the total file size of the manual low.
* Quotes in latex are done ``like this''. Notice 2 backquotes (the key to the left of '1' on a standard US keyboard) beforehand and 2 single apostrophes after. This will make the quotes open and close correctly.

