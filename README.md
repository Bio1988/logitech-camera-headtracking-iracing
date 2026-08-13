# Logitech Camera Headtracking for iRacing

Open-source webcam head tracking for **iRacing** using a Logitech webcam and **OpenTrack**. This repository is tuned around a **49-inch Samsung Odyssey G9 / G9-class ultrawide** and aims for a simple, low-cost, markerless setup.

## What this setup uses

**Webcam → OpenTrack NeuralNet Tracker → Accela filter → FreeTrack 2.0 Enhanced / TrackIR compatibility → iRacing**

Recommended webcams:

- Logitech C920 / C920e — works well at 30 FPS
- Logitech C922 — preferred budget option because 720p60 is available
- Logitech Brio — use 720p60 first; higher resolutions usually add CPU cost without improving head tracking much
- Logitech StreamCam — use 720p60 or 1080p60 depending on CPU headroom

OpenTrack itself is **not redistributed** in this repository. Download the current official Windows release from the OpenTrack project:

https://github.com/opentrack/opentrack/releases/latest

The profiles and scripts in this repository are intentionally conservative for a 49-inch ultrawide. The default recommendation is **Yaw-only** at first, with optional small Roll later. Translation axes are disabled to avoid a floating cockpit effect.

---

## Quick start

### 1. Mount the webcam

Mount the Logitech webcam as close to the horizontal centerline of the monitor as practical, ideally above the center of the screen.

Good conditions matter more than raw camera resolution:

- face clearly visible
- no strong backlight behind your head
- stable front/side lighting
- avoid camera auto-exposure hunting

### 2. Install OpenTrack

Download and install the latest official OpenTrack Windows release.

As of the profile set in this repository, the tested baseline is **OpenTrack 2026.1.0**.

### 3. Import a profile

Copy one of the files from `profiles/` to your OpenTrack profile directory, or load it from OpenTrack.

Start with:

- `G9-C920-30FPS-YawOnly.ini` for C920/C920e
- `G9-C922-Brio-60FPS-YawOnly.ini` for C922/Brio/StreamCam

Optional profiles with light Roll are provided as well.

### 4. Configure OpenTrack

In OpenTrack:

- **Input:** NeuralNet Tracker
- **Filter:** Accela
- **Output:** FreeTrack 2.0 Enhanced
- Press **Start**

Open the NeuralNet tracker settings and select the correct Logitech camera if more than one camera is present.

For a C920/C920e use 30 FPS. For C922/Brio/StreamCam use 60 FPS where stable.

### 5. Bind a Center button

In OpenTrack go to:

`Options → Shortcuts → Center`

Bind a wheel/button-box button or a keyboard key. Sit naturally, look straight ahead, then press Center.

### 6. Start iRacing after OpenTrack

For best compatibility:

1. Start OpenTrack
2. Press Start in OpenTrack
3. Confirm the virtual head/output values move
4. Launch iRacing
5. Enter a session

You do **not** map head yaw as a normal iRacing controller axis. OpenTrack presents itself through the TrackIR/FreeTrack-compatible path.

---

## Samsung G9 / 49-inch ultrawide recommendations

On a very wide 49-inch display, aggressive head-tracking curves feel unnatural because the screen already covers a large horizontal field of view.

Recommended starting behavior:

| Axis | Recommendation |
|---|---|
| Yaw | Enabled, moderate gain |
| Pitch | Disabled initially |
| Roll | Disabled initially; optional very small amount |
| X | Disabled |
| Y | Disabled |
| Z | Disabled |

The goal is not VR-like 1:1 motion. The goal is to make mirror checks, apex checks and side glances easier without visually detaching your head from the cockpit.

### Practical yaw target

A small real head rotation should produce a larger virtual rotation, but not so much that you need to look away from the display.

A good first target is roughly:

- 10° real head turn → 15–20° virtual
- 20° real head turn → 35–45° virtual
- 30° real head turn → 55–70° virtual

Tune to preference.

---

## iRacing display setup first

Head tracking feels wrong if the monitor geometry/FOV is wrong.

In iRacing configure the display as a curved single monitor and enter the **actual** screen geometry for your specific Samsung G9 model:

- visible screen width
- eye-to-screen distance
- curvature/radius for the exact monitor model

Then let iRacing calculate the FOV.

Do this before judging the head-tracking curves.

---

## If OpenTrack moves but iRacing does not

This is the most common integration problem.

Check in this order:

1. OpenTrack is running before iRacing starts.
2. Input is `NeuralNet Tracker`.
3. Output is `FreeTrack 2.0 Enhanced`.
4. The OpenTrack output head/values move when you turn your head.
5. Restart iRacing completely after OpenTrack is already running.
6. Run both programs at the same privilege level. Avoid running one as Administrator and the other normally.
7. Check `docs/IRACING-TROUBLESHOOTING.md`.

---

## Repository layout

```text
profiles/
  G9-C920-30FPS-YawOnly.ini
  G9-C920-30FPS-Yaw-Roll.ini
  G9-C922-Brio-60FPS-YawOnly.ini
  G9-C922-Brio-60FPS-Yaw-Roll.ini

scripts/
  SETUP_HEADTRACKING.cmd
  START_HEADTRACKING.cmd
  USE_30FPS_PROFILE.cmd
  USE_60FPS_PROFILE.cmd

docs/
  CAMERA-SETUP.md
  G9-TUNING.md
  IRACING-TROUBLESHOOTING.md

LICENSE
SECURITY.md
NOTICE.md
```

---

## Why OpenTrack instead of OpenFOV right now?

OpenFOV is a promising iRacing-specific webcam head-tracking project, but its current public release has documented iRacing connectivity issues on some systems. OpenTrack is more mature and currently the safer baseline for a shareable setup.

OpenFOV may become the cleaner option later, so it is worth revisiting.

---

## Privacy

The NeuralNet tracker runs locally on the PC. This repository does not upload webcam frames or telemetry anywhere.

---

## License and trademarks

The scripts, documentation and configuration files in this repository are released under the MIT License unless otherwise noted.

OpenTrack is a separate project with its own license and copyright holders. It is not bundled here.

Logitech, Samsung, Odyssey G9, iRacing and TrackIR are trademarks of their respective owners. This project is independent and is not affiliated with or endorsed by Logitech, Samsung, iRacing.com Motorsport Simulations, NaturalPoint or the OpenTrack project.
