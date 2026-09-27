# Walker — Joypads

**What this is.** A Walker copy of Godot's joypads demo: a testing tool that shows, for one selected controller ID, live axis bars, a 21-button grid, a controller diagram with lit indicators, vibration controls, and a remap wizard that generates an SDL-style controller mapping string. It is an input-testing tool, not a game.

**Why it is in Walker.** Walker keeps independent copies of Godot demos as reference evidence for how the engine behaves; this one covers how Godot reports controllers and applies mappings. Its specific purpose in Walker has not been written down yet (open question Q-01 in `design/decisions.md`).

**What was found and verified.** Godot 4.7.2 import/runtime and 13 limited tests pass. No connected joypads were reported. Physical input, vibration and actual remapping remain unverified; both native-4K Liam films pending. See FRICTIONAL.md. The design review also noticed that the button labelled "Set Raw Mapping" removes the current mapping (upstream behavior, left unchanged).

## How to run

Open `godot/project.godot` in Godot 4.7 (verified headless with 4.7.2) and run `joypads.tscn`. Connect a controller for anything beyond the "No controller detected" state. The project defines no keyboard input actions; controllers are read by device index and the UI is mouse-driven.

| Control | Action |
|---|---|
| Device ID spinbox | choose which controller to show |
| Any controller button / stick | lights the matching index, bar and diagram part |
| Start / Stop Vibration | vibrate with the weak, strong and duration values |
| Remap | run the mapping wizard (Previous / Skip / Next; Full axis and Invert Axis options) |
| Set Raw Mapping | removes the current mapping for the selected controller |
| Show | show the last generated mapping string |
| GUID link | opens Godot's game controller database in a browser |

## Design

- [GDD.md](GDD.md): recovered Game Design Document (identical copy of `design/GDD.md`)
- [design/DECK.html](design/DECK.html): review slides
- [design/IMPLEMENTATION-MAP.md](design/IMPLEMENTATION-MAP.md): feature → scene/script/line map
- [design/decisions.md](design/decisions.md): open questions

The GDD was recovered from the code by Walker's Zelda `/gdd reverse` pass in silent mode. It describes what exists and tags every claim as observed, inferred or missing; it is not an approved design, and no design gate is signed.

## Source & license

Independent Godot `misc/joypads` copy at source commit `a3b5c113112f77291d5f3d1360f33a882fdc52f7`. Dana Olson's source attribution, MIT license, original README, assets, UIDs and import settings preserved. Production change: title only.

## Status

- Headless import and 120-frame runtime: exit 0, no observed warnings (`import-20260927.log`, `runtime-20260927.log`).
- `mapping-20260927.log`: connected devices `[]`; 13 checks pass for the absent-device label and dimming and for mapping-string construction. These use constructed mapping objects only: no physical input, no fake device connections, no mapping applied.
- Not verified: physical input, vibration, actual remapping, the wizard UI, controller compatibility, rendered indicators, full three-scene review.
- Pending: both native-4K Liam films, and human review.

Repository: https://github.com/nikbearbrown/walker-misc-joypads
