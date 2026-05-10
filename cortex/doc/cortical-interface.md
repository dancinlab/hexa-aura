<!-- @canonical: hexa-aura/cortex/doc/cortical-interface.md — pillar 3 of 4 (cortical I/O) -->
<!-- @authored: 2026-05-10 (hexa-aura v1.0.0) -->
---
domain: hexa-aura/cortex
pillar: 3
pillar_name: HEXA-CORTICAL-IF
falsifier: F-AURA-3
requires:
  - to: rt-sc-nanocoil
  - to: mastoid-clip
  - to: cortical-safety
crosslink:
  - hexa-brain (working EEG/BMI pipeline — sister)
  - hexa-mind (cognitive verbs / BCI ML stack — pending)
  - hexa-senses (5-senses verbs — pending)
---

<!-- @own(sections=[WHY, COMPARE, REQUIRES, STRUCT, FLOW, VERIFY, EVOLVE], strict=false, order=sequential, prefix="§") -->

# HEXA-CORTICAL-IF — direct cortical read/write across σ=12 zones (pillar 3/4)

> **One sentence**: the coil tiles (pillar 2) talk to **σ=12 cortical target
> zones** — A1·A2 (auditory) · V1·V2·V4·V5·V6 (visual) · S1·S2 (somatosensory)
> · M1 (motor) · PFC · hippocampal-relay — through the temporal-bone window, in
> **φ=2 directions** (read = decode intent/percept, write = inject percept) and
> **τ=4 operating modes** (sense · inject · sync · sleep), so that **A1
> injection replaces earbuds, V1~V6 injection replaces AR/VR glasses, S1 haptic
> write replaces e-skin, and M1/S1 read+write replaces exoskeleton/prosthetic
> feedback** — the 18-wearable → 0 collapse, *measured against the perceptual
> bandwidth of the devices it replaces*. This pillar owns the *cortical side*;
> the *form-factor* is pillar 1, the *transducer* is pillar 2, the *safety cap*
> is pillar 4, and the *cognitive/ML decoding* is `hexa-mind` (pending) +
> `hexa-brain` (working pipeline). Out of scope here: dream/telepathy/oracle
> verbs (→ `hexa-mind`), ear/speak/empath/olfact verbs (→ `hexa-senses`).
>
> **Falsifier**: F-AURA-3 (sub-IDs F-AURA-3a/3b/3c/3d) — `.roadmap.hexa_aura §B.3`.
> Academically UNPROVEN at v1.0.0; verify/* PASS = lattice + parity arithmetic.

---

## §0 n=6 constants — cortex pillar

```
  n = 6        σ(6) = 12      τ(6) = 4      φ(6) = 2      sopfr(6) = 5      μ(6) = 1
  σ·φ = n·τ = J₂ = 24         σ·τ = 48      σ² = 144      n^τ = 6⁴ = 1296
```

| Lattice quantity | Cortex projection |
|------------------|-------------------|
| n = 6            | 6 neocortical layers (I–VI) — the coil taps layers II/III · IV · V · VI (τ=4 of the 6) |
| σ(6) = 12        | 12 cortical target zones: A1, A2, V1, V2, V4, V5, V6, S1, S2, M1, PFC, hipp-relay |
| τ(6) = 4         | 4 operating modes: sense · inject · sync · sleep; 4 cortex layers tapped |
| φ(6) = 2         | φ=2 directions: read (decode) + write (inject) per channel |
| sopfr(6) = 5     | ≤ 5 ms closed-loop latency (feels instantaneous); ≤ 5 simultaneous high-bandwidth zones |
| σ·τ = 48         | 48 K-class virtual-retina "pixel" budget per tile group (scales with tile count) |
| n^τ = 1296       | 1296-ch hex lattice ↔ ≈ 1296 cortical columns addressed per clip |
| J₂ = 24          | 24-channel macro-tile = the data-plane unit the decoder consumes |

---

## §1 WHY (how direct cortical I/O changes your life)

Sensory and assistive wearables are *peripheral* — they put sound in your ear
canal, light in front of your retina, vibration on your skin, force on your
limb. Each conversion (air → eardrum → cochlea → A1; photons → retina → LGN →
V1) has a device, a battery, a failure mode, and a visible footprint. The
post-aural BCI's claim is that you can skip the periphery: write the percept
*at the cortex* and the device disappears.

Once the cortical interface is fixed by n=6 (σ=12 zones, φ=2 directions, τ=4
modes), the wearable stack collapses:

| Wearable removed | Cortical zone | Direction | n=6 anchor |
|------------------|---------------|-----------|------------|
| earbuds / headphones / hearing aids | A1, A2 | write (inject audio) + read (intent) | σ zones, φ=2 |
| AR glasses / VR headset / smart-glasses display | V1, V2, V4, V5, V6 | write (overlay) | σ·τ = 48 K px-class |
| e-skin / haptic suit / VR gloves | S1, S2 | write (touch) | sopfr=5 ms |
| exoskeleton control / myoelectric prosthetic | M1 | read (motor intent) + write (proprioception via S1) | n=6 DOF |
| sleep tracker / HRV ring | M1/S1 relay, autonomic | read (sleep stage) | τ=4 (sleep mode) |
| smartwatch notifications / haptic alerts | S1, A1 | write | μ=1 (subtle) |
| eye-tracking / gaze input | V5/V6 + M1 (saccade) | read | φ=2 |
| voice assistant mic / earpiece | subvocal M1 (→ `hexa-mind`) | read | (decode → hexa-mind) |
| "18 → 0" tail (digital olfact/gust, emotion-share, ...) | → `hexa-senses` / `hexa-mind` | — | σ - φ = 10 → 1 |

| Effect | Current (peripheral wearables) | After HEXA-CORTICAL-IF | Perceived change |
|--------|---------------------------------|-------------------------|------------------|
| audio | earbuds in canal, 2 ch | A1 inject, σ-spatialized, hearing-loss bypass | "perfect hearing", nothing in ears |
| vision overlay | glasses display, FOV-limited | V1~V6 inject, full-field, blind-spot-fill | AR with bare eyes |
| touch / haptics | buzzer on wrist / skin | S1 inject, taxel-resolved | feel textures, prosthetic touch |
| motor assist | bulky exoskeleton | M1 read → light powered orthosis + S1 proprioception | walk again, naturally |
| latency | air/optic/skin transit + device | sopfr = 5 ms closed loop | instantaneous |
| visible devices | many | φ=2 hidden clips | nothing to see |
| simultaneous channels | one device per sense | up to ~5 (sopfr) zones at full bandwidth | seamless multi-modal |

**One-sentence summary**: writing the percept at σ=12 cortical zones in φ=2
directions on a τ=4 cycle with ≤ sopfr=5 ms latency removes the periphery — so
the 18 peripheral wearables become 0 — *provided* the achievable cortical write
rate exceeds the perceptual bandwidth of what it replaces, which is exactly
what F-AURA-3 puts on the line.

### Everyday perceived scenarios

```
  call         — A1 inject the caller's voice, spatialized; your A1 still hears the room (mix)
  navigation   — V5/V6 overlay a turn arrow on the actual street; V1 untouched
  message      — S1 taps a Morse-light pattern on "your" wrist (no wrist device)
  reading      — V1~V4 overlay a translation under foreign text
  prosthetic   — grasp a cup: M1 decodes intent → orthosis acts → S1 injects grip pressure → you adjust
  sleep        — τ=4 sleep mode: A1/V1 silent, M1/S1 relay tracks stage, gentle A1 wake at the right phase
```

---

## §2 COMPARE (the perceptual-bandwidth bars F-AURA-3 must clear)

`verify/numerics_cortex_parity.hexa` puts the claimed cortical I/O against the
**published** bandwidth of (a) the wearables it replaces and (b) the best
demonstrated cortical interfaces:

| Modality | Device it replaces — published bandwidth | Best demonstrated cortical I/F — published | F-AURA-3 sub-ID |
|----------|------------------------------------------|---------------------------------------------|-----------------|
| audio (write) | earbuds: 2 ch × 20 kHz × 16 bit ≈ 1.3 Mbit/s; hearing | cochlear implant: Cochlear Nucleus ≈ 22 electrodes, ≈ 8 spectral channels effective; ≈ 8 wpm→fluent speech with training | F-AURA-3a |
| vision (write) | AR display: ≈ 10⁶ px × 60 Hz; retina ≈ 10⁶ ganglion cells | retinal/cortical visual prosthesis: Argus II 60 electrodes (6×10); Orion cortical 60 ch; effective acuity ≈ 20/1260 | F-AURA-3b |
| haptic (write) | e-skin / haptic suit: ≈ 10³–10⁴ taxels | S1 ICMS (Flesher 2016, Pittsburgh): ≈ 4–6 channels restored localized touch sensation, percept intensity controllable | F-AURA-3c |
| read (decode) | keyboard ≈ 40–80 wpm; speech ≈ 150 wpm | BrainGate handwriting (Willett 2021) ≈ 90 char/min ≈ 18 wpm; speech BCI (Willett 2023 / Metzger 2023) ≈ 62–78 wpm; cursor (Pandarinath 2017) ≈ 4 bit/s | F-AURA-3d |
| motor (read) | game controller; myoelectric ≈ 2–3 DOF | BrainGate / Neuralink: 2-D/3-D cursor + click; up to ~7-DOF arm reaching (Collinger 2013, Wodlinger 2015) | F-AURA-3 (motor lane) |

**Honest gap analysis** (all OPEN):
- **F-AURA-3a** — the *replaced* device (earbuds, ~Mbit/s) has far more raw
  bandwidth than any demonstrated A1 write (cochlear implants give ~8 effective
  spectral channels). The claim is that a σ²=144-ch tile *over A1* with focal
  beamforming closes this — `numerics_cortex.hexa` checks the *channel-count
  arithmetic* (144 ch ≫ 22-electrode cochlear) and the information-rate bound,
  not perceived intelligibility.
- **F-AURA-3b** — Argus II/Orion at 60 electrodes give ~20/1260 acuity; AR
  glasses give a Mpixel display. n^τ=1296 ch + σ³=1728-equivalent beamforming
  over V1 is the claimed bridge — `numerics_cortex.hexa` checks 1296 ≫ 60 and
  the pixel-budget arithmetic σ·τ = 48 K-class per tile group; the *perceived*
  AR-grade image is unproven.
- **F-AURA-3c** — Flesher-2016 ICMS gives a few channels of localized touch;
  e-skin gives 10³–10⁴ taxels. σ² ch/tile over S1, tiled, is the claimed
  bridge.
- **F-AURA-3d** — the read decode WPM is the most progress-rich line: 62–78 wpm
  speech BCI is already in the human range. The claim is that going non-invasive
  (no craniotomy) without losing that rate is feasible with MEG-class read SNR
  (pillar 2) — `numerics_cortex_parity.hexa` checks the published WPM ladder and
  the bit-rate arithmetic, not a new non-invasive recording.

---

## §3 REQUIRES

| Requires | From | Why |
|----------|------|-----|
| σ²=144 ch/tile, J₂=24 ch/macro-tile, 1296-ch hex lattice, write E-field, read SNR | pillar 2 (`rt-sc-nanocoil`) | the actual transducer; cortical I/O is impossible without it |
| temporal-bone window alignment to A1/S1 relay paths | pillar 1 (`mastoid-clip`) | the clip must physically sit where the bone window lines up with the target zones |
| write E-field cap (≤ Shannon k≤1.5, below seizure threshold), ΔT ≤ 0.5 K, SAR ≤ 2 W/kg | pillar 4 (`cortical-safety`) | the write amplitude is bounded by safety, not by what would be "better" |
| decode models (intent → text/cursor; percept → injection pattern) | `hexa-mind` (pending) / `hexa-codex` serve / `hexa-brain` (working pipeline) | this pillar produces channels; turning them into language/percepts is the ML stack — explicitly out of scope here |
| 5-senses verbs (ear/speak/empath/olfact) | `hexa-senses` (pending) | the *sensory-application* layer; this pillar is the cortical-I/O substrate it sits on |

---

## §4 STRUCT (the σ=12 zone map, anatomically through the temporal bone)

```
                       (left clip — mirror on right, φ=2)
        ┌──────────────────────────────────────────────────────┐
        │  temporal-bone window (sopfr ≤ 5 mm) over:            │
        │                                                       │
        │   A1 ── primary auditory cortex (Heschl's gyrus)      │  audio write/read
        │   A2 ── auditory association (planum temporale)       │  speech/music
        │   ─────────────── (occipital reach via curved field) ─│
        │   V1 ── primary visual (calcarine)                   │  vision write
        │   V2 ── visual association                            │
        │   V4 ── colour                                       │
        │   V5/MT ── motion                                    │  AR motion overlay
        │   V6 ── peripheral / self-motion                     │
        │   ─────────────── (parietal reach) ──────────────────│
        │   S1 ── primary somatosensory (postcentral gyrus)    │  haptic write/read
        │   S2 ── somatosensory association                    │  texture
        │   ─────────────── (frontal reach) ───────────────────│
        │   M1 ── primary motor (precentral gyrus)             │  motor-intent read,
        │   PFC ── prefrontal (attention / executive)          │  proprioception write
        │   hipp-relay ── medial-temporal relay (context/memory hooks → hexa-mind) │
        └──────────────────────────────────────────────────────┘
        σ = 12 zones. τ = 4 cortex layers tapped (II/III, IV, V, VI).
        n = 6 layers total. Coil reaches them by field-shaping across tiles;
        the deepest (V1 calcarine) is the hardest — F-AURA-3b's core risk.
```

- Each zone is served by one or more **macro-tiles (J₂=24 ch)**; a zone's
  bandwidth scales with the tile count over it. A1/V1 get the most tiles
  (highest perceptual demand); PFC/hipp-relay the fewest (mostly read).
- **Write** = the coil induces a spatiotemporal E-field pattern matching the
  desired percept's natural cortical activity pattern (so it reads as "real"
  sound/sight/touch), amplitude-capped by pillar 4.
- **Read** = the coil's pick-up loops sense the magnetic signature of cortical
  activity; the decode → text/cursor/percept-intent step is `hexa-mind` /
  `hexa-brain`, not this pillar.

---

## §5 FLOW (τ=4 operating modes as a state machine)

```
                 ┌──────────────────────────────────────────┐
                 ▼                                          │
   [SLEEP] ──user wakes / scheduled──► [SENSE] ──app needs output──► [INJECT]
     │  (A1/V1 silent, M1/S1 relay      │  (read M1/PFC intent,        │  (write A1/V1/S1
     │   tracks sleep stage, gentle      │   read S1/V1/A1 percept     │   percept patterns,
     │   A1 wake at right phase)         │   for closed-loop)          │   amplitude ≤ pillar 4 cap)
     │                                   │                             │
     │                                   └──────► [SYNC] ◄─────────────┘
     │                                       (cloud uplink via hexa-grid;
     └───────────────────────────────────────  model refresh from hexa-codex)
```

- ≤ sopfr = 5 simultaneous high-bandwidth zones (e.g. A1 + V1 + S1 + M1 + PFC)
  — beyond that the read-frame budget (200 Hz, τ=4 phases) saturates.
- Closed-loop discipline: every INJECT to S1/A1/V1 is followed within ≤ sopfr ms
  by a SENSE read of that zone (did the percept land?) — the φ=2 loop.
- Loss of safety budget (pillar 4 trips) → INJECT amplitude clamps → if still
  over budget, drop to SENSE-only, then SLEEP (fail-safe).

---

## §6 VERIFY (what `verify/*.hexa` checks here)

| Tier | Script | Checks |
|------|--------|--------|
| T1 | `verify/calc_cortex.hexa` | σ=12 zones enumerated; τ=4 modes; τ=4 layers tapped of n=6; φ=2 directions; sopfr=5 ms / ≤5 zones; J₂=24 ch/macro-tile; σ·τ=48 (K-class px); n^τ=1296 — integer arithmetic + the 18→0 wearable map (count of replaced wearables ≥ 18, count of clips = φ=2) |
| T2 | `verify/numerics_cortex.hexa` | math_pure: channel-count comparisons (144-ch tile vs 22-electrode cochlear; 1296 ch vs 60-electrode Argus/Orion; tiled S1 vs ICMS ch); information-rate bound (Shannon C for the read channel given the pillar-2 SNR estimate); 200 Hz read rate from 1/(sopfr ms); ≤5-zone saturation arithmetic |
| T3 | `verify/numerics_cortex_parity.hexa` | parity vs published: cochlear-implant electrode/effective-channel counts (Clark 1978, Cochlear Nucleus series); Argus II (60, 6×10) + Orion (60) effective acuity ≈ 20/1260; Flesher 2016 S1 ICMS localized-touch channels; BrainGate handwriting 90 cpm (Willett 2021); speech BCI 62–78 wpm (Willett 2023, Metzger 2023); cursor 4 bit/s (Pandarinath 2017); 7-DOF arm (Wodlinger 2015) — the claimed cortical I/O sits *above* the replaced-wearable bar in channel count and *near or above* the best demonstrated cortical bar in read WPM |

`verify/cross_doc_audit.hexa` checks the σ=12 zone list, the 18→0 wearable map,
the J₂=24 / 1296 / 48 K tokens, and the cross-links (hexa-brain / hexa-mind /
hexa-senses) match `.roadmap.hexa_aura` and the other pillars.

**Not verified** (raw#10 C3): a new non-invasive cortical recording or
stimulation experiment; *perceived* audio intelligibility / AR image quality /
touch realism; the decode ML models (→ `hexa-mind`); any clinical outcome.
Those are §A.6 Stage-1+ and the sibling repos.

---

## §7 EVOLVE

- **v1.1.0** — `hexa-brain` cross-verify: import its working EEG/BMI pipeline's
  decode-accuracy numbers and re-run `numerics_cortex.hexa` with measured
  decode rates instead of the published-literature ladder.
- **v1.2.0** — per-zone bandwidth budget spec (`cortex/doc/zone_budgets.md`):
  how many macro-tiles each of the σ=12 zones gets, and what perceptual rate
  that buys, with the F-AURA-3 sub-IDs as the acceptance criteria.
- **Stage-1+ (§A.6)** — neuron-population response FEM (the cortical-response
  half of the §A.6.1 stage-B FEM); then phantom → NHP read/write
  characterization per zone; then first-in-human (likely starting with A1 for
  hearing restoration — the most mature analog via cochlear implants).
- The motor lane (M1 read + S1 proprioception write for prosthetics) may split
  out to `hexa-brain` entirely — pending decision in `.roadmap.hexa_aura §A.5`.

---

## §8 Honest scope (raw#10 C3)

`HEXA-CORTICAL-IF` is a **cortical-I/O substrate spec**: which σ=12 zones the
coil targets, in which φ=2 directions, on which τ=4 cycle, at which sopfr=5 ms
latency, and *which 18 wearables that replaces*. It does **not** demonstrate: a
new non-invasive cortical read or write; perceived audio/visual/haptic quality;
the decode ML stack (→ `hexa-mind` / `hexa-codex` / `hexa-brain`); the sensory
*application* verbs (→ `hexa-senses`); the cognitive verbs (→ `hexa-mind`); or
any clinical result. `verify/calc_cortex.hexa` + `numerics_cortex.hexa` +
`numerics_cortex_parity.hexa` PASS = the *zone/mode/channel arithmetic closes,
the 18→0 map is consistent, and the claimed channel counts sit above the
replaced-wearable bar while the read WPM sits near/above the best published
cortical interfaces* — nothing more.

F-AURA-3 (3a/3b/3c/3d) remains **OPEN**.
