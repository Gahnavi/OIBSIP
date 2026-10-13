# Task 4: Common Network Security Threats

## 1. Introduction

Network security protects computer networks, devices, and data from unauthorized access, misuse, and disruption. Common threats include Denial of Service (DoS/DDoS), Man-in-the-Middle (MITM), IP spoofing, and DNS spoofing. Understanding these threats helps organizations choose suitable security controls.

## 2. Denial of Service (DoS) and Distributed Denial of Service (DDoS)

### Description
A DoS attack attempts to make a service unavailable by overwhelming it with traffic or requests. A DDoS attack uses multiple compromised devices to send traffic to a target.

### Real-world example
In October 2016, the Mirai botnet was used in a major DDoS attack against DNS provider Dyn. The disruption affected access to multiple popular websites and online services.

### Impact
- Websites and applications may become unavailable.
- Organizations may lose revenue and customer trust.
- IT teams may need to spend time and money restoring services.

### Mitigation
1. Use DDoS protection services and traffic filtering.
2. Monitor network traffic and configure rate limiting.
3. Prepare an incident response and service recovery plan.

## 3. Man-in-the-Middle (MITM) Attacks

### Description
A MITM attack occurs when an attacker secretly intercepts or alters communication between two parties.

### Real-world context
Public Wi-Fi networks can expose users to interception risks when connections are not properly protected. Attackers may attempt to capture information or redirect users to fraudulent websites.

### Impact
- Sensitive information may be exposed.
- Login credentials or session tokens may be stolen.
- Communication may be modified without the parties noticing.

### Mitigation
1. Use HTTPS and valid TLS certificates.
2. Avoid sensitive activities on untrusted networks; use an approved VPN when appropriate.
3. Enable multifactor authentication and keep devices updated.

## 4. IP Spoofing

### Description
IP spoofing is the creation of IP packets with a forged source address. It can be used to disguise traffic origins or support other attacks, including some denial-of-service attacks.

### Real-world context
Source-address spoofing has been used in reflection and amplification DDoS attacks, where attackers send requests with a victim's forged IP address so that responses are directed to the victim.

### Impact
- It can make traffic attribution more difficult.
- It may help attackers conduct reflection attacks.
- It can undermine network trust when filtering is weak.

### Mitigation
1. Apply ingress and egress filtering to block traffic with invalid source addresses.
2. Use network monitoring to identify unusual traffic patterns.
3. Deploy DDoS defenses and follow secure router configuration practices.

## 5. DNS Spoofing (Additional Threat)

### Description
DNS spoofing involves providing false DNS information so that a user is directed to an incorrect or malicious destination.

### Impact
- Users may reach fraudulent websites.
- Credentials and personal information may be exposed.
- Organizations may experience service disruption or reputational damage.

### Mitigation
1. Use DNS security measures such as DNSSEC validation where supported.
2. Keep DNS servers and network devices patched and securely configured.
3. Use HTTPS and verify website certificates.

## 6. Threat Comparison

| Threat | Main Goal | Possible Impact | Key Mitigation |

| DoS/DDoS | Disrupt availability | Service outage | DDoS protection and traffic filtering |
| MITM | Intercept communication | Data or credential theft | HTTPS/TLS and secure authentication |
| IP spoofing | Forge source IP addresses | Reflection attacks, harder attribution | Ingress/egress filtering |
| DNS spoofing | Redirect users to false destinations | Phishing and traffic redirection | DNSSEC validation and secure DNS |

## 7. Key Takeaways

1. Network security requires layered controls rather than relying on one defense.
2. Monitoring, patching, secure configurations, and incident response reduce risk.
3. Users and organizations should verify connections and use secure authentication practices.

## 8. References

1. CISA — Understanding and Responding to Distributed Denial-of-Service Attacks: https://www.cisa.gov/news-events/news/understanding-and-responding-distributed-denial-service-attacks
2. Cloudflare Learning Center — What Is a DDoS Attack?: https://www.cloudflare.com/learning/ddos/what-is-a-ddos-attack/
3. Cloudflare Learning Center — What Is a Man-in-the-Middle Attack?: https://www.cloudflare.com/learning/security/threats/man-in-the-middle-attack/
4. RFC 3704 — Ingress Filtering for Multihomed Networks: https://www.rfc-editor.org/rfc/rfc3704
5. ICANN — DNSSEC: https://www.icann.org/resources/pages/dnssec-what-is-it-2019-03-05-en
