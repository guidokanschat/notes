# Notes on Applied Mathematics #

Lecture notes for several classes in numerical analysis.
Short notes on issues like Hilbert spaces, iterative methods, differential equations and their discretization.

## Download and setup ##

Clone this repository in the usual way.
```
cd $NOTESPATH
git clone git@github.com:guidokanschat/notes.git
```
The notes use the slidetheorem style which I developed to put theorems on slides in a semiautomatical way. It is included as a submodule here. After cloning

```
cd notes
git submodule init
git submodule update
```

Finally, make sure that `$NOTESPATH` is in your `TEXINPUTS`variable, for instance by (bash)
```
export TEXINPUTS=.:$NOTESPATH/notes/:$TEXINPUTS
```

### Compiling ###

In each subdirectory, compile `main.tex` for editing (the ouptut contains labels printed by the `showkeys` package), compile `print.tex` for a publishable version without debugging information.

Compile `slides.tex` for beamer output. Always make sure to compile one of the previous files first, since they set up the data for the slides. This will keep numbering of printable notes and slides in sync.

Or simply type `make` to produce printable version and slides, including index, bibliography, etc.

## License ##

This work is licensed under the Creative Commons Attribution 4.0 International License. To view a copy of this license, visit [http://creativecommons.org/licenses/by/4.0/](http://creativecommons.org/licenses/by/4.0/).
