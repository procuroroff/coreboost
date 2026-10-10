# CoreBoost

> **Low-Level Linux Kernel Power, RAPL, and Frequency Governor**  
> Tailored for Intel Alder Lake-N (N95/N100/N200/N305) & Intel UHD Graphics architectures under Linux `sysfs` & `intel_pstate`.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  COREBOOST v2.5 // LOW-LEVEL KERNEL FREQUENCY & POWER TUNER                 │
│  PLATFORM: Intel Alder Lake-N (Intel N95 4C/4T) | GPU: Intel UHD Graphics   │
│  SUBSYSTEM: intel_pstate / RAPL powercap / i915 / sysctl scheduler          │
└─────────────────────────────────────────────────────────────────────────────┘
```

## Features

- **Interactive Terminal UI:** Choose operating profiles using simple numbers (1-5) with real-time status telemetry.
- **Authentic Kernel Logging:** Detailed low-level hardware register outputs showing exact MSR offsets, sysfs nodes, and delta timestamps.
- **Hardware-Level Tuning:**
  - **Intel P-State & EPP:** Energy Performance Preference (`performance`, `balance_performance`, `power`), Dynamic Boost, P-State floors & ceilings.
  - **Intel UHD Graphics (i915):** Control and clamp `gt_min_freq_mhz`, `gt_max_freq_mhz`, and `gt_boost_freq_mhz` to eradicate gaming micro-stutters.
  - **Intel RAPL Power Limits:** Dynamic PL1 (Long Term) and PL2 (Short Burst) power envelope adjustments.
  - **Kernel Latency Optimization:** PCIe ASPM policy, `vm.swappiness`, NMI watchdog suppression, and `split_lock_mitigate` gaming bypass.
- **Persistent Profiles:** Automated `systemd` service preserves the selected profile across reboots.

---

## Profiles

| Profile | CPU Clock & EPP | GPU Clocks | RAPL TDP | Latency / Sysctl |
| :--- | :--- | :--- | :--- | :--- |
| **Extreme Boost** | Floor 100%, EPP: `performance`, Dynamic Boost ON | 1000 - 1200 MHz | PL1: 25W, PL2: 45W | ASPM: perf, Split-lock: bypass, NMI: 0 |
| **Balanced** | Dynamic HWP, EPP: `balance_performance` | 200 - 1200 MHz | PL1: 15W, PL2: 30W | ASPM: default, Swappiness: 60 |
| **Eco / Silent** | Turbo OFF (1.7GHz max), P-State 60%, EPP: `power` | 200 - 600 MHz | PL1: 8W, PL2: 12W | ASPM: powersupersave (Passive cooling) |

---

## Installation

```bash
git clone https://github.com/<your-username>/coreboost.git
cd coreboost
sudo ./install.sh
```

---

## Usage

### Interactive Menu
Simply run:
```bash
coreboost
```

### Direct CLI Commands
```bash
coreboost extreme     # Activate Extreme Boost profile
coreboost balanced    # Activate Balanced profile
coreboost eco         # Activate Silent/Eco profile
coreboost status      # Print live hardware telemetry summary
coreboost monitor     # Continuous real-time sensor stream
```

---

## License
MIT License. See [LICENSE](LICENSE) for details.
