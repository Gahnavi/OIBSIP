# Task 5: Social Engineering Attacks

## 1. Introduction

Social engineering is a cybersecurity technique in which attackers manipulate people into revealing confidential information, transferring money, or performing unsafe actions. These attacks exploit psychological factors such as trust, urgency, fear, curiosity, and the desire to help others.

Social engineering can affect individuals, businesses, educational institutions, and government organizations. Security awareness, identity verification, multifactor authentication, and clear reporting procedures help reduce the risk.

## 2. Phishing

### Description

Phishing uses fraudulent emails, messages, websites, or phone communications to trick people into revealing credentials, financial information, or other sensitive data.

### Common Types

- **Spear phishing:** A targeted message designed for a particular person or organization.
- **Whaling:** A targeted attack aimed at senior executives or other high-value individuals.
- **Vishing:** Fraudulent attempts made through voice calls.
- **Smishing:** Fraudulent attempts made through SMS or text messages.

### Real-World Case Study: 2016 DNC Email Compromise

In 2016, targeted phishing emails were associated with the compromise of email accounts connected to the Democratic National Committee (DNC). The incident demonstrated how deceptive messages can help attackers obtain account access and sensitive information.

**Impact:**

- Unauthorized access to email accounts.
- Exposure of sensitive communications.
- Reputational damage and loss of trust.

### Prevention

1. Verify unexpected requests through a separate, trusted communication channel.
2. Use multifactor authentication (MFA) and unique passwords.
3. Avoid suspicious links and unexpected attachments.
4. Provide regular phishing-awareness training.

## 3. Pretexting

### Description

Pretexting occurs when an attacker invents a believable story or impersonates a trusted person to persuade someone to disclose information or perform an action. Attackers may impersonate employees, managers, vendors, or IT support personnel.

### Real-World Case Study: MGM Resorts Cyberattack, 2023

In September 2023, MGM Resorts suffered a major cyberattack associated with social engineering. Public reporting described attackers impersonating an employee and contacting the IT help desk to obtain account access. The incident illustrates how an attacker can exploit trust in identity-verification and account-recovery procedures.

**Impact:**

- Disruption to hotel and casino operations.
- Problems affecting customer-facing systems and services.
- Financial losses and incident recovery costs.

### Prevention

1. Never share passwords or authentication codes with callers or messengers.
2. Verify identities using official company procedures before resetting accounts or granting access.
3. Require documented approval and independent verification for sensitive requests.

## 4. Baiting

### Description

Baiting uses something tempting, such as an unknown USB drive, free software, or a promised reward, to persuade a person to perform an unsafe action. The goal may be to install malware, collect information, or gain unauthorized access.

### Real-World Case Study: University of Illinois USB Drop Study, 2015

Researchers conducted a controlled field study at the University of Illinois Urbana-Champaign by placing 297 USB drives around a university campus. The research found that approximately 45% of the drives were connected to a computer, while the overall pickup rate was approximately 98%.

This was a controlled academic experiment, not a criminal attack. It demonstrated that people may connect unknown USB drives because they are curious or want to identify the owner. The findings illustrate how a malicious attacker could exploit the same behavior.

**Impact and risk:**

- Potential malware infection from a malicious device.
- Possible unauthorized access to a computer or network.
- Exposure of sensitive information if a malicious payload executes.

### Mitigation

1. Never connect unknown USB devices to work or personal computers.
2. Download software only from trusted sources and block unauthorized removable media where practical.
3. Use endpoint protection and report unknown devices to the appropriate security team.

## 5. Quid Pro Quo

### Description

Quid pro quo is a social engineering attack in which an attacker offers a supposed benefit or service in exchange for information or access. The attacker may pretend to provide technical support in return for login details or authentication codes.

### Example

A caller offers to fix a user's computer problem but asks the user to reveal a password or one-time authentication code. The offer is used to gain unauthorized access.

### Prevention

1. Verify support requests through official channels.
2. Never disclose passwords or one-time authentication codes.
3. Follow organizational security policies for technical support.

## 6. Comparison Table

| **Attack Type** | **Primary Target** | **Psychological Lever** | **Best Countermeasure** |
|---|---|---|---|
| Phishing | Email users and online account holders | Urgency, fear, curiosity, or trust | Verify messages independently and use MFA |
| Pretexting | Employees, customers, and support staff | Authority and trust in a believable story | Verify identity through official procedures |
| Baiting | People tempted by unknown devices or downloads | Curiosity, helpfulness, or desire for a reward | Block unauthorized media and avoid unknown devices |
| Quid pro quo | Users seeking help or a promised benefit | Reciprocity and expectation of a service | Use official support channels and never share credentials |

## 7. Organizational Security Awareness Checklist

1. **Inspect unexpected messages:** Check sender addresses, links, attachments, and unusual requests.
2. **Protect credentials:** Never share passwords or one-time authentication codes.
3. **Verify identities:** Confirm urgent requests for payments, account resets, or confidential information through an independent channel.
4. **Handle devices safely:** Never connect unknown USB drives or install untrusted software.
5. **Report suspicious activity:** Inform the appropriate security contact promptly and follow incident-reporting procedures.

## 8. Conclusion

Social engineering attacks target human behavior as well as technology. Phishing, pretexting, baiting, and quid pro quo attacks exploit trust, urgency, curiosity, or the desire for assistance. Real-world incidents and controlled research demonstrate the importance of strong identity verification, security awareness, multifactor authentication, and effective reporting procedures.

## 9. References

1. **CISA — Avoiding Social Engineering and Phishing Attacks:**  
   https://www.cisa.gov/news-events/news/avoiding-social-engineering-and-phishing-attacks

2. **NIST — Security Awareness and Training:**  
   https://csrc.nist.gov/projects/security-awareness-training

3. **Federal Trade Commission — How to Recognize and Avoid Phishing Scams:**  
   https://consumer.ftc.gov/articles/how-recognize-and-avoid-phishing-scams

4. **Google Cloud / Mandiant — Infected USB Drives Used to Steal Secrets:**  
   https://cloud.google.com/blog/topics/threat-intelligence/infected-usb-steal-secrets/

5. **Google Research — Users Really Do Plug in USB Drives They Find:**  
   https://research.google/pubs/users-really-do-plug-in-usb-drives-they-find/

6. **Palo Alto Networks Unit 42 — 2025 Global Incident Response Report: Social Engineering Edition:**  
   https://unit42.paloaltonetworks.com/2025-unit-42-global-incident-response-report-social-engineering-edition/

7. **UK National Cyber Security Centre — Phishing Attacks:**  
   https://www.ncsc.gov.uk/guidance/phishing
