# Oasis Infobyte Internship — Security Analyst

## About

This repository contains my Security Analyst internship task submissions for Oasis Infobyte. The tasks cover network scanning, firewall configuration, network security threats, social engineering attacks, and patch management.

## Tasks

- **Task 1:** Basic Network Scanning with Nmap
- **Task 2:** Basic Firewall Configuration with UFW
- **Task 4:** Research Report — Common Network Security Threats
- **Task 5:** Research Report — Social Engineering Attacks
- **Task 6:** Research Report — Importance of Patch Management

---

# Task 1: Basic Network Scanning with Nmap

## Objective

To perform network scans, identify open ports and services, and explore operating-system detection using Nmap in authorized local environments.

## What Is Nmap?

Nmap (Network Mapper) is an open-source network scanning tool used to discover hosts, identify open ports, detect running services, and estimate operating systems.

Network scanning helps administrators understand which services are accessible and identify areas that may require security improvements. The results can help identify unnecessary exposed services and support defensive security practices.

Scanning should only be performed on systems you own or have explicit permission to test.

## Environment

### Windows Environment

- Operating System: Windows 11
- Nmap Version: 7.99.1
- Target: `127.0.0.1` (localhost)

### Ubuntu WSL Environment

- Operating System: Ubuntu 22.04 on Windows Subsystem for Linux (WSL)
- Nmap Version: 7.80
- Target: `127.0.0.1` (localhost)

## Nmap Installation

For Windows, Nmap was installed using the official installer available from the [Nmap Downloads page](https://nmap.org/download.html).

For Ubuntu 22.04 on WSL, Nmap was installed using the Ubuntu package manager.

Installation was verified using:

```bash
nmap --version
```

## Commands Used

### 1. Verify Nmap Installation

```bash
nmap --version
```

### 2. Perform a Basic Scan

```bash
nmap 127.0.0.1
```

### 3. Save Basic Scan Results

```bash
nmap 127.0.0.1 -oN nmap_basic_scan.txt
```

### 4. Detect Service Versions and Save Results

```bash
nmap -sV 127.0.0.1 -oN nmap_scan_results.txt
```

### 5. Perform OS Detection and Save Results

On Ubuntu WSL, OS detection was performed with elevated privileges:

```bash
sudo nmap -O 127.0.0.1 -oN nmap_os_detection.txt
```

**Note:** Scan results can vary depending on the environment and the services running at the time of scanning.

## Windows Scan Results

The Windows scan results recorded during the practical exercise reported the following ports:

| Port | Service Reported by Nmap | Purpose and Security Consideration |
|---|---|---|
| 135/tcp | MSRPC | Used by Windows Remote Procedure Call services. Restrict unnecessary network access. |
| 445/tcp | Microsoft-DS | Commonly associated with Windows SMB file and printer sharing. Keep systems updated and restrict access using firewall rules. |
| 3306/tcp | MySQL | Commonly used for MySQL database connections. Restrict access to trusted clients and use strong authentication. |
| 6646/tcp | Unknown | Reported as open in the recorded basic scan. The application or service requires further identification. |

The recorded service-version scan identified Microsoft Windows RPC on port 135 and MySQL 8.0.33 on port 3306. Port 445 was reported as `microsoft-ds?`, indicating uncertain service identification.

The recorded OS detection results initially suggested Microsoft Windows 11, with an estimated version range of Windows 11 24H2–25H2. The same set of observations also included port 8090/tcp, labelled `opsmessaging`. This port should be verified against the original scan output before drawing conclusions.

## Ubuntu WSL Scan Results

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

## Security Observations

- An open port indicates that a service may be listening; it does not automatically mean the system is vulnerable.
- Closed ports indicate that no service was accepting connections on those scanned TCP ports at the time of the scan.
- Unnecessary services should be disabled where appropriate.
- Firewall rules should restrict services that do not need to be reachable from other devices.
- Database services should use strong authentication and appropriate access controls.
- Unknown or uncertain service labels should be investigated before deciding whether a service is safe or vulnerable.
- OS detection is an estimate and may not always identify the exact operating system.

## Output Files

- `nmap_basic_scan.txt` — saved basic scan output.
- `nmap_scan_results.txt` — saved service-version scan output.
- `nmap_os_detection.txt` — saved OS detection output.
- `nmap_os_detection_screenshot.png` — OS detection screenshot.
- `nmap_scan_screenshot.png.png` — scan screenshot.

**Practical demonstration video:** Pending. It will be added after recording and uploading the demonstration.

## Ethical Use

The scans were performed against `127.0.0.1`, the loopback address, in local environments. Scanning systems other than those you own requires explicit authorization.

This task is intended for educational and defensive security analysis.

---

# Task 2: Basic Firewall Configuration with UFW

## Objective

To configure a basic Linux firewall using UFW (Uncomplicated Firewall), apply rules to allow and deny specific network traffic, and verify the firewall configuration.

## What Is UFW?

UFW is a firewall management tool for Linux that simplifies the process of configuring network traffic rules. It helps administrators control incoming and outgoing connections using port numbers, protocols, and source addresses.

## Environment and Tools

- Operating System: Ubuntu 22.04 on Windows Subsystem for Linux (WSL)
- Firewall: UFW (Uncomplicated Firewall)
- Web server used for testing: Nginx
- Connectivity testing tools: `curl` and Netcat

## Firewall Configuration

UFW was enabled and configured with the following incoming rules:

| Port | Protocol | Action | Purpose |
|---|---|---|---|
| 22 | TCP | Allow | Permits SSH traffic when remote administration is required. |
| 443 | TCP | Allow | Permits incoming HTTPS traffic. |
| 80 | TCP | Deny | Blocks incoming HTTP traffic. |
| 8080 | TCP | Deny | Blocks incoming traffic on an additional commonly used web application port. |

The rules were verified for both IPv4 and IPv6. UFW reported the following default policies:

- Incoming traffic: Denied by default
- Outgoing traffic: Allowed by default
- Routed traffic: Disabled by default

## Commands Used

### 1. Install UFW

```bash
sudo apt update
sudo apt install ufw -y
```

### 2. Configure the Firewall Rules

```bash
sudo ufw allow 22/tcp
sudo ufw deny 80/tcp
sudo ufw allow 443/tcp
sudo ufw deny 8080/tcp
```

### 3. Enable UFW

```bash
sudo ufw enable
```

### 4. Verify the Configuration

```bash
sudo ufw status verbose
sudo ufw status numbered
```

The firewall status showed that UFW was active and the configured rules were present.

## Automated Firewall Configuration Script

The `ufw_configuration.sh` script automates the application of the firewall rules and displays the final firewall status.

The script contains the following commands:

```bash
#!/bin/bash

# UFW Firewall Configuration
set -e

sudo ufw allow 22/tcp
sudo ufw deny 80/tcp
sudo ufw allow 443/tcp
sudo ufw deny 8080/tcp

sudo ufw --force enable
sudo ufw status verbose
```

To run the script:

```bash
chmod +x ufw_configuration.sh
./ufw_configuration.sh
```

The script reported that UFW was active and displayed the configured rules. Messages indicating that an existing rule was skipped mean that the rule was already present.

**Important:** Review the SSH rule and your access requirements before enabling a firewall on a remotely accessed machine. This configuration is intended for the local WSL lab environment.

## Testing and Verification

### Firewall status verification

The command below was used to verify the firewall status and rules:

```bash
sudo ufw status numbered
```

The output showed:

- Port 22/tcp — `ALLOW IN`
- Port 443/tcp — `ALLOW IN`
- Port 80/tcp — `DENY IN`
- Port 8080/tcp — `DENY IN`

Corresponding IPv6 rules were also displayed.

### HTTP connectivity test

An initial test using Netcat and `curl` failed to connect to port 80 because no service was listening at that time. This initial failure alone did not prove that the firewall had blocked the connection.

Nginx was subsequently started:

```bash
sudo systemctl start nginx
```

The following command then returned the Nginx welcome page:

```bash
curl --max-time 5 http://127.0.0.1/
```

This confirmed that the local HTTP service was reachable from the test environment after Nginx started. It did not, by itself, prove that UFW blocked HTTP traffic from an external machine.

A separate test from an applicable external source would be required to conclusively demonstrate the effect of the deny rule. WSL networking can affect how host and guest traffic interact, so results should be interpreted in the context of the test environment.

## Why These Rules Were Chosen

- **Allow SSH (22):** Supports remote administration when SSH access is required.
- **Deny HTTP (80):** Blocks incoming unencrypted web traffic.
- **Allow HTTPS (443):** Permits encrypted web traffic.
- **Deny port 8080:** Blocks an additional port commonly used by web applications and development servers.

These rules demonstrate the principle of restricting unnecessary incoming connections while allowing selected services. A production firewall should permit only the services and source addresses that are genuinely required.

## Task 2 Output Files

- `ufw_configuration.sh` — script for applying the firewall rules.
- `ufw_firewall_status.png` — screenshot showing the firewall status and rules.
- `ufw_rules.txt` — saved firewall rules.

**Practical demonstration video:** Pending. It will be recorded and added after the remaining task documentation is complete.

## Result

UFW was enabled successfully, and the configured IPv4 and IPv6 rules were verified. The practical exercise demonstrated firewall activation, rule management, automation with a Bash script, and local HTTP connectivity testing.

---

# Task 4: Common Network Security Threats

The report covers Denial-of-Service (DoS/DDoS), Man-in-the-Middle (MITM), IP spoofing, DNS spoofing, real-world examples, mitigation strategies, and key takeaways.

**Report:** `network_security_threats_report.md`

---

# Task 5: Social Engineering Attacks

The report covers phishing, pretexting, baiting, prevention strategies, awareness practices, and comparisons of social engineering techniques.

**Report:** `social_engineering_report.md`

---

# Task 6: Importance of Patch Management

The report covers vulnerability management, security updates, real-world incidents, the patch management lifecycle, an implementation checklist, and common challenges.

**Report:** `patch_management_report.md`

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
├── ufw_configuration.sh
├── ufw_firewall_status.png
├── ufw_rules.txt
├── network_security_threats_report.md
├── social_engineering_report.md
└── patch_management_report.md
```

The practical demonstration videos for the hands-on tasks will be added to the repository after they are recorded and uploaded.

## Conclusion

These tasks provided practical exposure to basic network scanning, Linux firewall configuration, common cybersecurity threats, social engineering techniques, and the importance of timely security updates.

The work emphasizes authorized testing, careful interpretation of technical results, firewall rule verification, and defensive security practices.
