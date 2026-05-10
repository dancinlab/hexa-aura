# TODO — hexa-aura

`v1.0.0` is the full design: 4 pillars (clip / coil / cortex / safety) + 5-doc atlas
+ 19-script RSC verify surface + 5 tests + build PDF pipeline + numerics methodology
(see [README.md](README.md), [CHANGELOG.md](CHANGELOG.md), [`.roadmap.hexa_aura`](.roadmap.hexa_aura)).
This TODO tracks the remaining follow-ups.

---

## §1 Canon restoration (2 historical atlas docs)  — owner-pending

2 of the 5 atlas docs are intentionally extracted from older canon SHAs because a
2026-Q1 canonical-format migration trimmed the bodies while modernising the frontmatter:

| doc | current lines | historical max | source SHA | growth |
| --- | ---: | ---: | --- | ---: |
| `neuro` | 616 | **1854** | `579ab196` | 3.0× |
| `brain-computer-interface` | 717 | **962** | `ab155706` | 1.3× |

The richer Korean bodies carry the load-bearing concept material (측두골 클립 / 18개
웨어러블 대체 / RT-SC 나노코일 / 25 카테고리 EXACT 검증 등). Options for canon-side
restoration (not yet decided):
- [ ] **A — hybrid restore**: keep current frontmatter, replace `body` with the historical Korean body.
- [ ] **B — schema extension**: extend `standalone_seeds.tsv` to support `canonical_sha` per row.
- [ ] **C — status quo**: leave canon as-is, document the drift (already in effect).

Flag in the next n6-canon planning session.

---

## §2 Sister standalones (cognitive / sensory split)  — owner-pending

Per [`canon/domains/cognitive/_standalone_repos.md`], the cognitive + sensory verbs
that were briefly bundled into `hexa-aura@v0.1.0-pre` belong in two pending siblings:

### 🧠 `hexa-mind` (pending — 7 docs)
- [ ] `hexa-mind` · `hexa-neuro` (BCI ML stack) · `hexa-oracle` · `hexa-telepathy` · `mind-upload` · `telepathy` · `superpowers`

### 👁️ `hexa-senses` (pending — 5 docs)
- [ ] `hexa-dream` · `hexa-ear` · `hexa-empath` · `hexa-olfact` · `hexa-speak`

Separate session.

---

## §3 v1.0.0 — Full chip-substrate design  — ✅ DONE (2026-05-10)

Delivered as the 4-pillar substrate + RSC verify surface (was: "each new verb = a new
canon spec doc following the gold-standard n=6 HEXA template"). Mapping of the original
plan into the 4 pillars:

- Hardware form-factor (3) → **pillar `clip`** (HEXA-MASTOID-CLIP): `mastoid-clip` form-factor
  + bone-conduction anchor (§4), `rt-sc-nanocoil` → split to **pillar `coil`**, `temporal-cortex-map`
  → folded into **pillar `cortex`** (the σ=12 zone map / temporal-bone window alignment).
- Stimulator stack (3) → **pillar `cortex`**: `auditory-injection` (A1), `visual-injection` (V1~V6),
  `somatosensory-haptic` (S1) — the σ=12-zone read/write surface.
- Safety / certification (4) → **pillar `safety`** (HEXA-CORTICAL-SAFETY): `cortical-safety`
  (Shannon k≤1.5 + SAR≤2 W/kg + ΔT≤0.5 K), `eeg-watchdog` (τ=4-tier, FAR≤1 %), `regulatory-medical`
  (FDA class III PMA / KFDA class 3–4 pathway — identified, NOT cleared), `surgical-zero`
  (no-craniotomy / external-only, ≥μ=1 mm clearance, 0 implanted material).
- Decoder verbs (subvocal-decoder / dream-replay / emotion-bridge) — stayed OUT OF SCOPE
  (→ `hexa-mind`), as planned.

---

## §4 Cross-link policy (raw#10)  — DO NOT re-implement; call sibling CLI / repo directly

| concern | sibling |
| --- | --- |
| RT-SC ambient-superconductor (coil pillar dep — if falsified, F-AURA-2 DEMOTED) | `hexa-rtsc` (sister) |
| BCI ML stack / cognitive verbs | `hexa-mind` (pending) |
| 5-senses verbs | `hexa-senses` (pending) |
| working EEG / BMI pipeline | `hexa-brain` (sister) |
| decoder model serving | `hexa-codex` CLI |
| chip-grade neuromorphic silicon | `hexa-chip` CLI |
| 5G / 6G uplink | `hexa-grid` CLI |

---

## §5 RSC loop status (recipe §7)

v1.0.0 ships the full 16-script RSC inventory (+3 extras = 19 scripts). All 4 falsifiers
at 100% code-layer closure (T1 ✓ + T2 ✓ + T3 parity ✓ — `verify/falsifier_check.hexa`).
`verify/saturation_check.hexa` emits `__HEXA_AURA_RSC_SATURATED__ STOP`. Per recipe §9.1,
post-saturation cron/loop firings run the saturation health-check only — **no forced chunks**.

---

## §6 v1.1.0+ — cross-verify + hardware path

- [ ] **v1.1.0** — `coil` ↔ `hexa-rtsc`: import its RT-SC critical-current-density datasheet,
      re-run `verify/numerics_coil.hexa` with the real J_c (T2 → live-data boundary). `cortex` ↔
      `hexa-brain`: import its working EEG/BMI pipeline decode-accuracy numbers.
- [ ] **v1.2.0** — `safety/doc/regulatory_pathway.md` (FDA class III PMA / IDE map + KFDA/MFDS
      class 3–4 + ISO 14971 risk structure + IEC 60601 / ISO 10993 test matrix — pre-submission
      skeleton, docs-layer); `verify/numerics_safety_roc.hexa` (τ=4-tier watchdog ROC vs published
      seizure-EEG benchmark statistics, e.g. CHB-MIT / TUH-EEG corpus).
- [ ] **v1.2.0** — `cortex/doc/zone_budgets.md` (how many macro-tiles each σ=12 zone gets, what
      perceptual rate that buys, with the F-AURA-3 sub-IDs as acceptance criteria).
- [ ] **v1.x** — decide whether the M1 motor-decode lane folds into `cortex` or defers entirely to
      `hexa-brain` (`.roadmap.hexa_aura §A.5`).
- [ ] **Stage-1+ (`.roadmap.hexa_aura §A.6`, out of RSC code-layer scope, all steps unstarted)** —
      A: `clip/doc/benchtop_v0_design.md` (full BOM + block diagram + interface table + safety spec);
      B: coil-field FEM + bioheat FEM + neuron-population response (SimNIBS / Sim4Life-class parity);
      C: sim-firmware (coil-driver DAC / EEG-watchdog ADC chain, sim-only, `firmware/sim/*.hexa`);
      D: HDL / MCU skeleton; then phantom-skull → cadaver → NHP → first-in-human; then FDA/KFDA path.

---

## §7 Authoring workflow notes

- 4 pillar specs live in-tree at `<pillar>/doc/<name>.md` (not in canon — they're authored here
  following the gold-standard n=6 HEXA template §WHY/§COMPARE/§REQUIRES/§STRUCT/§FLOW/§VERIFY/§EVOLVE).
- New `verify/numerics_*.hexa` must follow the 5 RSC invariants (`lint_numerics.hexa` enforces);
  add the filename to `lint_numerics.hexa NUMERICS_SCRIPTS` + `tests/test_calculators.hexa CASES` +
  the CLI `VERIFY_SUBS` + `_verify_script()`; bump `tests/test_cli_verify.hexa` expectations if needed.
- `falsifier_check.hexa` / `saturation_check.hexa` arrays must stay in sync with disk; CHANGELOG +
  `.roadmap.hexa_aura §A.3` cycle entry per commit.
