# Oasis Infobyte Internship — Security Analyst

## About

This repository contains my Security Analyst internship task submissions for Oasis Infobyte. The projects cover network scanning, network security threats, social engineering attacks, and patch management.

## Tasks

- **Task 1:** Basic Network Scanning with Nmap
- **Task 4:** Research Report — Common Network Security Threats
- **Task 5:** Research Report — Social Engineering Attacks
- **Task 6:** Research Report — Importance of Patch Management

## Task 1: Basic Network Scanning with Nmap

### Objective

To identify open ports, detect running services, and perform operating-system detection on my own computer using Nmap.

### Environment

- Operating System: Windows 11
- Nmap Version: 7.99.1
- Target: `127.0.0.1` (localhost)

### Nmap Installation

1. Download Nmap from the official website: https://nmap.org/download.html
2. Run the Windows installer and follow the installation instructions.
3. Open Command Prompt and verify the installation:

```bash
nmap --version
```

### Commands Used

**1. Verify Nmap installation**

```bash
nmap --version
```

**2. Perform a basic scan**

```bash
nmap 127.0.0.1
```

**3. Detect service versions and save results**

```bash
nmap -sV 127.0.0.1 -oN nmap_scan_results.txt
```

**4. Perform OS detection and save results**

```bash
nmap -O 127.0.0.1 -oN nmap_os_detection.txt
```

### Scan Results

The basic scan reported the following open ports:

| Port | Service reported by Nmap | Purpose and security consideration |
|---|---|---|
| 135/tcp | MSRPC | Used by Windows Remote Procedure Call services. Restrict unnecessary network access. |
| 445/tcp | Microsoft-DS | Commonly associated with Windows SMB file and printer sharing. Keep systems updated and restrict access using firewall rules. |
| 3306/tcp | MySQL | Commonly used for MySQL database connections. Restrict access to trusted clients and use strong authentication. |
| 6646/tcp | Unknown | Nmap reported this port as open during the basic scan. The application or service has not yet been identified. |

The service-version scan identified Microsoft Windows RPC on port 135 and MySQL 8.0.33 on port 3306. Port 445 was reported as `microsoft-ds?`, indicating that the service identification was uncertain.

The OS detection scan reported port 8090/tcp with the service label `opsmessaging`. This port appeared in the OS detection scan but was not listed in the earlier basic scan.

### OS Detection Results

The command `nmap -O 127.0.0.1` initially reported Microsoft Windows 11, with OS details estimated as Windows 11 24H2–25H2.

In a subsequent saved scan using `nmap -O 127.0.0.1 -oN nmap_os_detection.txt`, Nmap reported:

- Host status: Up
- Network distance: 0 hops
- OS detection: No exact OS match found

The OS version reported by Nmap is an estimate. The saved scan did not produce an exact OS match.

### Security Observations

- An open port indicates that a service may be listening on the machine; it does not automatically mean that the system is vulnerable.
- Unnecessary services should be disabled when appropriate.
- Firewall rules should restrict access to services that do not need to be reachable from other devices.
- Database services should use strong authentication and appropriate access controls.
- The service associated with port 6646 and the application associated with port 8090 require further verification before drawing conclusions.

### Output Files

- `nmap_scan_results.txt` — saved service-version scan output.
- `nmap_os_detection.txt` — saved OS detection scan output.
- Nmap screenshots — terminal screenshots showing scan commands and results.
- Demo video — practical demonstration of the scan commands and findings.

### Ethical Use

All scans in this task were performed against `127.0.0.1`, the loopback address of my own computer. Scanning other systems requires explicit authorization. The purpose of this task is educational and defensive security analysis.

## Task 4: Common Network Security Threats

The report covering Denial-of-Service (DoS/DDoS), Man-in-the-Middle (MITM), IP spoofing, DNS spoofing, real-world examples, mitigation strategies, and key takeaways is available in:

`network_security_threats_report.md`

## Task 5: Social Engineering Attacks

The report covering phishing, pretexting, baiting, prevention strategies, awareness practices, and attack comparisons is available in:

`social_engineering_report.md`

## Task 6: Importance of Patch Management

The report covering vulnerability management, security updates, real-world incidents, patching lifecycle, implementation checklist, and common challenges is available in:

`patch_management_report.md`

## Repository Structure

```text
OIBSIP/
├── README.md
├── nmap_scan_results.txt
├── nmap_os_detection.txt
├── network_security_threats_report.md
├── social_engineering_report.md
├── patch_management_report.md
└── Nmap screenshots and demo video
```

Note: The repository structure above describes the intended organization. Keep only files that have actually been uploaded to the repository, and update screenshot or video filenames to match the actual names.

## Conclusion

These tasks helped me practice basic network scanning, understand common cybersecurity threats, recognize social engineering techniques, and learn the importance of timely security updates.

