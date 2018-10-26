# Flix Feature Interaction examples

This repository currently contains a data file `SandwichBarRels.flix`, and two Flix queries
that operate on the file:
- `FunctionDepend.flix`
- `GlovalVar.flix`

These scripts are translated from Grok scripts available
[here](https://github.com/bmuscede/Grok-Scripts).

There is also a small script called `format_pl.py` that will extract all the information in a TA
file in the form of Prolog facts. This requires a working copy of JGrok to run (it was written
inside an extract JGrok tarball, so running it from there should be a good start).

Given a copy of Flix, you can run `flix -print GlobalVarName SandwichBarRels.flix GlobalVar.flix`
to get a tabulated set of results equivalent to the Grok version.

This is a very bare proof of concept, so expect issues.

