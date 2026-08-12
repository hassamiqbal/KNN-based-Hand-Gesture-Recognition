# Reproducibility Notes

This repository is a historical research-code archive associated with the 2023 ICAMechS paper **“K-Nearest Neighbours and Ensemble Based Real-Time Hand Gesture Recognition for Powered Wheelchair.”**

The goal of this file is to distinguish the peer-reviewed experimental description from the development snapshot preserved in GitHub.

## Published experiment

The paper reports:

- Myo armband acquisition of surface electromyography (sEMG);
- five hand gestures used for right, stop, left, forward, and reverse commands;
- sEMG acquisition at **200 Hz**;
- RMS time-domain feature extraction;
- overlapping **200 ms** windows updated every **40 ms**;
- K-nearest neighbours (KNN) and MATLAB `fitcensemble` classifiers;
- offline recognition accuracy of **99.74% for KNN** and **97.68% for the ensemble method**.

The paper should be treated as the authoritative source for the final experimental protocol and reported results.

## Archived implementation

The `DEMO-KNN/` directory preserves the uploaded development snapshot. Key files include:

- `Demo_KNN.m` — real-time Myo acquisition and KNN prediction demo;
- `TrainingMODELSVMDTLRRLR.m` — historical model-training script;
- `dataprocessing.m` — z-score normalization and RMS extraction;
- `accuracy_precisionetc.m` — confusion-matrix-derived performance metrics;
- `interface_new1.m` — gesture-control visualization;
- saved KNN, ensemble, training, and confusion-matrix `.mat` files.

## Configuration differences

Several differences exist between the final paper and the archived scripts:

1. **Sampling rate.** The paper reports 200 Hz sEMG acquisition. `Demo_KNN.m` initializes `sampleRate = 50`, while subsequent interval/window sample calculations use values from the live Myo object.
2. **Window update.** The paper reports 200 ms windows updated every 40 ms. `dataprocessing.m` currently defines `windowsize = 200` ms and `interval = 100` ms.
3. **Historical comments.** Some MATLAB comments contain earlier accuracy values or labels inherited from development experiments. The peer-reviewed paper is the authoritative source for final performance values.
4. **Model variants.** The archive contains multiple KNN model files (`knnmodel.mat`, `modelKNN.mat`, `modelKNN1248.mat`) and an ensemble model (`modelensemble.mat`). `Demo_KNN.m` actively loads `modelKNN1248.mat`; alternate models remain commented in the script.
5. **Training script scope.** `TrainingMODELSVMDTLRRLR.m` includes active KNN training with hyperparameter optimization and commented alternatives for ECOC/SVM, ensemble learning, and decision trees, reflecting iterative development.

No attempt was made during repository preparation to rewrite these scripts to match the paper retroactively. Doing so would obscure provenance.

## Autosave cleanup

Two MATLAB editor autosave files (`Demo_KNN.asv` and `accuracy_precisionetc.asv`) were removed during the 1.0.0 archival cleanup. They were non-authoritative editor artifacts. In particular, `Demo_KNN.asv` contained an incomplete `load modelk` statement not present in the tracked `Demo_KNN.m` source. No `.m` research source file was modified.

## Data and model artifacts

The repository includes saved model, training-vector, label, confusion-matrix, and figure artifacts but does **not** distribute participant-level raw physiological recordings. The provided files should therefore be viewed as a partial research archive, not a complete raw-data reproduction package.

## Hardware/software dependency

The real-time demo depends on legacy Myo armband hardware and a MATLAB Myo SDK/MEX wrapper (`MyoMex`). Reproducing the original hardware pipeline on a current machine may require environment-specific adaptation because the Myo platform is discontinued/legacy.

## Research integrity

For exact reported methods and results, cite and consult the peer-reviewed paper:

H. Iqbal, J. Zheng, R. Chai, and S. Chandrasekaran, “K-Nearest Neighbours and Ensemble Based Real-Time Hand Gesture Recognition for Powered Wheelchair,” 2023 International Conference on Advanced Mechatronic Systems (ICAMechS), pp. 115–120, 2023. DOI: 10.1109/ICAMechS59878.2023.10272954.
