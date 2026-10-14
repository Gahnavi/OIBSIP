# Oasis Infobyte Internship — Security Analyst

## About

This repository contains my Security Analyst internship task submissions for Oasis Infobyte. The tasks cover network scanning, firewall configuration, SQL injection testing in a local vulnerable web application, network security threats, social engineering attacks, and patch management.

The practical tasks were performed in local lab environments for educational and defensive security purposes.

## Tasks

- **Task 1:** Basic Network Scanning with Nmap
- **Task 2:** Basic Firewall Configuration with UFW
- **Task 3:** SQL Injection on DVWA (Low Security)
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

**Practical demonstration video:** Pending.

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
| 80 | TCP | Deny | Denies incoming HTTP traffic according to the configured rule. |
| 8080 | TCP | Deny | Denies incoming traffic on an additional commonly used web application port. |

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

### Firewall Status Verification

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

### HTTP Connectivity Test

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
- **Deny HTTP (80):** Denies incoming HTTP traffic under the configured rule.
- **Allow HTTPS (443):** Permits encrypted web traffic.
- **Deny port 8080:** Denies incoming traffic on a commonly used web application port.

These rules demonstrate the principle of restricting unnecessary incoming connections while allowing selected services. A production firewall should permit only the services and source addresses that are genuinely required.

## Task 2 Output Files

- `ufw_configuration.sh` — script for applying the firewall rules.
- `ufw_firewall_status.png` — screenshot showing the firewall status and rules.
- `ufw_rules.txt` — saved firewall rules.

**Practical demonstration video:** Pending.

## Result

UFW was enabled successfully, and the configured IPv4 and IPv6 rules were verified. The practical exercise demonstrated firewall activation, rule management, automation with a Bash script, and local HTTP connectivity testing.

---

# Task 3: SQL Injection on DVWA (Low Security)

## Objective

To demonstrate a classic SQL injection vulnerability in Damn Vulnerable Web Application (DVWA) at Low security level, observe the results, and document methods to prevent SQL injection.

## What Is SQL Injection?

SQL injection (SQLi) is a web application vulnerability that occurs when untrusted input is incorporated into a database query without proper separation between data and SQL instructions.

An attacker may be able to change the meaning of a query, retrieve records that should not be displayed, or bypass intended application logic.

DVWA provides a deliberately vulnerable environment for learning how these vulnerabilities work and how to prevent them.

## Environment and Tools

- Operating System: Windows 11
- Web server and PHP environment: XAMPP
- Vulnerable application: Damn Vulnerable Web Application (DVWA)
- Application URL: `http://localhost:8081/DVWA/`
- Test module: SQL Injection
- Security level: Low
- Test scope: Local DVWA installation

## Setup and Configuration

1. Installed XAMPP and started the Apache and MySQL services.
2. Placed the DVWA application files in `C:\xampp\htdocs\DVWA`.
3. Opened the application locally using `http://localhost:8081/DVWA/`.
4. Configured and initialized the DVWA database.
5. Selected the Low security level from the DVWA Security settings.
6. Opened the SQL Injection module to test normal input and SQL injection payloads.

The non-default Apache port `8081` was used because port `80` was already occupied in the local Windows/WSL environment.

## Test 1: Normal Input

**Input:** `2`

### Observed Result

The application returned one matching record:

- ID: 2
- First name: Gordon
- Surname: Brown

This established the baseline behavior for a normal user ID input.

**Screenshot:** `sqli_normal_input.png`

## Test 2: Classic SQL Injection

**Payload:**

```sql
' OR '1'='1
```

### Explanation

The condition `'1'='1'` is always true. In a vulnerable query, the injected `OR` condition can change the logic of the original SQL statement and cause multiple records to be returned rather than only the requested ID.

### Observed Result

The application displayed multiple records, including:

- Admin — Admin
- Gordon — Brown
- Hack — Me
- Pablo — Picasso
- Bob — Smith

This demonstrated that the input changed the query behavior and returned records beyond the single record expected from a normal ID lookup.

**Screenshot:** `sqli_payload1_result.png`

## Test 3: SQL Injection with a SQL Comment

**Payload:**

```sql
' OR '1'='1' #
```

### Explanation

In the tested MySQL/MariaDB-compatible context, `#` starts a SQL comment. It can cause the remainder of the query line to be ignored. When the input is inserted unsafely into a query, the combination of the always-true condition and comment can change the query's behavior.

### Observed Result

The application again displayed multiple user records instead of a single record.

**Screenshot:** `sqli_payload2_result.png`

## Results Summary

| Test | Input | Observed Result |
|---|---|---|
| Normal input | `2` | One matching record was displayed: Gordon Brown. |
| SQL injection payload 1 | `' OR '1'='1` | Multiple user records were displayed. |
| SQL injection payload 2 | `' OR '1'='1' #` | Multiple user records were displayed. |

The results demonstrate that the DVWA SQL Injection module at Low security level was vulnerable to the tested inputs.

## Why the Vulnerability Occurs

The vulnerability occurs when application input is treated as part of an SQL command instead of being handled strictly as data.

For example, a vulnerable application might construct a query by concatenating user input into a SQL string. An input containing SQL syntax may then change the query's conditions.

The observed DVWA behavior demonstrates why SQL queries must be designed to keep user-supplied values separate from executable SQL instructions.

## Prevention Methods

### 1. Use Parameterized Queries and Prepared Statements

Use prepared statements so user input is passed as a parameter rather than concatenated into SQL code.

Example using PHP PDO:

```php
$stmt = $pdo->prepare(
    "SELECT first_name, last_name FROM users WHERE user_id = :id"
);

$stmt->execute(['id' => $userId]);

$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
```

This approach separates the query structure from the supplied value.

### 2. Validate Input

Validate input according to the expected type and format. For example, a numeric user ID should be checked as a valid integer.

Input validation is an additional safeguard, not a replacement for parameterized queries.

### 3. Apply Least-Privilege Database Permissions

The application database account should have only the permissions required for its functions. Avoid using an unnecessarily privileged database account for routine application queries.

### 4. Handle Errors Safely

Do not expose database errors, SQL statements, or sensitive implementation details to end users. Log diagnostic information securely for authorized administrators.

### 5. Perform Security Testing

Test applications in an authorized environment, review database query construction, and use security testing tools to identify and fix vulnerabilities before deployment.

## Task 3 Output Files

- `sql_injection_notes.md` — payload log, explanations, observations, and prevention notes.
- `sqli_normal_input.png` — screenshot of the normal input result.
- `sqli_payload1_result.png` — screenshot of the first SQL injection result.
- `sqli_payload2_result.png` — screenshot of the second SQL injection result.

**Practical demonstration video:** Pending.

## Result

The SQL Injection module in the local DVWA application was tested at Low security level. Normal input returned one matching record, while both tested SQL injection payloads returned multiple records. The exercise demonstrated how unsafe SQL query construction can expose unintended database results and why parameterized queries are important for prevention.

**Safety note:** DVWA is intentionally vulnerable and should remain confined to a local or otherwise isolated, authorized lab environment. Do not expose this installation to the public internet.

---

# Task 4: Common Network Security Threats

## Objective

To research common network security threats, understand their impact, and identify mitigation strategies.

The report covers:

- Denial-of-Service (DoS) and Distributed Denial-of-Service (DDoS)
- Man-in-the-Middle (MITM) attacks
- IP spoofing
- DNS spoofing
- Real-world examples
- Mitigation strategies
- Key takeaways

## Report

`network_security_threats_report.md`

The report summarizes the threats, their potential impact, and defensive measures that organizations can use to improve network security.

---

# Task 5: Social Engineering Attacks

## Objective

To understand social engineering techniques and identify ways to reduce the risk of human-targeted cyberattacks.

The report covers:

- Phishing
- Pretexting
- Baiting
- Prevention strategies
- Security awareness practices
- Comparison of social engineering techniques

## Report

`social_engineering_report.md`

The report highlights the importance of user awareness, verification of suspicious requests, and safe handling of links, attachments, credentials, and sensitive information.

---

# Task 6: Importance of Patch Management

## Objective

To understand the importance of patch management in maintaining secure systems and reducing exposure to known vulnerabilities.

The report covers:

- Vulnerability management
- Security updates
- Real-world incidents
- The patch management lifecycle
- An implementation checklist
- Common challenges

## Report

`patch_management_report.md`

The report explains how identifying, prioritizing, testing, deploying, and verifying security patches can help organizations reduce risk and maintain more secure systems.

---

# Repository Structure

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
├── sql_injection_notes.md
├── sqli_normal_input.png
├── sqli_payload1_result.png
├── sqli_payload2_result.png
├── network_security_threats_report.md
├── social_engineering_report.md
└── patch_management_report.md
```

## Demonstration Videos

Practical demonstration videos for the hands-on tasks will be recorded and added after the task documentation is complete.

- Task 1 — Nmap network scanning: Pending
- Task 2 — UFW firewall configuration: Pending
- Task 3 — SQL injection in local DVWA: Pending

---

# Key Learnings

Through these tasks, I gained exposure to:

- Network scanning and interpretation of open and closed ports using Nmap.
- Basic firewall configuration and rule verification using UFW.
- SQL injection testing in an intentionally vulnerable local web application.
- The importance of prepared statements and parameterized queries.
- Common network security threats and their mitigation.
- Social engineering techniques and security awareness.
- The role of patch management in reducing security risks.
- Ethical testing, documentation, and defensive security practices.

# Conclusion

These tasks provided practical and research-based exposure to important cybersecurity concepts, including network scanning, firewall configuration, SQL injection, common network threats, social engineering, and patch management.

The work emphasizes authorized testing, careful interpretation of technical results, secure database query design, firewall rule verification, and defensive security practices.

The hands-on exercises and research reports form a foundation for continued learning in cybersecurity and security analysis.
