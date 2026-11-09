# Conda recipe for PyARTS

Builds the `pyarts3` conda package for the [ARTS](https://github.com/atmtools/arts)
Atmospheric Radiative Transfer Simulator.

## Requirements

- [miniforge](https://github.com/conda-forge/miniforge) installation
- `rattler-build` installed in the build environment

A ready-made build environment is provided in `etc/environment-pyarts-build.yml`.

## Building the conda package

Create and activate the build environment, then run `rattler-build`:

```
mamba env create -f etc/environment-pyarts-build.yml
mamba activate pyarts-build
rattler-build build --variant python=3.14 -r pyarts
```
