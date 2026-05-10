<!-- @canonical: hexa-aura/safety/doc/cortical-safety.md — pillar 4 of 4 (safety / certification) -->
<!-- @authored: 2026-05-10 (hexa-aura v1.0.0) -->
---
domain: hexa-aura/safety
pillar: 4
pillar_name: HEXA-CORTICAL-SAFETY
falsifier: F-AURA-4
requires:
  - to: rt-sc-nanocoil
  - to: cortical-interface
  - to: mastoid-clip
---

<!-- @own(sections=[WHY, COMPARE, REQUIRES, STRUCT, FLOW, VERIFY, EVOLVE], strict=false, order=sequential, prefix="§") -->

# HEXA-CORTICAL-SAFETY — current-density / SAR / heating / seizure / no-craniotomy envelope (pillar 4/4)

> **One sentence**: the safety pillar is the **cap** the other three live under
> — it fixes, from n=6 arithmetic *rounded to the nearest established standard
> limit*, the maximum cortical induced charge density (Shannon k ≤ ~1.5, also
> checked against k ≤ 1.85), the maximum local 10 g-averaged RF SAR
> (≤ φ = 2 W/kg, the ICNIRP-2020 / IEEE-C95.1-2019 local limit), the maximum
> steady-state tissue heating (ΔT ≤ φ/τ = 0.5 K, CEM43 thermal dose), the
> onboard **EEG-watchdog** seizure / abnormal-rhythm detector targeting a
> μ=1 → 1 % false-alarm floor, the τ=4-layer biocompatible coating with a
> φ·σ = 24-year design lifetime, the **no-craniotomy / external-only** rule
> (μ=1 mm minimum skin clearance, zero implanted material), and **MRI-conditional**
> behaviour (IEC 60601-1 / ASTM F2503). Every write the coil (pillar 2) issues
> and every percept the cortex interface (pillar 3) injects is bounded *below*
> these limits — the upside is whatever fits under the cap, never above it.
>
> **Falsifier**: F-AURA-4 (sub-IDs F-AURA-4a/4b/4c/4d/4e) — `.roadmap.hexa_aura §B.4`.
> Academically UNPROVEN at v1.0.0; verify/* PASS = lattice + limit-comparison arithmetic, NOT clinical safety, NOT regulatory clearance.

---

## §0 n=6 constants — safety pillar

```
  n = 6        σ(6) = 12      τ(6) = 4      φ(6) = 2      sopfr(6) = 5      μ(6) = 1
  σ·φ = n·τ = J₂ = 24         φ·σ = 24      sopfr/τ = 1.25 → design target ≤ 1.5
```

| Lattice quantity        | Safety projection (rounded to the nearest established standard) |
|-------------------------|-----------------------------------------------------------------|
| sopfr/τ = 5/4 = 1.25 → ≤ 1.5 | Shannon charge-density factor k ≤ 1.5 (Shannon 1992: damage above k ≈ 1.85; conservative design ≤ 1.5) |
| φ(6) = 2                | local 10 g-avg SAR ≤ 2 W/kg (ICNIRP-2020 / IEEE-C95.1-2019 head/trunk local limit) |
| φ/τ = 2/4 = 0.5         | steady-state tissue heating ΔT ≤ 0.5 K at scalp/cortex (well below CEM43 = 0; conservative) |
| μ(6) = 1                | EEG-watchdog false-alarm floor ≤ 1 %; minimum skin clearance ≥ 1 mm (external-only) |
| φ·σ = 24                | biocompatible-coating design lifetime ≥ 24 years (matches the φ·σ=24-year channel lifetime in pillar 2) |
| τ(6) = 4                | τ=4-layer coating (parylene-C · alumina · diamond-like-carbon · hydrogel) ; 4 watchdog tiers |
| λ(6) = 2                | 2 independent redundant lanes for every safety-critical signal (watchdog, thermal cutoff, anchor sense) |
| n = 6                   | 6-channel independent thermal-sensor ring around the coil tile |
| J₂ = 24                 | hard power-cutoff if cumulative duty-cycle energy > J₂-scaled budget in any sliding window |

> **Important**: the n=6 numbers above are *design targets that happen to land
> on, or conservatively inside, the established human-exposure standards*. The
> safety claim rests on the **standards** (ICNIRP-2020, IEEE-C95.1-2019, IEC
> 60601-1, Shannon-1992, McCreery, ASTM F2503), not on the arithmetic — the
> arithmetic just shows the targets are *self-consistent* with n=6.

---

## §1 WHY (why a safety pillar gates everything else)

Implanted neural interfaces have a known damage pathway: too much charge per
phase per unit electrode area kills tissue (Shannon, McCreery). RF devices on
the head have a known limit: SAR over ~2 W/kg locally heats tissue beyond what
perfusion can clear. TMS at high intensity can trigger seizures (Rossi 2009).
Any device worn 24/7 against the skin has pressure-necrosis and biocompatibility
limits. And a head-worn coil that is *not* MRI-conditional locks the wearer out
of a routine diagnostic. The safety pillar is where all of those become *hard
caps* on what pillars 1/2/3 are allowed to do — so the device is "safe by
construction", not "safe if you're careful".

Three failure modes the n=6 caps target:

1. **Tissue-damage cap** — induced charge density held at Shannon k ≤ 1.5
   (below the k ≈ 1.85 damage line); the write E-field (pillar 2) is sized
   *backwards* from this ← sopfr/τ → k ≤ 1.5 ← Shannon 1992 / McCreery
2. **Thermal cap** — SAR ≤ φ = 2 W/kg locally + ΔT ≤ φ/τ = 0.5 K steady state,
   monitored by an n=6-channel thermal-sensor ring with a J₂-scaled
   sliding-window energy cutoff ← φ = 2, φ/τ = 0.5 ← ICNIRP-2020 / IEEE-C95.1
3. **Seizure / abnormal-rhythm cap** — onboard EEG-watchdog (τ=4-tier:
   spectral-power → spike-rate → entrainment-detect → consensus) clamps INJECT
   on any pre-ictal signature, false-alarm floor μ=1 → 1 % ← μ = 1, τ = 4
   ← Rossi 2009/2021 TMS-seizure guidance, clinical EEG seizure-detection ROC

| Effect | Without a safety pillar | With HEXA-CORTICAL-SAFETY | Perceived change |
|--------|--------------------------|----------------------------|------------------|
| tissue damage risk | depends on app developer | hard cap: k ≤ 1.5 by construction | "it physically can't over-stimulate" |
| heating | could exceed perfusion clearance | SAR ≤ 2 W/kg + ΔT ≤ 0.5 K, n=6-sensor ring + J₂ energy cutoff | never warm to the touch |
| seizure | TMS-class risk if write field too high | τ=4-tier EEG-watchdog, INJECT clamp, μ=1 → 1 % FAR | safer than TMS by design |
| 24/7 wear | pressure necrosis, skin reaction | ≤ 20 mmHg anchor pressure (pillar 1) + τ=4-layer coating, φ·σ = 24-yr life | wear it for decades |
| MRI access | locked out | MRI-conditional (IEC 60601-1 / ASTM F2503): low ferromagnetic mass, RF-quench mode, artifact-bounded | routine scans still possible |
| surgery | implants need craniotomy | μ=1 mm clearance, zero implanted material, external-only | outpatient fitting, no neurosurgery |

**One-sentence summary**: the safety pillar pins the device's behaviour to the
established human-exposure standards via n=6-consistent targets — charge density
k ≤ 1.5, SAR ≤ 2 W/kg, ΔT ≤ 0.5 K, seizure-watchdog FAR ≤ 1 %, 24-year coating,
MRI-conditional, no craniotomy — so the upside delivered by pillars 1/2/3 is
*always* the largest thing that fits under those caps.

---

## §2 COMPARE (the standards and reference limits F-AURA-4 is measured against)

`verify/numerics_safety_parity.hexa` compares the n=6 design targets against
the **published, citable** limits:

| Limit category | Established reference | Published value | n=6 design target | F-AURA-4 sub-ID |
|----------------|----------------------|-----------------|-------------------|-----------------|
| charge density (neural stim.) | Shannon 1992; McCreery et al. | damage above k ≈ 1.85 (log(Q/A) = k − log(Q)); safe stim. typ. ≤ 30 µC/cm²/phase | k ≤ 1.5 (= sopfr/τ rounded conservatively) | F-AURA-4a |
| RF SAR (head, local) | ICNIRP-2020; IEEE C95.1-2019 | 2 W/kg local, 10 g average, head/trunk (general public; occupational 10 W/kg) | ≤ φ = 2 W/kg | F-AURA-4b |
| whole-body SAR | ICNIRP-2020; IEEE C95.1-2019 | 0.08 W/kg whole-body avg (general public) | ≤ 0.08 W/kg (device duty-cycle bounded) | F-AURA-4b |
| tissue heating / thermal dose | CEM43 thermal-dose model; ICNIRP | ΔT ≈ 1 °C tolerable indefinitely (perfused); CEM43 < ~few min at 43 °C | ΔT ≤ φ/τ = 0.5 K steady state | F-AURA-4c |
| seizure (transcranial stim.) | Rossi et al. 2009 / 2021 (TMS safety) | rTMS seizure incidence ≈ < 1 in 30 000 sessions w/ guidelines | EEG-watchdog FAR ≤ μ = 1 %, clamp on pre-ictal signature | F-AURA-4d |
| seizure-detection performance | clinical EEG seizure-detection literature | sensitivity ≈ 90–95 %, FAR ≈ 0.1–1 /hour for good detectors | sensitivity ≥ 95 % at FAR ≤ 1 % (μ=1) | F-AURA-4d |
| implanted-device lifetime | DBS leads (Medtronic); cochlear implants | electrode/coating lifetimes ≈ 10–25 yr in service | ≥ φ·σ = 24 yr coating design life | (F-AURA-4a aux) |
| MRI compatibility | IEC 60601-1; ASTM F2503; FDA MRI-conditional labeling | MR-conditional devices: field strength, SAR, gradient slew limits, artifact extent specified | MRI-conditional: low ferromagnetic mass, RF-quench mode, bounded artifact | F-AURA-4e |
| general medical-device safety | IEC 60601-1 (3rd ed.); ISO 14971 (risk mgmt) | electrical safety, leakage current, single-fault tolerance | single-fault-tolerant (λ=2 redundancy), leakage < 60601 limits | (cross-cutting) |
| regulatory path (US/KR) | FDA 21 CFR (PMA / De Novo / 510(k)); KFDA/MFDS class III | implanted/active neuro devices → PMA (class III); IDE for clinical trials | class III PMA pathway (US), class 4 (KR); IDE → first-in-human | (regulatory, §A.6 step 5) |

**Honest gap analysis** (all OPEN):
- **F-AURA-4a/4b/4c** — `numerics_safety.hexa` shows the *targets are inside the
  standards' numbers and self-consistent with n=6*; it does **not** show a
  built device measured against the standards. The through-bone field
  attenuation (pillar 2) and the actual induced-current distribution need FEM
  (SimNIBS / Sim4Life-class) — that's §A.6.1 stage B.
- **F-AURA-4d** — the τ=4-tier watchdog ROC (sensitivity vs FAR) is specified,
  not measured; `numerics_safety_parity.hexa` checks the target sits inside the
  published clinical-detector envelope.
- **F-AURA-4e** — MRI-conditional behaviour is *specified* (mass budget from
  pillar 1, RF-quench mode); not bench-tested.
- Regulatory clearance is **not** in any verify/* — it's §A.6 step 5, years out.

---

## §3 REQUIRES

| Requires | From | Why |
|----------|------|-----|
| coil write E-field amplitude, switching power dissipation, read-frame duty cycle | pillar 2 (`rt-sc-nanocoil`) | these are the *inputs* the caps are applied to — the coil must report them so the watchdog and thermal model can bound them |
| which cortical zones get written, at what rate, in what pattern | pillar 3 (`cortical-interface`) | seizure risk and thermal load are zone- and rate-dependent (V1 deep field = highest both) |
| mass budget for low-ferromagnetic / MRI-conditional construction; anchor pressure | pillar 1 (`mastoid-clip`) | MRI-conditionality and pressure-necrosis avoidance are form-factor properties this pillar *constrains* |
| established human-exposure standards | external (ICNIRP / IEEE / IEC / ASTM / FDA / Shannon / McCreery / Rossi) | the safety claim *is* "compliant with these"; the n=6 arithmetic only shows the targets are self-consistent |

---

## §4 STRUCT (the cap stack)

```
   ┌──────────────────────────────────────────────────────────────┐
   │  Cap 1 — charge density:  k ≤ 1.5  (Shannon)                  │  → bounds pillar-2 write E-field
   │  Cap 2 — local SAR:       ≤ φ = 2 W/kg, 10 g avg (ICNIRP)     │  → bounds duty cycle × field²
   │  Cap 3 — heating:         ΔT ≤ φ/τ = 0.5 K (CEM43)            │  → n=6-channel thermal ring + J₂ energy cutoff
   │  Cap 4 — seizure:         EEG-watchdog FAR ≤ μ = 1 %          │  → τ=4-tier detector, INJECT clamp
   │  Cap 5 — biocompat:       τ=4-layer coating, ≥ φ·σ = 24 yr    │  → parylene-C / alumina / DLC / hydrogel
   │  Cap 6 — no surgery:      ≥ μ = 1 mm skin clearance, 0 implant│  → external-only, outpatient fitting
   │  Cap 7 — MRI:             MRI-conditional (IEC 60601 / F2503) │  → low-ferro mass, RF-quench mode, bounded artifact
   │  Cap 8 — single fault:    λ = 2 redundancy on every safety lane│  → ISO 14971 / IEC 60601-1
   └──────────────────────────────────────────────────────────────┘
        │                │                │                │
   pillar 2 write    pillar 2/3 duty   thermal ring     watchdog ASIC
   field sizer       cycle limiter     (n=6 sensors)    (τ=4 tiers, in clip — pillar 1)

   EEG-watchdog τ=4 tiers:
     tier 1  spectral power (δ/θ/α/β/γ band ratios) — fast, coarse
     tier 2  spike / sharp-wave rate (template match)
     tier 3  entrainment detector (is the *device's own* rhythm driving cortex?)
     tier 4  consensus (≥ 2 of tiers 1–3 + cross-clip agreement, φ=2) → INJECT clamp + alert
```

- **Backwards sizing**: pillar 2 does *not* pick a write field and then check
  it's safe; the safe field is *derived* from Cap 1 (k ≤ 1.5) and Cap 4
  (below entrainment threshold), and pillar 2 must deliver its focus *at that
  amplitude*. Same for duty cycle vs Caps 2/3.
- **Fail-safe ordering**: any cap breach → clamp INJECT amplitude → if still
  over, drop to SENSE-only → if thermal, full power-off → bone-conduction
  "device cooling, back shortly" message. Loss of ≥ 2 anchor contacts (pillar
  1) → full off regardless.

---

## §5 FLOW (a write request, gated)

```
  pillar 3 requests: "inject percept P to zone Z at rate R"
        │
        ▼
  [Cap 1 check] field needed for P ≤ k≤1.5 amplitude?  ──no──► reject, request lower-fidelity P
        │ yes
        ▼
  [Cap 2/3 check] R × field² over sliding window ≤ SAR 2 W/kg & ΔT ≤ 0.5 K?  ──no──► throttle R
        │ yes
        ▼
  [Cap 4 check] EEG-watchdog: no pre-ictal signature in zone Z?  ──pre-ictal──► clamp, alert, log
        │ clear
        ▼
  ISSUE write (pillar 2 coil)  ──┐
        │                        │  φ=2 closed loop: within ≤ sopfr ms, SENSE zone Z
        ▼                        │  → did the percept land? did cortex over-respond?
  [post-write watchdog re-check] ◄┘  ──over-response──► back off amplitude next cycle
        │
        ▼
  next request
```

---

## §6 VERIFY (what `verify/*.hexa` checks here)

| Tier | Script | Checks |
|------|--------|--------|
| T1 | `verify/calc_safety.hexa` | k ≤ 1.5 = round-up(sopfr/τ = 1.25); SAR ≤ φ = 2 W/kg; ΔT ≤ φ/τ = 0.5 K; FAR ≤ μ = 1 %; coating life ≥ φ·σ = 24 yr; τ=4 coating layers; τ=4 watchdog tiers; λ=2 redundancy; n=6 thermal sensors; skin clearance ≥ μ=1 mm — integer / exact-fraction arithmetic, plus the assertion that each target is ≤ the corresponding standard's published number |
| T2 | `verify/numerics_safety.hexa` | math_pure: Shannon damage line log(Q/A) = k − log(Q) evaluated at k=1.5 and k=1.85, verify design point sits below the 1.85 line; SAR = σ_cond·E²·duty/(2ρ) form, verify ≤ 2 W/kg at pillar-2 field & duty inputs; steady-state ΔT from a Pennes-bioheat 1-node lumped model with perfusion, verify ≤ 0.5 K; sliding-window energy cutoff arithmetic (J₂-scaled); watchdog ROC point (sens ≥ 0.95 @ FAR ≤ 0.01) consistency |
| T3 | `verify/numerics_safety_parity.hexa` | parity vs published: ICNIRP-2020 (2 W/kg local 10g, 0.08 W/kg whole-body), IEEE C95.1-2019 (same family); Shannon 1992 (k ≈ 1.85 damage; k=1.5 conservative), McCreery (safe charge-injection limits ≈ 30 µC/cm²/phase); Rossi 2009/2021 (rTMS seizure incidence < 1/30000); clinical EEG seizure-detector ROC (sens 90–95 %, FAR 0.1–1 /h); DBS/cochlear coating lifetimes (10–25 yr); ASTM F2503 / IEC 60601-1 MR-conditional parameter classes — verify every n=6 design target is at or inside the corresponding published limit |

`verify/cross_doc_audit.hexa` checks the k≤1.5 / 2 W/kg / 0.5 K / 1 % FAR / 24 yr
/ no-craniotomy tokens here match the *caps* referenced by pillars 2 and 3 and by
`.roadmap.hexa_aura §B.4`.

**Not verified** (raw#10 C3): a built device measured against any standard; FEM
of the induced-current distribution; the watchdog's actual ROC on real EEG;
biocompatibility assays; MRI bench tests; **any regulatory clearance** (FDA /
KFDA — that is §A.6 step 5, years out, and is *not* a verify/* target). The
`numerics_safety*.hexa` scripts check that the *design targets are arithmetically
inside the published exposure standards*; that is the strongest claim the
code-layer makes, and it is far from "this device is safe to wear".

---

## §7 EVOLVE

- **v1.1.0** — `safety/doc/eeg_watchdog_roc.md` + `numerics_safety_roc.hexa`:
  a parametric ROC model for the τ=4-tier watchdog against published seizure-EEG
  benchmark datasets (e.g. CHB-MIT, TUH-EEG seizure corpus statistics).
- **v1.2.0** — `safety/doc/regulatory_pathway.md`: the full FDA class III PMA /
  IDE map and the KFDA/MFDS class 4 map, with ISO 14971 risk-management
  structure and the IEC 60601-1 / 60601-2-x / ISO 10993 (biocompat) test
  matrix — the pre-submission package skeleton (§A.6 step 5 prep, docs-layer).
- **Stage-1+ (§A.6)** — induced-current FEM (SimNIBS / Sim4Life-class) → bench
  SAR/thermal measurements on a head phantom → biocompat assays on the coating
  stack → MR-conditional bench tests → then the regulatory path.

---

## §8 Honest scope (raw#10 C3)

`HEXA-CORTICAL-SAFETY` is a **safety-envelope design spec**: the caps (charge
density k ≤ 1.5, SAR ≤ 2 W/kg, ΔT ≤ 0.5 K, watchdog FAR ≤ 1 %, 24-year coating,
no-craniotomy, MRI-conditional, λ=2 single-fault tolerance) that every other
pillar must stay under, each pinned to an n=6-consistent target *and* to an
established human-exposure standard. It does **not** demonstrate: a built device;
compliance testing against any standard; an induced-current FEM; the watchdog's
real-world ROC; biocompatibility; MRI bench results; or **any regulatory
clearance** — the device is not approved, not in trials, and `verify/*.hexa`
PASS does not change that. The strongest code-layer claim is: *the n=6 design
targets are arithmetically self-consistent and each sits at or inside the
corresponding published limit (ICNIRP-2020, IEEE-C95.1-2019, IEC-60601-1,
Shannon-1992, McCreery, Rossi-2009, ASTM-F2503)* — which is a necessary, not
sufficient, condition for a safe device.

F-AURA-4 (4a/4b/4c/4d/4e) remains **OPEN**.
