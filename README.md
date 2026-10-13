# Oasis Infobyte Internship — Security Analyst

## About
This repository contains my Security Analyst internship task submissions for Oasis Infobyte.

## Tasks
- Task 1: Basic Network Scanning with Nmap
- Task 4: Research Report — Common Network Security Threats
- Task 5: Research Report — Social Engineering Attacks
- Task 6: Research Report — Importance of Patch Management

## Ethical Use
All practical security testing will be performed only in authorized lab environments or on systems for which I have explicit permission.

### Task 1: Basic Network Scanning with Nmap

**Objective:** Identify open ports and services on my own computer using Nmap.

**Environment:** Windows 11, Nmap 7.99

**Target:** `127.0.0.1` (localhost)

**Commands used:**
- `nmap --version` — verified Nmap installation.
- `nmap 127.0.0.1` — performed a basic scan.
- `nmap -sV 127.0.0.1 -oN nmap_scan_results.txt` — detected service versions and saved the output.

**Observed results:**
- `135/tcp` — MSRPC
- `445/tcp` — Microsoft-DS
- `3306/tcp` — MySQL 8.0.33

**Security observation:** Open ports may indicate services listening on the machine. Each service should be reviewed to confirm it is necessary and securely configured. An open port alone does not prove a vulnerability.

**Output file:** `nmap_scan_results.txt`

**Ethical use:** The scan was limited to my own computer using localhost.

## Submission
Task reports, supporting files, and screenshots will be organized in this repository.
