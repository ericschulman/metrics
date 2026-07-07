# Econometrics Notes, Code, and Selected Topics

This repository collects econometrics notes, simulation notebooks, and teaching materials that I have written over the past few years. It started as a place to organize TA materials and solutions for first-year Ph.D. econometrics at UT Austin, and has since expanded to include exploratory notebooks on probability metrics, asymptotics, likelihood theory, and IV/shift-share designs.

## Repository Structure

```text
.
├── selected_topics/
└── ut_austin_metrics/
```

## `selected_topics/`

This folder contains shorter exploratory notebooks written to build intuition for specific econometric or probability concepts. Most are simulation- and visualization-based and are still a work in progress.

- `info_matrix_equiv`  
  Illustrates the Information Matrix Equality in a simple normal likelihood model. It compares the Hessian-based information term and the outer product of scores under correct specification and misspecification.

- `iterated_log`  
  Simulates log-likelihood ratio behavior across increasing sample sizes. It compares different normalizations and overlays confidence-sequence-style boundaries related to iterated logarithm behavior.

- `prohorov_ex`  
  Gives a numerical illustration of the Prokhorov distance between probability distributions. The goal is to build intuition for weak convergence and how Prokhorov distance differs from more familiar metrics like the Kolmogorov distance.

- `shift_share_with_explanations`  
  Explores shift-share/Bartik instruments through simulation. It compares standard IV/GMM approaches with shift-share-style weighting to show how different instrument weights can affect bias when some instruments are more endogenous than others.

## `ut_austin_metrics/`

This folder contains the original teaching-oriented materials from my time as a TA for first-year Ph.D. econometrics at the University of Texas at Austin. It includes solved textbook exercises, weekly section notes, datasets, and applied econometrics notebooks.

The folder is organized as:

```text
ut_austin_metrics/
├── data/
├── homeworks/
├── ta_sections/
└── notebooks/
```

- `data/`  
  Miscellaneous datasets from econometrics textbooks and applied papers, including examples used for IV, panel data, labor economics, and difference-in-differences exercises.

- `homeworks/`  
  Homework-related materials and solutions for econometrics exercises.

- `ta_sections/`  
  Weekly TA section notes and solved exercises for first-year Ph.D. econometrics. These cover probability theory, estimation, inference, regression, GMM/IV, and related topics.

- `notebooks/`  
  Python notebooks for applied and computational econometrics examples, such as fixed effects estimation and pre-trend plots.

For more detail, see the README inside `ut_austin_metrics/`, which lists datasets, textbook references, weekly exercises, and links to section notes.

## Status

This repository is mainly for organizing personal notes, teaching materials, and exploratory code. Some notebooks are polished, while others are rougher and intended primarily for intuition-building.