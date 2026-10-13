# Task 6: Importance of Patch Management

## 1. Introduction

Patch management is the process of identifying, testing, deploying, and verifying software updates that fix security vulnerabilities, bugs, and stability issues. Effective patch management reduces the risk of attackers exploiting known vulnerabilities.

## 2. Vulnerabilities and CVEs

A vulnerability is a weakness in software or hardware that may be exploited. A Common Vulnerabilities and Exposures (CVE) identifier provides a standard reference for a publicly disclosed vulnerability.

Organizations should monitor vendor security advisories and trusted vulnerability databases, assess the risk to their own systems, and prioritize fixes according to severity and exposure.

## 3. Real-World Security Incidents

### 3.1 WannaCry ransomware — 2017

WannaCry spread by exploiting a vulnerability in Microsoft Windows' SMBv1 implementation. Microsoft had released security updates before the outbreak, but some systems remained unpatched.

**Consequences:**
- Systems and files became inaccessible.
- Hospitals and businesses experienced disruption.
- Organizations faced recovery costs and operational delays.

**Lesson:** Apply critical security updates promptly, maintain supported systems, and keep reliable backups.

### 3.2 Equifax data breach — 2017

Equifax disclosed a major breach involving the exploitation of a known vulnerability in Apache Struts. A patch was available before the breach was discovered.

**Consequences:**
- Sensitive personal information was exposed.
- The incident caused significant financial and reputational damage.
- It highlighted the importance of asset inventory and patch verification.

**Lesson:** Organizations need clear ownership of systems, vulnerability tracking, timely remediation, and verification that patches have been applied.

## 4. Patch Management Lifecycle

1. **Discovery:** Maintain an inventory of operating systems, applications, devices, and software versions.
2. **Assessment:** Identify applicable vulnerabilities and prioritize them by severity, exposure, and business impact.
3. **Testing:** Test patches in a controlled environment to identify compatibility or stability issues.
4. **Deployment:** Install approved updates according to a defined schedule and emergency process.
5. **Verification:** Confirm successful installation, check system functionality, and rescan for remaining vulnerabilities.

The process should be repeated regularly, with exceptions documented and reviewed.

## 5. Patch Management Checklist

1. Maintain an accurate inventory of hardware and software assets.
2. Subscribe to vendor security advisories and vulnerability alerts.
3. Prioritize actively exploited and critical vulnerabilities.
4. Test patches before broad deployment where practical.
5. Schedule and document patch installation.
6. Verify updates and investigate failed installations.
7. Keep secure backups and a rollback plan for important systems.

## 6. Common Challenges and Solutions

| Challenge | Suggested Solution |

| Legacy or unsupported systems | Upgrade, replace, or isolate them with documented risk acceptance |
| Compatibility concerns | Test patches in a staging environment |
| Limited maintenance windows | Plan regular maintenance and emergency patch windows |
| Unknown assets | Use a maintained asset inventory |
| Failed updates | Monitor deployment results and investigate failures |
| Limited staff or budget | Prioritize high-risk vulnerabilities first |

## 7. Conclusion

Patch management is an essential part of cybersecurity. Maintaining an asset inventory, prioritizing vulnerabilities, testing updates, deploying them promptly, and verifying success can reduce the risk of known vulnerabilities being exploited.

## 8. References

1. CISA — Known Exploited Vulnerabilities Catalog: https://www.cisa.gov/known-exploited-vulnerabilities-catalog
2. NIST — National Vulnerability Database: https://nvd.nist.gov/
3. Microsoft Security Bulletin MS17-010: https://learn.microsoft.com/en-us/security-updates/securitybulletins/2017/ms17-010
4. U.S. Government Accountability Office — Equifax Data Breach: https://www.gao.gov/products/gao-19-62
5. Apache Struts Security Bulletins: https://struts.apache.org/announce/

## 9. Key Takeaways

- Keep software and systems supported and updated.
- Prioritize vulnerabilities based on risk, not just convenience.
- Verify patch deployment and maintain a documented remediation process.
