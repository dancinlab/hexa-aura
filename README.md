# ✨ hexa-aura — n=6 post-aural BCI chip substrate (측두골 클립)

> **귀뒤 측두골 클립이 스마트폰을 대체한다.** 양쪽 φ=2개, 각 3.6g.
> RT-SC 나노코일이 σ²=144채널/타일로 청각·운동·체성감각피질을 직접 읽고 쓴다.
> AirPods · Vision Pro · Apple Watch · 외골격 · 의수 — **18개 웨어러블이 0개로**.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-0.1.0-informational.svg)](hexa.toml)
[![Bundle: 5 docs](https://img.shields.io/badge/bundle-5_docs-blue.svg)](#docs)
[![Scope](https://img.shields.io/badge/scope-chip--substrate-orange.svg)](#scope-discipline)

---

## Why

**hexa-aura** is the post-aural BCI **CHIP SUBSTRATE** member of the
HEXA family. The core concept is a **측두골(temporal bone) 유양돌기
(mastoid) 클립** — a behind-the-ear chip pair that interfaces the
auditory / motor / somatosensory cortices via RT-SC nano-coils,
replacing the smartphone and 18+ wearables (AR glasses, earbuds,
smartwatch, exoskeleton, prosthetics, e-skin, digital olfactory /
gustatory, sleep tracker, emotion-sharer, ...).

It bundles 5 chip-substrate spec docs out of the upstream
[`canon`](https://github.com/dancinlab/canon) tree. **2 of 5 are
extracted from older canon SHAs** to recover richer Korean content
that existed before a canonical-format migration trimmed the bodies
(see [`TODO.md`](TODO.md) §1).

---

## Scope discipline

`hexa-aura` is the **CHIP + FORM-FACTOR** substrate only. Cognitive
and sensory verbs are explicitly out of scope and belong in sibling
standalones (per
[`canon/domains/cognitive/_standalone_repos.md`](https://github.com/dancinlab/canon/blob/main/domains/cognitive/_standalone_repos.md)):

| concern                                              | repo                              |
| ---------------------------------------------------- | --------------------------------- |
| BCI ML stack (`hexa-neuro`)                          | **`hexa-mind`** (pending)         |
| cognitive verbs (mind / oracle / telepathy / dream)  | **`hexa-mind`** (pending)         |
| 5-senses (ear / speak / empath / olfact)             | **`hexa-senses`** (pending)       |
| working EEG / BMI pipeline                           | `hexa-brain` (sister repo)        |
| decoder model serving                                | `hexa-codex` CLI                  |
| chip-grade neuromorphic silicon                      | `hexa-chip` CLI                   |
| 5G / 6G uplink for cloud sync                        | `hexa-grid` CLI                   |

---

## Docs (5)

| group                       | doc                                                              | source                  |
| --------------------------- | ---------------------------------------------------------------- | ----------------------- |
| **n=6 BCI substrate**       | [`neuro`](docs/neuro.md)                                         | **canon@579ab196** ✦ KR |
| BCI standard                | [`brain-computer-interface`](docs/brain-computer-interface.md)   | **canon@ab155706** ✦ KR |
| neuromorphic chip           | [`hexa-neuromorphic`](docs/hexa-neuromorphic.md)                 | canon@5458b7d1          |
| neuro chip arch             | [`l9-field-photon-neuro`](docs/l9-field-photon-neuro.md)         | canon@5458b7d1          |
| background                  | [`neuroscience`](docs/neuroscience.md)                           | canon@5458b7d1          |

✦ KR = intentionally extracted from a richer pre-migration historical SHA.

---

## Status

`v0.1.0` — **BUNDLE_FIRST**. Drift between bundled docs and current
canon paths is expected for the 2 ✦ KR docs (intentional historical
restoration). See [`TODO.md`](TODO.md) for the canon-restoration plan
and the chip-side full-template author plan for `v1.0.0`.

---

## Quick start

```bash
hexa run cli/hexa-aura.hexa status        # 5-doc table
hexa run cli/hexa-aura.hexa selftest      # 5-doc presence check
hexa run cli/hexa-aura.hexa <verb>        # spec doc headline (head -30)

# Sibling CLIs (cross-link policy — DO NOT proxy through hexa-aura):
hexa-codex serve            # decoder model serving
hexa-chip  neuromorphic     # neuromorphic silicon
hexa-grid  v2x              # 5G/6G uplink
```

---

## License

MIT — see [`LICENSE`](LICENSE).

## Provenance

Bundled from `canon/domains/{life,cognitive,compute}/` at canon SHA
`5458b7d1` (2026-05-10), with 2 docs intentionally extracted from
historical SHAs `579ab196` and `ab155706` to recover richer Korean
content. Drift checked by upstream `canon/tools/check_drift.hexa`
(intentional drift on the 2 historical docs is expected).
