# water-model

## Introduction

This water forcefield describes the potential energy surface of water with the nonbonding interaction predicted by multipolar polarizable model (implemented in DMFF.ADMP) in the long range and machine learning model (EANN) in the short range and bonding interaction calculated by MB-pol. The example is a simple MD simulation case.

## Installation

- DMFF - <https://github.com/deepmodeling/DMFF> 

- i-pi - `pip install i-pi`

## Example

EANN model parameters are stored in `params_eann_2_no_list.pickle` in folder `model2_npt`. Run MD simulations with this command line below.

```sh
cd model2_npt
sbatch sub.sh
```

