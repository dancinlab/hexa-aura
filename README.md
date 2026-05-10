# ✨ hexa-aura — n=6 post-aural BCI substrate (측두골 클립)

> **귀뒤 측두골 클립이 스마트폰을 대체한다.** 양쪽 φ=2개, 각 3.6g.
> RT-SC 나노코일이 σ²=144채널/타일로 청각·운동·체성감각피질을 직접 읽고 쓴다.
> AirPods · Vision Pro · Apple Watch · 외골격 · 의수 — **18개 웨어러블이 0개로**.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-0.1.0-informational.svg)](hexa.toml)
[![Bundle: 11 docs](https://img.shields.io/badge/bundle-11_docs-blue.svg)](#docs)
[![Korean](https://img.shields.io/badge/lang-한국어%20+%20english-orange.svg)](#status)

---

## Why

**hexa-aura** is the post-aural BCI member of the HEXA family. The core
concept is a **측두골(temporal bone) 유양돌기(mastoid) 클립** — a
behind-the-ear chip pair that interfaces the auditory / motor /
somatosensory cortices via RT-SC nano-coils, replacing the smartphone
and 18+ wearables (AR glasses, earbuds, smartwatch, exoskeleton,
prosthetics, e-skin, digital olfactory/gustatory, sleep tracker,
emotion-sharer, ...).

It bundles 11 mobility-relevant spec docs out of the upstream
[`canon`](https://github.com/dancinlab/canon) tree. **5 of 11 are
extracted from older canon SHAs** to recover the richer Korean content
that existed before a canonical-format migration trimmed the bodies
(see [`TODO.md`](TODO.md) §1).

**Out of scope** — call sibling CLI directly:

| concern                                | call                          |
| -------------------------------------- | ----------------------------- |
| decoder model serving                  | `hexa-codex serve`            |
| neuromorphic silicon (chip-grade)      | `hexa-chip neuromorphic`      |
| 5G/6G uplink for cloud sync            | `hexa-grid v2x`               |

---

## Docs (11)

| group                       | doc                                                              | source                  |
| --------------------------- | ---------------------------------------------------------------- | ----------------------- |
| **Tier 1 — 귀뒤 BCI 스택** |                                                                  |                         |
| neuro substrate             | [`neuro`](docs/neuro.md)                                         | **canon@579ab196** ✦ KR |
| n=6 BCI ML                  | [`hexa-neuro`](docs/hexa-neuro.md)                               | canon@aadcb101          |
| BCI standard                | [`brain-computer-interface`](docs/brain-computer-interface.md)   | **canon@ab155706** ✦ KR |
| ear-anchor sensor           | [`hexa-ear`](docs/hexa-ear.md)                                   | **canon@579ab196** ✦ KR |
| **Tier 2 — 칩 하드웨어**    |                                                                  |                         |
| neuromorphic chip           | [`hexa-neuromorphic`](docs/hexa-neuromorphic.md)                 | canon@aadcb101          |
| neuro chip arch             | [`l9-field-photon-neuro`](docs/l9-field-photon-neuro.md)         | canon@aadcb101          |
| **Tier 3 — 모바일 대체**   |                                                                  |                         |
| 인지 통합                   | [`hexa-mind`](docs/hexa-mind.md)                                 | canon@aadcb101          |
| silent speech / subvocal    | [`hexa-speak`](docs/hexa-speak.md)                               | **canon@ab155706** ✦ KR |
| dream interface             | [`hexa-dream`](docs/hexa-dream.md)                               | **canon@579ab196** ✦ KR |
| brain-brain link            | [`hexa-telepathy`](docs/hexa-telepathy.md)                       | canon@aadcb101          |
| **Tier 4 — 배경**           |                                                                  |                         |
| neuroscience base           | [`neuroscience`](docs/neuroscience.md)                           | canon@aadcb101          |

✦ KR = intentionally extracted from a richer pre-migration historical SHA.

---

## Status

`v0.1.0` — **BUNDLE_FIRST**. Drift between bundled docs and current
canon paths is expected for the 5 ✦ KR docs (intentional historical
restoration). See [`TODO.md`](TODO.md) for the canon-restoration plan
and the 13-verb full-template author plan for `v1.0.0`.

---

## Quick start

```bash
hexa run cli/hexa-aura.hexa status        # 11-doc table
hexa run cli/hexa-aura.hexa selftest      # 11-doc presence check
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
`aadcb101` (2026-05-10), with 5 docs intentionally extracted from
historical SHAs `579ab196` and `ab155706` to recover richer Korean
content. Drift checked by upstream `canon/tools/check_drift.hexa`
(intentional drift on the 5 historical docs is expected).
