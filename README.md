# Regular-ISD
Code accompanying publication *Not Just Regular Decoding: Asymptotics and Improvements of Regular Syndrome Decoding Attacks*

In particular this repository contains the code for:
- Numerical optimization of the asymptotic runtime and memory exponents of regular-ISD algorithms and CCJ algorithms
- Estimator for concrete complexity of regular-ISD and CCJ algorithms
- Proof of concept implementations for Perm and Enum

For both, concrete estimates as well as numerical optimization of asymptotics, we provide additionally the precomputed
data so that no re-computation (which might take a while) is necessary. This data can be loaded as a dictionary. The necessary
code is contained in the respective jupyter notebooks. Additionally, we provide the parameters that lead to the claimed complexities
in CSV format.


## Dependencies
The different parts of the code might contain individual dependencies, which are listed in the corresponding sections. Here we detail the generic dependencies.
### Python
You will require a python3 installation with some specific packages. To install the necessary packages you can run

<pre translate="no" dir="ltr" is-upgraded="">
pip3 install -r requirements.txt
</pre>

### Jupyter notebook 
All code is provided via jupyter notebooks via jupyter notebooks. 
To open these files you require the web application *jupyter*, which you can install via 

<pre translate="no" dir="ltr" is-upgraded="">
pip3 install jupyterlab
</pre>

To then start jupyter just execute

<pre translate="no" dir="ltr" is-upgraded="">
jupyter lab
</pre>

This opens the jupyter web application in your standard browser. Now you can navigate to the corresponding directory and open the respective file.

By default jupyter uses you standard python interpreter to execute code. However, certain notebooks might require different kernels (as we will list below). In such cases you need to first install those kernels into jupyter and then select the kernel in the upper right corner, before you execute the code.

## Asymptotics
This folder contains the code for the numerical optimization of
- Regular-ISD: Perm, Enum, Rep and Rep-MO (additionally RepDepth4 and Rep-MODepth4 are included to show that depth increase does not yield improvements)
- CCJ algorithms: Algorithms given in *Short Signatures from Regular Syndrome Decoding in the Head* by E. Carozza, G. Couteau and A. Joux (https://eprint.iacr.org/2023/1035.pdf)

Additionally, it includes the computation of the runtime exponents of all Regular-ISD algorithms when rounding issues 
are resolved and a comparison to the case without resolving rounding issues.

The folder also contains CSV files for all regular-ISD algorithms (before and after resolving rounding issues) stating the optimal 
parameters for all combinations of the rate and weight.

The code requires a standard python3 kernel in jupyter. 

## Concrete numbers
In this folder we provide the concrete estimates of regular-ISD, the CCJ algorithms and standard ISD. Additionally the folder contains the estimates after resolving rounding issues in the concrete case for Perm and Enum. For the estimation of standard ISD we rely on the *CryptographicEstimators* library (https://github.com/Crypto-TII/CryptographicEstimators).
To install this library you can run 

```
git clone git@github.com:Crypto-TII/CryptographicEstimators.git
cd CryptographicEstimators
make install
```

There is also a possiblity to install it via docker, we refer to the CryptographicEstimators GitHub for more information.
The CryptographicEstimators has *SageMath* (https://www.sagemath.org/) as a dependency.

To run the jupyter notebook you can either use a sage kernel (which will be slower) or a python kernel that is aware of 
your sage installation, as for example the python3 interpreter sage brings with it.


## Proof of concept
This folder contains proof of concept implementations of Perm and Enum. It allows to verify the theoretical predictitions
against the experimentally obtained values.

We provide three notebooks:
- `sim_PermBased.ipynb`: simulates Perm-Based Regular ISD, measuring a) the probability that H' as full rank, b) the probability that a random regular permutation places an information set in the leftmost k positions, c) the success probability. The latter value is compared with the theoretical estimates provided in the paper (both neglecting and taking into account rounding issues).
- `sim_EnumBased.ipynb`: simulates Enum-Based Regular ISD, measuring a) the success probability, b) the average number of collisions. Both values are compared with the theoretical estimates provided in the paper (taking into account rounding issues)
- `sim_EnumBased_NumColissions.ipynb`: simulates Enum-Based Regular ISD, measuring the minimum, average and maximum number of collisions. The code considers two different regimes: I) several code rates, all greater than 1 - 1 / ( e ln(2) ), and weight set according to the uniqueness bound, II) code rate less than 1 - 1 / ( e ln(2) ), different values of w. The measured values are compared with the value theoretical estimates provided in the paper 

The notebooks require a SageMath kernel.

