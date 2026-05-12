# ✨ hexa-aura — n=6 post-aural BCI chip substrate (측두골 클립)

> **귀뒤 측두골(temporal bone) 유양돌기(mastoid) 클립 한 쌍이 스마트폰 + 18개
> 웨어러블을 0개로 수렴한다.** 양쪽 φ=2개, 각 σ·n/10 = **3.6 g** (쌍 7.2 g,
> AirPods-Pro 5.4 g 급). RT-SC 나노코일이 σ²=**144 채널/타일**로 청각(A1) ·
> 시각(V1~V6) · 체성감각(S1) · 운동(M1) 피질을 직접 read/write —
> AirPods · Vision Pro · Apple Watch · 외골격 · 의수 · e-skin · 후각·미각·수면·감정
> 트래커 …  **18개 웨어러블이 한 쌍의 보이지 않는 클립으로**.
>
> 4 pillars (n=6 substrate): **clip** (HEXA-MASTOID-CLIP, F-AURA-1) ·
> **coil** (HEXA-RT-SC-NANOCOIL, σ²=144 ch/tile · J₂=24 ch/macro · n^τ=6⁴=1296-ch hex, F-AURA-2) ·
> **cortex** (HEXA-CORTICAL-IF, σ=12 zones · φ=2 dir · τ=4 modes · 18→0, F-AURA-3) ·
> **safety** (HEXA-CORTICAL-SAFETY, Shannon k≤1.5 · SAR≤2 W/kg · ΔT≤0.5 K · watchdog FAR≤1 % · MRI-conditional · no-craniotomy, F-AURA-4).
> n=6 invariant lattice: `σ(6)·φ(6) = n·τ(6) = J₂ = 24`.

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20114981.svg)](https://doi.org/10.5281/zenodo.20114981)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-informational.svg)](CHANGELOG.md)
[![Pillars: 4](https://img.shields.io/badge/pillars-4_(clip%2Bcoil%2Bcortex%2Bsafety)-blue.svg)](#pillars)
[![Atlas: 5 docs](https://img.shields.io/badge/atlas-5_docs-lightgrey.svg)](#atlas)
[![RSC: 19 verify](https://img.shields.io/badge/RSC-19_verify_scripts_(T1%2BT2%2BT3)-brightgreen.svg)](#verification)
[![Falsifiers: 4 / 15 sub-IDs](https://img.shields.io/badge/falsifiers-4_(15_sub--IDs)_OPEN-orange.svg)](.roadmap.hexa_aura)
[![Scope](https://img.shields.io/badge/scope-chip%2Bform--factor_substrate-orange.svg)](#scope-discipline)

> **Provenance**: 5-doc atlas bundled from `canon/domains/{life,cognitive,compute}/` at SHA
> `5458b7d1` (2026-05-10) — 2 of 5 (`neuro`, `brain-computer-interface`) intentionally
> extracted from historical SHAs `579ab196` / `ab155706` for richer Korean content
> (see [`TODO.md`](TODO.md) §1). 4 pillar specs + RSC verify surface authored in-tree
> 2026-05-10 (v1.0.0). RSC pattern: [`~/core/bedrock/docs/runnable_surface_recipe.md`].
> Sister of `dancinlab/hexa-cern` (the canonical RSC worked example), `dancinlab/hexa-ufo`,
> `dancinlab/hexa-rtsc`, `dancinlab/hexa-bio`, `dancinlab/hexa-chip`.

---

## Why

The icon of "future wearable" is a *stack*: AR glasses + earbuds + smartwatch + ring +
sleep tracker, and — for the assistive population — exoskeleton, myoelectric prosthetic,
e-skin sleeve, cochlear processor, retinal-implant goggles. Every one of those is a
separate clasp, a separate battery, a separate visible thing other people see, a separate
failure mode. **`hexa-aura`** is the post-aural BCI **CHIP + FORM-FACTOR SUBSTRATE** of the
HEXA family — a behind-the-ear (BTE) clip pair anchored on the mastoid process that
interfaces the temporal-bone-adjacent cortices via room-temperature-superconducting
nano-coils, so the periphery (sound in your ear, light in front of your retina, vibration
on your skin, force on your limb) is *skipped*: the percept is written at the cortex and
the 18 devices disappear into one φ=2 clip pair, hair-hidden, 7.2 g, that you never have
to charge twice.

`hexa-aura` is the **substrate** — *where* the device lives, *what* the transducer is,
*which* cortical zones it touches, and *what safety caps* it lives under. The cognitive ML
(intent→text, percept→injection patterns) and the sensory/cognitive *application* verbs
live in sibling standalones — see [Scope discipline](#scope-discipline).

Every boundary number is pinned to **n=6** (the third perfect number; `σ(6)=12`, `τ(6)=4`,
`φ(6)=2`, `sopfr(6)=5`, `μ(6)=1`, `J₂=24`):

| Lattice quantity | post-aural BCI projection |
|---|---|
| `φ(6) = 2` | 2 clips (left + right mastoid); φ=2 bidirectional (read + write) per channel |
| `σ·n/10 = 3.6` | 3.6 g per clip → `n·n/10 = 7.2` g pair (AirPods-Pro 5.4 g class) |
| `sopfr(6) = 5` | ≤ 5 mm temporal-bone window; ≤ 5 ms closed-loop latency; ≤ 5 simultaneous HB zones |
| `σ(6) = 12` | 12 cortical target zones (A1·A2·V1·V2·V4·V5·V6·S1·S2·M1·PFC·hipp-relay); 12 ch/micro-tile |
| `τ(6) = 4` | 4 operating modes (sense·inject·sync·sleep); 4 cortex layers tapped of n=6 |
| `J₂ = 24` | 24 bidirectional channels / macro-tile; `σ·φ = n·τ = J₂`; coating life `φ·σ = 24` yr |
| `μ(6) = 1` | 1 μm nano-coil litho pitch; 1 % seizure-watchdog false-alarm floor; ≥1 mm skin clearance (external-only) |
| `σ² = 144` | 144 channels / RT-SC tile |
| `σ³ = 1728` | 1728-electrode-equivalent virtual array (super-resolution beamforming) |
| `n^τ = 6⁴ = 1296` | 1296-channel hexagonal cortical-column lattice (Neuralink-N1 1024-ch parity·+) |
| `σ - φ = 10` | the "10×" lever — 18 wearables / 10 ≈ 1 worn-object class |

---

## Pillars

`hexa-aura` is organized as **4 pillars**, each with a spec doc + a falsifier
(`.roadmap.hexa_aura §B`) + a 3-tier RSC closure ladder (T1 algebraic / T2 closed-form
numerics / T3 published-reference parity):

| Pillar | Spec | Falsifier | n=6 anchor | RSC scripts |
|---|---|---|---|---|
| **clip** | [`clip/doc/mastoid-clip.md`](clip/doc/mastoid-clip.md) | **F-AURA-1** (1a/1b/1c) | φ=2 × σ·n/10 = 3.6 g · τ=4 anchor · sopfr=5 mm bone window · J₂≤24 mm envelope | `calc_clip` · `numerics_clip` · `numerics_clip_parity` |
| **coil** | [`coil/doc/rt-sc-nanocoil.md`](coil/doc/rt-sc-nanocoil.md) | **F-AURA-2** (2a/2b/2c) | μ=1 μm pitch · σ²=144 ch/tile · J₂=24 ch/macro · n^τ=1296-ch hex · σ³=1728-equiv beamforming · RT-SC ambient | `calc_coil` · `numerics_coil` · `numerics_coil_parity` |
| **cortex** | [`cortex/doc/cortical-interface.md`](cortex/doc/cortical-interface.md) | **F-AURA-3** (3a/3b/3c/3d) | σ=12 zones (A1/V1~V6/S1/M1/PFC/…) · φ=2 dir · τ=4 modes · sopfr=5 ms · σ·τ=48 K-class px · 18→0 | `calc_cortex` · `numerics_cortex` · `numerics_cortex_parity` |
| **safety** | [`safety/doc/cortical-safety.md`](safety/doc/cortical-safety.md) | **F-AURA-4** (4a/4b/4c/4d/4e) | Shannon k≤1.5 · SAR≤φ=2 W/kg · ΔT≤φ/τ=0.5 K · watchdog FAR≤μ=1 % · coating φ·σ=24 yr · MRI-conditional · no-craniotomy | `calc_safety` · `numerics_safety` · `numerics_safety_parity` |

```bash
hexa run cli/hexa-aura.hexa clip      # HEXA-MASTOID-CLIP   (form-factor) spec head
hexa run cli/hexa-aura.hexa coil      # HEXA-RT-SC-NANOCOIL (transducer)  spec head
hexa run cli/hexa-aura.hexa cortex    # HEXA-CORTICAL-IF    (cortical I/O) spec head
hexa run cli/hexa-aura.hexa safety    # HEXA-CORTICAL-SAFETY (caps)        spec head
```

---

## Atlas

5 background docs (not pillars — the broader n=6 BCI context the substrate sits in):

| doc | source |
|---|---|
| [`neuro`](docs/neuro.md) — 궁극의 AI 웨어러블 BCI (측두골 클립 / 18개 웨어러블 대체 / 25 카테고리 EXACT) | **canon@579ab196** ✦ KR |
| [`brain-computer-interface`](docs/brain-computer-interface.md) — 궁극의 BCI (불가능성 정리 12개) | **canon@ab155706** ✦ KR |
| [`hexa-neuromorphic`](docs/hexa-neuromorphic.md) — n=6 spiking/synaptic/memristor chip | canon@5458b7d1 |
| [`l9-field-photon-neuro`](docs/l9-field-photon-neuro.md) — L9 field-effect / photonic-topo / neuromorphic 3-sub-layer | canon@5458b7d1 |
| [`neuroscience`](docs/neuroscience.md) — n=6 neuron / circuit / synapse / EEG / neuroimaging | canon@5458b7d1 |

✦ KR = intentionally extracted from a richer pre-migration historical SHA (a 2026-Q1
canonical-format migration trimmed the bodies; see [`TODO.md`](TODO.md) §1).

```bash
hexa run cli/hexa-aura.hexa neuro
hexa run cli/hexa-aura.hexa brain_computer_interface
```

---

## Scope discipline

`hexa-aura` is the **CHIP + FORM-FACTOR** substrate only. The decode ML, the cognitive
verbs, and the sensory verbs are explicitly **out of scope** and belong in sibling
standalones (per [`canon/domains/cognitive/_standalone_repos.md`]):

| concern | repo |
|---|---|
| BCI ML stack (`hexa-neuro`) + cognitive verbs (mind / oracle / telepathy / dream / mind-upload / superpowers) | **`hexa-mind`** (pending) |
| 5-senses verbs (ear / speak / empath / olfact / dream) | **`hexa-senses`** (pending) |
| working EEG / BMI pipeline | `hexa-brain` (sister repo) |
| RT-SC ambient-superconductor — the **coil pillar depends on this** (if `hexa-rtsc` is falsified, **F-AURA-2 is DEMOTED**) | `hexa-rtsc` (sister repo) |
| decoder model serving | `hexa-codex` CLI |
| chip-grade neuromorphic silicon | `hexa-chip` CLI |
| 5G / 6G uplink for cloud sync | `hexa-grid` CLI |

**Do NOT proxy through `hexa-aura`** — call the sibling CLI / repo directly.

---

## Verification

`hexa-aura` ships a full **RSC (Runnable Surface Construction) verify surface** —
19 pure-hexa local audit scripts following [`~/core/bedrock/docs/runnable_surface_recipe.md`]:

| tier | scripts |
|---|---|
| **T1 — algebraic** | `lattice_check` (n=6 closure across roadmap + 4 pillars + 5 atlas) · `cross_doc_audit` (cross-pillar anchor agreement: refs / BT-links / lattice tokens / 18→0 map) · `calc_clip` · `calc_coil` · `calc_cortex` · `calc_safety` (per-pillar n=6 derivations) |
| **T2 — closed-form numerics** (`math_pure`) | `numerics_clip` (mass band / anchor pressure / bone-conduction loss) · `numerics_coil` (array factor / skin depth / read SNR / write focal contrast) · `numerics_cortex` (channel-count comparisons / Shannon read-channel capacity / zone-frame budget) · `numerics_safety` (Shannon damage line / SAR / Pennes bioheat ΔT / watchdog ROC) |
| **T3 — published-reference parity** | `numerics_clip_parity` (BTE hearing-aid / Shokz / AirPods-Pro / eyeglass-temple / Cochlear-N7 / Google-Glass) · `numerics_coil_parity` (SQUID-MEG / OPM-MEG / TMS figure-8 / Neuralink-N1 / Utah / Stentrode / Argus-Orion) · `numerics_cortex_parity` (cochlear-implant / Argus-II + Orion / Flesher-2016 ICMS / BrainGate-handwriting / speech-BCI WPM / Wodlinger arm) · `numerics_safety_parity` (ICNIRP-2020 / IEEE-C95.1-2019 / Shannon-1992 / McCreery / CEM43 / Rossi-2009 / ASTM-F2503 / IEC-60601 / FDA-KFDA pathway) |
| **cross-cutters** | `numerics_cross_pillar` (shared n=6-derived anchors resolve to the same float value across pillars) · `numerics_lattice_arithmetic` (`math_pure` float↔int precision floor) |
| **meta** | `falsifier_check` (F-AURA-1/2/3/4 closure-pct tracker, 3-tier ladder) · `lint_numerics` (every `numerics_*.hexa` follows the 5 RSC invariants) · `saturation_check` (sat-1 ∧ sat-2 → `__HEXA_AURA_RSC_SATURATED__ STOP`) |

```bash
hexa run cli/hexa-aura.hexa verify all          # 19/19 verify scripts PASS, aggregate exit 0
hexa run cli/hexa-aura.hexa verify lattice      # n=6 σ·φ = n·τ = J₂ = 24 closure
hexa run cli/hexa-aura.hexa verify falsifier    # F-AURA-1/2/3/4 closure-pct ladder
hexa run cli/hexa-aura.hexa verify saturation   # __HEXA_AURA_RSC_SATURATED__ STOP
hexa run tests/test_all.hexa                    # selftest + lattice + calculators + cli_verify
```

### What is *not* verified — Status (raw#10 honest C3)

> `hexa-aura` v1.0.0 is a **4-pillar BCI-substrate design spec** + a 5-doc atlas + an RSC
> verify surface. **`verify/*` sentinel PASS** validates: (a) the n=6 lattice arithmetic
> holds everywhere; (b) the per-pillar n=6 derivations are integer/exact-fraction
> consequences of the lattice; (c) the closed-form numerics are internally consistent;
> (d) the design targets sit relative to *published* references as claimed. It does **not**
> validate:
>
> - a **built** mastoid clip / RT-SC nano-coil tile / cortical-I/F device (Stage-1+, `.roadmap.hexa_aura §A.6`)
> - the **RT-SC ambient-operation material claim** — deferred to `hexa-rtsc`; if that falls, **F-AURA-2 is DEMOTED**
> - in-vivo / cadaver-skull / NHP / first-in-human results
> - perceived audio intelligibility / AR image quality / haptic realism (**F-AURA-3a/3b/3c stay OPEN**)
> - the decode ML stack → `hexa-mind` / `hexa-codex` / `hexa-brain`
> - any **FDA / KFDA regulatory clearance** — NOT cleared, NOT in trials (§A.6 step 5)
> - MRI-conditional bench tests / biocompatibility assays / SAR-thermal compliance measurement
>
> The n=6 safety design targets (Shannon `k ≤ 1.5` = round-up of `sopfr/τ`; SAR `≤ φ = 2 W/kg`;
> `ΔT ≤ φ/τ = 0.5 K`; coating life `≥ φ·σ = 24 yr`; watchdog FAR `≤ μ = 1 %`) *happen to land
> on, or conservatively inside, the established human-exposure standards* — the safety claim
> rests on the **standards**, not on the arithmetic. The 18→0 wearable collapse is a *design*
> claim measured against the **perceptual** bandwidth of the replaced devices, whose **raw**
> bandwidth exceeds any demonstrated cortical write rate (the honest gap is flagged in
> `verify/numerics_cortex.hexa` and `cortex/doc/cortical-interface.md` §2).
>
> **F-AURA-1 / F-AURA-2 / F-AURA-3 / F-AURA-4 (15 sub-IDs) — all OPEN.** Monotone:
> `OPEN → CONFIRMED` or `OPEN → DEMOTED`. Silent retract forbidden. See `.roadmap.hexa_aura §A.4 / §B`.

### Falsifier preregister (4 top-level, 15 sub-IDs, all OPEN at v1.0.0)

| Falsifier | Pillar | Sub-IDs | Spec |
|---|---|---|---|
| F-AURA-1 | clip | 1a · 1b · 1c | `clip/doc/mastoid-clip.md` |
| F-AURA-2 | coil | 2a · 2b · 2c | `coil/doc/rt-sc-nanocoil.md` |
| F-AURA-3 | cortex | 3a · 3b · 3c · 3d | `cortex/doc/cortical-interface.md` |
| F-AURA-4 | safety | 4a · 4b · 4c · 4d · 4e | `safety/doc/cortical-safety.md` |

Code-layer 3-tier closure (T1 ✓ + T2 ✓ + T3 parity ✓) = 100% for all 4 at v1.0.0; T4
(Stage-1+ in-vivo / regulatory) is `.roadmap.hexa_aura §A.6` — out of RSC scope.

---

## Install

```bash
# 1. Install hexa-lang (gives you `hexa` + `hx` package manager)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/dancinlab/hexa-lang/main/install.sh)"

# 2. Install hexa-aura
hx install hexa-aura
```

## Run

```bash
hexa-aura clip            # HEXA-MASTOID-CLIP    — form-factor (3.6 g/side, τ=4 anchor, sopfr=5 mm bone)   [F-AURA-1]
hexa-aura coil            # HEXA-RT-SC-NANOCOIL  — transducer (μ=1 μm pitch, σ²=144 ch/tile, J₂=24/macro)  [F-AURA-2]
hexa-aura cortex          # HEXA-CORTICAL-IF     — cortical I/O (σ=12 zones, φ=2 dir, τ=4 modes; 18-to-0)   [F-AURA-3]
hexa-aura safety          # HEXA-CORTICAL-SAFETY — caps (Shannon k 1.5, SAR 2 W/kg, ΔT 0.5 K, FAR 1 %, MRI-cond) [F-AURA-4]
hexa-aura neuro           # atlas: neuro
hexa-aura brain_computer_interface  # atlas: brain-computer-interface
hexa-aura hexa_neuromorphic         # atlas: hexa-neuromorphic
hexa-aura l9_field_photon_neuro     # atlas: l9-field-photon-neuro
hexa-aura neuroscience              # atlas: neuroscience
hexa-aura status          # 4-pillar + 5-atlas table + verdict + cross-link + caveats
hexa-aura selftest        # 4 pillar + 5 atlas presence + n=6 lattice sanity
hexa-aura verify [<sub>]  # RSC surface — sub: all (default) | lattice | cross-doc | clip | coil | cortex | safety | numerics-* | falsifier | lint-numerics | saturation
hexa-aura version         # print version
hexa-aura help            # full --help (subcommands + env vars + cross-link)
```

---

## Architecture

```
hexa-aura/
├── cli/hexa-aura.hexa              # 4 pillar verbs + 5 atlas verbs + status + selftest + verify [<sub>]
├── clip/doc/mastoid-clip.md        # pillar 1 — HEXA-MASTOID-CLIP   (form-factor)   [F-AURA-1]
├── coil/doc/rt-sc-nanocoil.md      # pillar 2 — HEXA-RT-SC-NANOCOIL (transducer)    [F-AURA-2]
├── cortex/doc/cortical-interface.md# pillar 3 — HEXA-CORTICAL-IF    (cortical I/O)  [F-AURA-3]
├── safety/doc/cortical-safety.md   # pillar 4 — HEXA-CORTICAL-SAFETY (caps)         [F-AURA-4]
├── docs/                           # 5-doc atlas + numerics_methodology.md
│   ├── neuro.md  brain-computer-interface.md  hexa-neuromorphic.md
│   ├── l9-field-photon-neuro.md  neuroscience.md
│   └── numerics_methodology.md
├── verify/                         # 19 RSC audit scripts (T1 ×6 + T2 ×4 + T3 ×4 + cross-cutters ×2 + meta ×3)
│   ├── lattice_check.hexa  cross_doc_audit.hexa
│   ├── calc_{clip,coil,cortex,safety}.hexa
│   ├── numerics_{clip,coil,cortex,safety}.hexa
│   ├── numerics_{clip,coil,cortex,safety}_parity.hexa
│   ├── numerics_cross_pillar.hexa  numerics_lattice_arithmetic.hexa
│   └── falsifier_check.hexa  lint_numerics.hexa  saturation_check.hexa
├── tests/                          # test_selftest + test_lattice + test_calculators + test_cli_verify + test_all
├── build/                          # Makefile + header.tex (pandoc + xelatex 5-PDF rebuild)
├── papers/                         # n6-brain-computer-interface-paper.md · n6-hexa-earphone-paper.md
├── .roadmap.hexa_aura              # SSOT — §A.1 lattice · §A.2 cadence · §A.3 cycles · §A.4 falsifiers · §A.6 hardware path · §B falsifier detail
├── install.hexa                    # hx post-install hook (quick selftest)
├── hexa.toml                       # package manifest
├── LICENSE  CITATION.cff  CHANGELOG.md  RELEASE_NOTES_v1.0.0.md  TODO.md  IMPORTED_FROM_CANON.md
└── README.md                       # (this file)
```

---

## Roadmap (cadence)

| Version | Date | Status | Highlights |
|---|---|---|---|
| v0.1.0 | 2026-05-10 | superseded | 5-doc CHIP-substrate bundle (`BUNDLE_FIRST`) |
| **v1.0.0** | **2026-05-10** | **RELEASED** | 4 pillars + 5-doc atlas + 19-script RSC verify surface + cli `verify [<sub>]` + 5 tests + build PDF + methodology; F-AURA-1/2/3/4 all OPEN; `verdict = SPEC_FIRST_RSC` |
| v1.1.0 | ~2026-09 | planned | `coil` ↔ `hexa-rtsc` RT-SC critical-current cross-verify; `cortex` ↔ `hexa-brain` working-pipeline cross-verify |
| v1.2.0 | ~2026-12 | planned | `safety` regulatory-pathway expansion (FDA/KFDA pre-submission skeleton); EEG-watchdog ROC numerics |
| v2.0.0 | ~2027-Q3 | ASPIRATIONAL | Stage-1+ bench prototype (RT-SC coil tile + phantom-skull rig) raw-data fit — **out of RSC code-layer**, `.roadmap.hexa_aura §A.6` |

---

## License

MIT — see [`LICENSE`](LICENSE).

## Provenance

5-doc atlas bundled from `canon/domains/{life,cognitive,compute}/` at canon SHA `5458b7d1`
(2026-05-10), with 2 docs intentionally extracted from historical SHAs `579ab196` /
`ab155706` to recover richer Korean content. 4 pillar specs + 19-script RSC verify surface
+ 5 tests + build pipeline + methodology authored in-tree 2026-05-10 (v1.0.0 full design,
following the [`hexa-cern` RSC worked example]). 2 papers moved from `canon/papers/` at
`canon@a86ca143` (see [`IMPORTED_FROM_CANON.md`](IMPORTED_FROM_CANON.md)). Intentional drift
on the 2 historical atlas docs is expected (`canon/tools/check_drift.hexa`).
