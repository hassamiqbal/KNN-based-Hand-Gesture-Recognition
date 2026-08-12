# Changelog

All notable repository-level changes to this research-code archive are documented here.

## 1.0.0 — 2026-08-12

First formal public archival version of the MATLAB implementation associated with:

**Iqbal, H., Zheng, J., Chai, R., & Chandrasekaran, S. (2023). “K-Nearest Neighbours and Ensemble Based Real-Time Hand Gesture Recognition for Powered Wheelchair.” 2023 International Conference on Advanced Mechatronic Systems (ICAMechS), 115–120. DOI: 10.1109/ICAMechS59878.2023.10272954.**

### Repository preparation

- Added a publication-focused README with research context, gesture/control mapping, algorithm summary, requirements, safety scope, reproducibility limitations, and citation guidance.
- Added `CITATION.cff` with DOI-backed preferred citation metadata.
- Added `REPRODUCIBILITY.md` documenting archived artifacts and paper/archive configuration differences.
- Added `CONTRIBUTING.md` and MATLAB-specific `.gitignore` rules.
- Added explicit repository version metadata.
- Removed two MATLAB `.asv` editor autosave files as non-authoritative development artifacts.

### Research code

- No MATLAB `.m` research implementation was modified during the public-archive preparation.
- Existing KNN/ensemble models, confusion matrices, training vectors/labels, and image artifacts were retained unchanged for provenance.
- Participant-level raw sEMG recordings are not distributed in the repository.

### Reproducibility

- Documented that the paper reports 200 Hz acquisition and 200 ms RMS windows updated every 40 ms.
- Documented that the archived development scripts currently contain a 50 Hz initialization in `Demo_KNN.m` and a 100 ms interval default in `dataprocessing.m`.
- The peer-reviewed paper remains the authoritative source for final experimental parameters and reported performance.

### Scope

Version 1.0.0 denotes the archived public research-code state. It does not imply clinical, regulatory, medical-device, or production readiness.

### Licensing

- No open-source software license was introduced; default copyright applies unless the copyright holders explicitly select reuse terms.
