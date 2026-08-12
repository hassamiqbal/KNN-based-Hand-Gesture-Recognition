# Contributing

This repository is maintained primarily as an archival research-code record associated with a peer-reviewed publication.

## Scope

Contributions that improve documentation, reproducibility notes, dependency guidance, or clearly isolated compatibility fixes are appropriate. Changes that alter the historical research implementation, reported results, model artifacts, or experimental provenance require particular care and should be justified explicitly.

## Research integrity

Please do not:

- rewrite historical code solely to make it appear consistent with the final paper;
- replace archived `.mat` model/data artifacts without documenting provenance;
- change reported performance metrics without a traceable source;
- add participant-level physiological or identifiable research data;
- imply that the prototype is clinically validated or production-ready.

If a proposed change intentionally modifies the research algorithm, separate it clearly from the archival implementation and document the rationale, validation procedure, and expected effect.

## MATLAB changes

For MATLAB contributions:

1. Keep the original algorithmic intent explicit.
2. Avoid committing editor autosaves (`*.asv`) or temporary files.
3. Document required MATLAB/toolbox versions where relevant.
4. State whether a change has been tested with Myo hardware or only statically reviewed.
5. Do not silently substitute one archived model file for another.

## Safety

Powered-wheelchair control is safety-critical. Code changes must not be represented as suitable for real-world mobility-device deployment without independent verification, fail-safe engineering, human-factors testing, clinical evaluation, risk management, and applicable regulatory review.

## Citation

Academic work that builds on this repository should cite the associated ICAMechS 2023 paper. See `CITATION.cff` and the repository README.

## Licensing

No open-source software license has been selected for this historical co-authored code archive. Contributions do not change the existing copyright status unless the relevant copyright holders explicitly agree to licensing terms.
