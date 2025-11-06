# SKE Course Assignments

This repository contains assignments for the SKE (Survival and Reliability Engineering) course. The assignments involve
statistical analysis of survival data from the Veteran Clinic Trial dataset, including data preparation, elementary
statistics, and parametric/non-parametric modeling using Julia.

## Assignments

### Assignment 01

Introduction to survival analysis concepts, including reliability functions, hazard rates, and censoring.

- **Report**: [01_SKE_diagram.pdf](https://github.com/kunzaatko/SystemsReliabilityAnClinicalExperiments/releases/latest/download/01_SKE_diagram.pdf)


<p align="center">
  <img alt="Survival Analysis Diagram 0" src="assignment/01/report/figures/diagram0.svg" width="30%">
&nbsp; &nbsp; 
  <img alt="Survival Analysis Diagram 1" src="assignment/01/report/figures/diagram1.svg" width="30%">
&nbsp; &nbsp;
  <img alt="Survival Analysis Diagram 2" src="assignment/01/report/figures/diagram2.svg" width="30%">
</p>


### Assignment 02

Analysis of survival data with Kaplan-Meier estimator, exponential and Weibull distributions, including parametric fitting and goodness-of-fit tests.

- **Report**: [01_SKE_censored_data.pdf](https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/01_SKE_censored_data.pdf)

- **(1)** Kaplan-Meier Plot for Group A, **(2)** for Group B
<p align="center">
  <img alt="Kaplan-Meier Plot for Group A" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/KM_A.png" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Kaplan-Meier Plot for Group B" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/KM_B.png" width="45%">
</p>

- **(3)** Histograms
<img alt="Histograms" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/histograms.png">

- **(4)** Histogram vs Parametric Fit for Group A, **(5)** for Group B
<p align="center">
  <img alt="Histogram vs Parametric Fit for Group A" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/histogram_vs_parametric_A.png" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Histogram vs Parametric Fit for Group B" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/histogram_vs_parametric_B.png" width="45%">
</p>

- **(6)** Histogram vs Weibull Fit for Group A, **(7)** for Group B
<p align="center">
  <img alt="Histogram vs Weibull Fit for Group A" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/histogram_vs_parametric_weib_A.png" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Histogram vs Weibull Fit for Group B" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/histogram_vs_parametric_weib_B.png" width="45%">
</p>

- **(8)** Log Likelihood Surface for Group A, **(9)** for Group B
<p align="center">
  <img alt="Log Likelihood Surface for Group A" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/log_likelihood_surf_A.png" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Log Likelihood Surface for Group B" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/log_likelihood_surf_B.png" width="45%">
</p>

- **(10)** Nelson-Aalen Plot for Group A, **(11)** for Group B
<p align="center">
  <img alt="Nelson-Aalen Plot for Group A" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/NA_A.png" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Nelson-Aalen Plot for Group B" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/NA_B.png" width="45%">
</p>

- **(12)** Probability-Probability Plot for Exponential Group A, **(13)** for Group B
<p align="center">
  <img alt="PP Plot Exponential Group A" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/PP_exponential_A.png" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="PP Plot Exponential Group B" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/PP_exponential_B.png" width="45%">
</p>

- **(14)** Probability-Probability Plot for Weibull Group A, **(15)** for Group B
<p align="center">
  <img alt="PP Plot Weibull Group A" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/PP_weibull_A.png" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="PP Plot Weibull Group B" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/PP_weibull_B.png" width="45%">
</p>

- **(16)** Quantile-Quantile Plot for Exponential Group A, **(17)** for Group B
<p align="center">
  <img alt="QQ Plot Exponential Group A" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/QQ_exponential_A.png" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="QQ Plot Exponential Group B" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/QQ_exponential_B.png" width="45%">
</p>

- **(18)** Quantile-Quantile Plot for Weibull Group A, **(19)** for Group B
<p align="center">
  <img alt="QQ Plot Weibull Group A" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/QQ_weib_A.png" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="QQ Plot Weibull Group B" src="https://github.com/kunzaatko/SystemsReliabilityAndClinicalExperiments/releases/latest/download/QQ_weib_B.png" width="45%">
</p>
