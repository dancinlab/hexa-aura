# TODO — hexa-aura

`v0.1.0` ships as a thin bundle of 11 BCI / post-aural canon docs
(see [README.md](README.md#docs)). This TODO tracks two follow-ups.

---

## §1 Canon restoration (5 historical docs)

5 of 11 bundled docs are intentionally extracted from older canon
SHAs because a 2026-Q1 canonical-format migration trimmed the bodies
significantly while modernising the frontmatter:

| doc                          | current lines | historical max | source SHA  | growth |
| ---------------------------- | ------------: | -------------: | ----------- | -----: |
| `neuro`                      |           616 |       **1854** | `579ab196`  |  3.0×  |
| `brain-computer-interface`   |           717 |        **962** | `ab155706`  |  1.3×  |
| `hexa-ear`                   |           717 |        **856** | `579ab196`  |  1.2×  |
| `hexa-speak`                 |           787 |        **932** | `ab155706`  |  1.2×  |
| `hexa-dream`                 |           717 |        **806** | `579ab196`  |  1.1×  |

The richer Korean bodies contain the load-bearing concept material
(측두골 클립 / 18개 웨어러블 대체 / RT-SC 나노코일 / 25 카테고리 EXACT
검증 등). The current canon versions retain the modernised frontmatter
(`gold-standard: shared/harness/sample.md`, English-only titles) but
lost that content.

### Options for canon-side restoration (not yet decided)

- [ ] **Option A — Hybrid restore**: keep current frontmatter, replace
      `body` with historical Korean body. Preserves canon-harness
      compatibility AND recovers content. ~5 files × manual merge.
- [ ] **Option B — Schema extension**: extend `standalone_seeds.tsv` to
      support `canonical_sha` per row, allowing pre-migration historical
      pinning natively. Bigger change but proper.
- [ ] **Option C — Status quo**: leave canon as-is, document the drift
      in registry. Already in effect at `v0.1.0`.

This decision is owner-pending — flag in the next n6-canon planning
session.

---

## §2 v1.0.0 — Full 13-verb n=6 HEXA-template author

Each new verb = a new canon spec doc following the gold-standard n=6
HEXA template (§WHY / §COMPARE / §REQUIRES / §STRUCT / §FLOW / §EVOLVE /
§VERIFY with stdlib Python verification, ~450–800 lines).

### Hardware (3)

- [ ] `mastoid-clip`         — 측두골 클립 form-factor + bone-conduction anchor
- [ ] `rt-sc-nanocoil`       — room-temp SC coil (σ²=144ch/tile)
- [ ] `temporal-cortex-map`  — 측두엽 (auditory/language) topology

### Decoder stack (3)

- [ ] `subvocal-decoder`     — silent-speech motor cortex decoder
- [ ] `dream-replay`         — REM cortex sampling / replay
- [ ] `emotion-bridge`       — amygdala/PFC φ=2 bidirectional

### Stimulator stack (3)

- [ ] `auditory-injection`   — A1 cortex direct injection (replaces earbuds)
- [ ] `visual-injection`     — V1–V6 direct (replaces AR/VR glasses)
- [ ] `somatosensory-haptic` — S1 cortex haptic (replaces e-skin)

### Safety / certification (4)

- [ ] `cortical-safety`      — current density + MRI compat + heating
- [ ] `eeg-watchdog`         — onboard seizure / abnormal rhythm guard
- [ ] `regulatory-medical`   — FDA / KFDA class III pathway
- [ ] `surgical-zero`        — no-craniotomy / external-only protocol

---

## §3 Cross-link policy (raw#10)

Do NOT re-implement these; call sibling CLI directly:

| concern                         | sibling CLI                |
| ------------------------------- | -------------------------- |
| decoder model serving           | `hexa-codex serve`         |
| neuromorphic silicon            | `hexa-chip neuromorphic`   |
| 5G/6G uplink                    | `hexa-grid v2x`            |

---

## §4 Authoring workflow (when v1.0.0 starts)

1. For each verb, create `canon/domains/cognitive/<verb>/<verb>.md`
   using the gold-standard n=6 HEXA template (450 lines).
2. Append entry to `canon/tools/standalone_seeds.tsv` with
   `(hexa-aura, ✨, <oneliner>, <canonical>, docs/<verb>.md)`.
3. Copy canonical → `~/core/hexa-aura/docs/<verb>.md`.
4. Run `python3` md5 update OR `hexa run canon/tools/build_registry.hexa`
   (after the env-override patch lands).
5. Bump `hexa.toml` version → `1.0.0`, `verdict` → `SPEC_FIRST`.
6. Commit + push both repos.
