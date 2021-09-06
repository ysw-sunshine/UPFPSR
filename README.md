# UPFPSR
A Ubiquitylation Predictor for Plant through Combining Sequence Information and Random Forest

## Overview
In this study, we propose a novel predictor, named UPFPSR, for predicting lysine ubiquitylation sites of plant. UPFPSR is developed using multiple physicochemical properties of amino acids and sequence-based statistical information. In order to find a suitable classification algorithm, four traditional algorithms and two deep learning networks are compared, and the random forest with superior performance is selected ultimately. 

## Requirements
* Python>=3.6
* numpy == 1.19.5
* pandas == 1.2.4
* Counter
* re, sys, os

* Matlab2018a


## Introduction
The code is the implementation of UPFPSR method “A Ubiquitylation Predictor for Plant 
through Combining Sequence Information and Random Forest”  

  1. Dataset       
     The dataset file contains the plant ubiquitination protein sequences, the training dataset,
     the indepedent data set and the code of data processing.
  2. Feature  
     The feature extraction file contains four sequence feature extraction methods, namely DBPB (di-amino acid bi-profile Bayes), EGAAC (enhanced grouped amino acid composition),      Pse-AAC (pseudo-amino acid composition) and PWAA (position-weight amino acid composition), which are used to transform sequence fragments of length 31 into numerical feature      vectors efficiently.
  4. Classifier  
     The classifier file contains the code of UPFPSR method used in our study.  
     Deep learning algorithms and several extensively used traditional machine learning algorithms were compared during model construction, and random forest (RF) is the                chosen classification algorithm to establish our lysine ubiquitination site prediction model UPFPSR.
  5. Predict  
     For users who want to perform prediction,run:    
     ```
     UPFPSR_pred.m
     ```         
     % This matlab code proposes a novel computational model namely UPFPSR to predict lysine ubiquitylation sites of plant effectively.
     % Users can test unknown plant ubiquitylation sites with the code to see the prediction.
  

  
