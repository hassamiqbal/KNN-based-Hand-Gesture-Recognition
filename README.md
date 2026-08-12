# KNN and Ensemble-Based Real-Time Hand Gesture Recognition for Powered Wheelchair

Research-code archive associated with the peer-reviewed conference paper:

> H. Iqbal, J. Zheng, R. Chai, and S. Chandrasekaran, **“K-Nearest Neighbours and Ensemble Based Real-Time Hand Gesture Recognition for Powered Wheelchair,”** 2023 International Conference on Advanced Mechatronic Systems (ICAMechS), Melbourne, Australia, 2023, pp. 115–120. DOI: **10.1109/ICAMechS59878.2023.10272954**.

**Repository version:** `1.0.0`  
**Archival release date:** 12 August 2026

## Overview

This repository preserves MATLAB code and trained-model artifacts used to investigate surface electromyography (sEMG)-based real-time hand-gesture recognition for powered-wheelchair control. The associated study compared two supervised machine-learning approaches:

- **K-nearest neighbours (KNN)**
- **Ensemble learning using MATLAB `fitcensemble`**

The published study reports offline recognition accuracies of **99.74% for KNN** and **97.68% for the ensemble method** across a five-gesture library. The system was designed as a human–machine interface in which recognized hand gestures map to powered-wheelchair manoeuvres.

## Gesture library and control mapping

The paper uses five Myo-armband hand gestures:

| Gesture | Wheelchair command |
|---|---|
| Wave out | Right |
| Rest | Stop |
| Wave in | Left |
| Fist | Forward |
| Fingers spread | Reverse |

The archived real-time demo reads Myo sEMG/pose streams, loads saved training labels and features, loads a pretrained KNN model, predicts the current class, and sends the estimated command to a MATLAB visualization/interface.

## Repository structure

All original research implementation and model files are retained under `DEMO-KNN/`.

| File | Purpose |
|---|---|
| `Demo_KNN.m` | Main real-time Myo/KNN demonstration entry point. |
| `TrainingMODELSVMDTLRRLR.m` | Historical model-training/evaluation script; active code trains an optimized KNN classifier, with alternative classifier experiments preserved as comments. |
| `dataprocessing.m` | Signal preprocessing and RMS feature extraction utility. |
| `accuracy_precisionetc.m` | Computes accuracy, precision, recall, and F1 score from a confusion matrix. |
| `interface_new1.m` | Directional/stop visualization used by the real-time demo. |
| `interface.m` | Earlier interface implementation retained for provenance. |
| `hassammmm.m` | Historical analysis/training-protocol plotting script. |
| `modelKNN1248.mat` | Saved KNN model used by the archived demo. |
| `modelKNN.mat`, `knnmodel.mat` | Additional saved KNN model artifacts. |
| `modelensemble.mat` | Saved ensemble-classifier artifact. |
| `cmat_KNN.mat`, `cmatKNN1248.mat` | Saved KNN confusion-matrix artifacts. |
| `cmat_Ensemble.mat` | Saved ensemble confusion-matrix artifact. |
| `trainlabels1248.mat`, `trainvec1248.mat`, `TB.mat`, `TV1abcd.mat` | Archived labels/features used by training or demonstration scripts. |
| `objectivefunctionmodel.png` | Historical hyperparameter/objective-function figure. |

## Published signal-processing pipeline

The associated paper describes the following pipeline:

1. Acquire sEMG using the **Myo armband** with eight dry electrodes.
2. Record sEMG at **200 Hz**.
3. Preprocess the raw signal.
4. Segment the signal using overlapping **200 ms windows**, updated every **40 ms**.
5. Extract **root mean square (RMS)** time-domain features.
6. Train and evaluate KNN and ensemble classifiers.
7. Use the recognized gesture as a command in the wheelchair-control interface.

The archived `dataprocessing.m` also implements z-score normalization and RMS extraction.

## Archival configuration note

This repository is a preserved research-development snapshot rather than a fully containerized reproduction package. There are configuration differences between the final paper and the archived MATLAB scripts:

- the paper reports **200 Hz** sEMG acquisition;
- `Demo_KNN.m` initializes `sampleRate = 50`, while later sample-count calculations reference the live Myo object;
- the paper reports a **40 ms** sliding-window update;
- the archived `dataprocessing.m` currently defaults to a **100 ms** interval, with a 200 ms window.

These differences are documented rather than silently changed so that the original archive remains auditable. See [`REPRODUCIBILITY.md`](REPRODUCIBILITY.md).

## Requirements

The historical implementation requires, at minimum:

- MATLAB
- Statistics and Machine Learning Toolbox (`fitcknn`, `fitcensemble`, cross-validation/prediction functions)
- Myo armband hardware
- a MATLAB-compatible Myo SDK/MEX wrapper such as **MyoMex**
- the saved `.mat` artifacts included in `DEMO-KNN/`

The paper reports MATLAB R2022b for the data-acquisition interface. Hardware/SDK compatibility may differ on current systems because the Myo platform is legacy hardware.

## Getting started

1. Clone or download this repository.
2. Add `DEMO-KNN/` to the MATLAB path or make it the current working directory.
3. Install/configure the Myo SDK MATLAB MEX wrapper required by `MyoMex`.
4. Connect and verify the Myo armband.
5. Inspect the archived model/data files before execution.
6. Run `Demo_KNN.m` for the historical real-time demonstration workflow.

Do not connect the research prototype directly to safety-critical mobility hardware without a separate engineering validation process.

## Reproducibility and provenance

Version `1.0.0` formalizes the public archival state of the repository. The publication-preparation pass adds documentation and repository metadata while preserving the MATLAB research implementation and binary model/data artifacts. Two MATLAB editor autosave (`.asv`) files were removed because they are non-authoritative development artifacts; the tracked `.m` sources remain unchanged.

Participant-level raw physiological recordings are **not** distributed here. The included `.mat` files are retained as historical model/training/evaluation artifacts.

## Safety and intended use

This code is an **academic research prototype**. It is not a certified medical device, clinical decision-support system, or production wheelchair controller. Real deployment would require independent software/hardware verification, fail-safe design, emergency-stop functionality, cybersecurity assessment, human-factors testing, clinical evaluation, risk management, and applicable regulatory approval.

## Citation

If this repository contributes to academic work, cite the associated paper:

```bibtex
@inproceedings{iqbal2023knnensemble,
  author    = {Iqbal, Hassam and Zheng, Jinchuan and Chai, Rifai and Chandrasekaran, Sivachandran},
  title     = {K-Nearest Neighbours and Ensemble Based Real-Time Hand Gesture Recognition for Powered Wheelchair},
  booktitle = {2023 International Conference on Advanced Mechatronic Systems (ICAMechS)},
  year      = {2023},
  pages     = {115--120},
  publisher = {IEEE},
  doi       = {10.1109/ICAMechS59878.2023.10272954}
}
```

A machine-readable citation is also provided in [`CITATION.cff`](CITATION.cff).

## Publication record

- **Conference:** 2023 International Conference on Advanced Mechatronic Systems (ICAMechS)
- **Publisher:** IEEE
- **Pages:** 115–120
- **DOI:** `10.1109/ICAMechS59878.2023.10272954`
- **Institutional record:** UTS Open Publications of UTS Scholars, handle `10453/178093`
- **ISBN:** 979-8-3503-0747-4
- **ISSN:** 2325-0682 / 2325-0690

## License

No open-source software license has been selected for this historical co-authored research code. Unless the copyright holders state otherwise, default copyright applies. The absence of a software license should not be interpreted as permission to redistribute or reuse the source code beyond rights provided by law.

## Authors

- Hassam Iqbal
- Jinchuan Zheng
- Rifai Chai
- Sivachandran Chandrasekaran
