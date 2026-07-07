# Metrics / Econometrics Notebook Examples

This repo is a work in progress containing a few exploratory notebooks I wrote to better understand statistical metrics, asymptotic behavior, and econometric identification ideas through simulation and visualization.

## `info_matrix_equiv`

This notebook illustrates the Information Matrix Equality in a simple normal likelihood model. It compares the average Hessian-based information term and the outer-product-of-scores term under correct specification and misspecification. The goal is to show visually how the equality can hold in a correctly specified model and fail under misspecification.

## `iterated_log`

This notebook simulates log-likelihood ratio behavior across increasing sample sizes. It compares different normalizations, including scaling by standard error and by sample size, to illustrate convergence in distribution versus convergence in probability. It also overlays confidence-sequence-style boundaries related to iterated logarithm behavior.

## `prohorov_ex`

This notebook gives a numerical illustration of the Prokhorov distance between probability distributions. In particular, it compares normal distributions with different variances and visualizes how “open balls” around a distribution behave under the Prokhorov metric. The purpose is to build intuition for weak convergence and how Prokhorov distance differs from more familiar distributional metrics like Kolmogorov distance.

## `shift_share_with_explanations`

This notebook explores shift-share/Bartik instruments through a simulation example. It compares standard IV/GMM approaches with a shift-share-style weighting scheme to show how weighting instruments differently can affect bias when some instruments are more endogenous than others. The notebook is mainly intended as intuition-building rather than a finalized empirical implementation.