# Regular-ISD
Code accompanying publication *Not Just Regular Decoding: Asymptotics and Improvements of Regular Syndrome Decoding Attacks*

In paricular this repository contains the code for:
- Numerical optimization of the asymptotic runtime and memory exponents of regular-ISD algorithms and CCJ-style algorithms
- Estimator for concrete complexity of regular-ISD and CCJ algorithm
- Proof of concept implementations for Perm and Enum

For both, concrete estimates as well as numerical optimization of asymptotics, we provide additionally the precomputed
data so that no re-computation (which might take a while) is necessary. This data can be loaded as a dictionary. The necessary
code is contained in the respective jupyter notebooks.


## Asymptotics
This folder contains the code for the numerical optimization of
- Regular-ISD: Perm, Enum, Rep and Rep-MO (additionally RepDepth4 and Rep-MODepth4 are included to show that depth increase does not yield improvements)
- CCJ algorithm: Algorithm given in *Short Signatures from Regular Syndrome Decoding in the Head* by E. Carozza, G. Couteau and A. Joux (https://eprint.iacr.org/2023/1035.pdf)

Additionally, it includes the computation of the runtime exponent of Perm when rounding issues are resolved and a comparison
to the case without resolving rounding issues.

The code requires a standard python3 kernel in jupyter. You might have to install missing packages via pip.

## Concrete numbers
In this folder we provide the concrete estimates of regular-ISD, the CCJ algorithm and standard ISD. For the 
estimation of standard ISD we rely on the *CryptographicEstimators* library (https://github.com/Crypto-TII/CryptographicEstimators).
To install this library run 

```
git clone git@github.com:Crypto-TII/CryptographicEstimators.git
cd CryptographicEstimators
make install
```

The CryptographicEstimators has *SageMath* (https://www.sagemath.org/) as a dependency. 
To run the jupyter notebook you can either use a sage kernel (which will be slower) or a python kernel that is aware of 
your sage installation, as for example the python3 interpreter sage brings with it.

## Proof of concept

This folder contains proof of concept implementations of Perm and Enum. It allows to verify the theoretical predictitions
against the experimentally obtained values.

The corresponding notebooks `sim_EnumBased.ipynb` and `sim_PermBased.ipynb` require a SageMath kernel.

