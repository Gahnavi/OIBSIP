# Oasis Infobyte Internship — Security Analyst

## About

This repository contains my Security Analyst internship task submissions for Oasis Infobyte. The tasks cover network scanning, network security threats, social engineering attacks, and patch management.

## Tasks

- **Task 1:** Basic Network Scanning with Nmap
- **Task 4:** Research Report — Common Network Security Threats
- **Task 5:** Research Report — Social Engineering Attacks
- **Task 6:** Research Report — Importance of Patch Management

---

## Task 1: Basic Network Scanning with Nmap

### Objective

To perform network scans, identify open ports and services, and explore operating-system detection using Nmap in authorized local environments.

### Environment

**Windows environment**
- Operating System: Windows 11
- Nmap Version: 7.99.1
- Target: `127.0.0.1` (localhost)

**Ubuntu WSL environment**
- Operating System: Ubuntu 22.04 on Windows Subsystem for Linux (WSL)
- Nmap Version: 7.80
- Target: `127.0.0.1` (localhost)

### Nmap Installation

For Windows, Nmap was installed using the official installer available at [Nmap Downloads](https://nmap.org/download.html).

For Ubuntu 22.04 on WSL, Nmap was installed using the Ubuntu package manager.

Installation was verified using:

```bash
nmap --version
```

### Commands Used

The following commands were used during the practical exercise.

**1. Verify Nmap installation**

```bash
nmap --version
```

**2. Perform a basic scan**

```bash
nmap 127.0.0.1
```

**3. Save basic scan results**

```bash
nmap 127.0.0.1 -oN nmap_basic_scan.txt
```

**4. Detect service versions and save results**

```bash
nmap -sV 127.0.0.1 -oN nmap_scan_results.txt
```

**5. Perform OS detection and save results**

```bash
sudo nmap -O 127.0.0.1 -oN nmap_os_detection.txt
```

### Windows Scan Results

The Windows scan results recorded during the practical exercise reported the following ports:

| Port | Service reported by Nmap | Purpose and security consideration |
|---|---|---|
| `135/tcp` | MSRPC | Used by Windows Remote Procedure Call services. Restrict unnecessary network access. |
| `445/tcp` | Microsoft-DS | Commonly associated with Windows SMB file and printer sharing. Keep systems updated and restrict access using firewall rules. |
| `3306/tcp` | MySQL | Commonly used for MySQL database connections. Restrict access to trusted clients and use strong authentication. |
| `6646/tcp` | Unknown | Reported as open in the recorded basic scan. The application or service requires further identification. |

The recorded service-version scan identified Microsoft Windows RPC on port 135 and MySQL 8.0.33 on port 3306. Port 445 was reported as `microsoft-ds?`, indicating uncertain service identification.

The recorded OS detection results initially suggested Microsoft Windows 11, with an estimated version range of Windows 11 24H2–25H2. The same set of observations also included port `8090/tcp`, labelled `opsmessaging`. This port should be verified against the original scan output before drawing conclusions.

### Ubuntu WSL Scan Results

In Ubuntu 22.04 on WSL, Nmap 7.80 was used to scan `127.0.0.1`.

The basic scan and service-version scan reported:

- Host status: Up
- All 1,000 scanned TCP ports: Closed
- Service detection: No open services identified in the scanned ports

The saved OS detection scan reported:

- Host status: Up
- Network distance: 0 hops
- OS detection: No exact OS match found

These are the results of the Ubuntu WSL scans and are separate from the Windows scan observations above. Results can differ depending on the environment, running services, and scan conditions.

### Security Observations

- An open port indicates that a service may be listening; it does not automatically mean the system is vulnerable.
- Closed ports indicate that no service was accepting connections on those scanned TCP ports at the time of the scan.
- Unnecessary services should be disabled where appropriate.
- Firewall rules should restrict services that do not need to be reachable from other devices.
- Database services should use strong authentication and appropriate access controls.
- Unknown or uncertain service labels should be investigated before deciding whether a service is safe or vulnerable.
- OS detection is an estimate and may not always identify the exact operating system.

### Output Files

- `nmap_basic_scan.txt` — saved basic scan output.
- `nmap_scan_results.txt` — saved service-version scan output.
- `nmap_os_detection.txt` — saved OS detection output.
- `nmap_os_detection_screenshot.png` — OS detection screenshot.
- `nmap_scan_screenshot.png.png` — scan screenshot.

A practical demonstration video will be added when recording and upload are complete.

### Ethical Use

The scans were performed against `127.0.0.1`, the loopback address, in local environments. Scanning systems other than those you own requires explicit authorization. This task is intended for educational and defensive security analysis.

---

## Task 4: Common Network Security Threats

The report covers Denial-of-Service (DoS/DDoS), Man-in-the-Middle (MITM), IP spoofing, DNS spoofing, real-world examples, mitigation strategies, and key takeaways.

**Report:** [`network_security_threats_report.md`](network_security_threats_report.md)

## Task 5: Social Engineering Attacks

The report covers phishing, pretexting, baiting, prevention strategies, awareness practices, and comparisons of social engineering techniques.

**Report:** [`social_engineering_report.md`](social_engineering_report.md)

## Task 6: Importance of Patch Management

The report covers vulnerability management, security updates, real-world incidents, the patch management lifecycle, an implementation checklist, and common challenges.

**Report:** [`patch_management_report.md`](patch_management_report.md)

---

## Repository Structure

```text
OIBSIP/
├── README.md
├── nmap_basic_scan.txt
├── nmap_scan_results.txt
├── nmap_os_detection.txt
├── nmap_os_detection_screenshot.png
├── nmap_scan_screenshot.png.png
├── network_security_threats_report.md
├── social_engineering_report.md
└── patch_management_report.md
```

The structure above reflects the files currently identified in the repository. Add the demo video to this list after uploading it, using its actual filename.

## Conclusion

These tasks provided practical exposure to basic network scanning and helped build an understanding of common cybersecurity threats, social engineering techniques, and the importance of timely security updates. The work emphasizes authorized testing, careful interpretation of scan results, and defensive security practices.
