# Arcpy.jl

[![Build Status](https://travis-ci.org/ranjanan/Arcpy.jl.svg?branch=master)](https://travis-ci.org/ranjanan/Arcpy.jl) [![Coverage Status](https://coveralls.io/repos/ranjanan/Arcpy.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/ranjanan/Arcpy.jl?branch=master) [![codecov.io](http://codecov.io/github/ranjanan/Arcpy.jl/coverage.svg?branch=master)](http://codecov.io/github/ranjanan/Arcpy.jl?branch=master)

`Arcpy.jl` is a Julia wrapper around ESRI's [`arcpy` python package](http://pro.arcgis.com/en/pro-app/arcpy/get-started/what-is-arcpy-.htm). 

**Please note that you need an ArcGIS license for this package to work.**

## Why use this wrapper?

This wrapper allows users of [`Circuitscape.jl`](https://github.com/Circuitscape/Circuitscape.jl) to interface
with `arcpy` while staying within the Julia environment and taking advantage of its parallel computing abilities. 

## Setup and Installation
1. Make sure you have [ArcGIS](http://arcgis.com) installed on your system. Note that it works only on Windows. 
2. Open Julia. Run: 
```julia
Pkg.clone("https://github.com/ranjanan/Arcpy.jl")
```
3. Now we need Julia to point to the python executable shipped with your copy of ArcGIS. To do that, do: 
```julia
ENV["PYTHON"] = "/path/to/arcgis/python"
Pkg.build("Arcpy")
```
If all goes well, you should see a message from Julia that `PyCall` is now linked to your ArcGIS's python, and 
```julia
using Arcpy
``` 
should just work. 

## Usage 

If you have `arcpy` python code that looks like: 
```python
import arcpy # loads python package
arcpy.some_arcpy_function(args...) 
```
the corresponding Julia code should look like: 
```julia
using Arcpy
Arcpy.some_arcpy_function(args...)
```
with a small number of excpetions, such as 
```python
arcpy.env.workspace = "some/workspace"
```
should be written as 
```julia
Arcpy.setenv(:workspace, "some/workspace")
```

Since `arcpy` has hundreds of functions, it is possible that not everything is wrapped. If you would like a particular wrapped, please [open an issue](https://github.com/ranjanan/Arcpy.jl/issues). 
