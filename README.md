# Cross-Platform Endpoint Security & Patch Risk Assessment Lab

> **Recruiter snapshot:** Established a **5-service Windows attack-surface baseline**, validated Microsoft Defender with **EICAR**, applied a **source-specific Windows Firewall control to block SMB/445**, retested the endpoint, and measured a **20% reduction in observed open TCP services (5 → 4)**.

**Role relevance:** SOC Analyst | Vulnerability Management | Endpoint Security | Information Security | IT Security Support

---

## Project Summary

### Situation
A small mixed-platform environment needed a practical assessment of network exposure, endpoint protection and maintenance risk. The Windows 10 endpoint exposed multiple TCP services that required business justification and security control.

### Task
Establish a defensible technical baseline, validate endpoint protection, identify a proportionate remediation opportunity, retest using the same measurement method, and translate the findings into business risk.

### Action
- Used **Nmap** for service/version discovery and recorded the baseline evidence.
- Reviewed **Microsoft Defender** protection status with PowerShell.
- Safely tested malware-control response using the **EICAR Anti-Malware Test File**.
- Created and verified a **source-specific Windows Defender Firewall rule** blocking inbound **TCP/445 (SMB)** from the authorised Kali assessment host.
- Repeated the Nmap assessment and used a **Bash metric script** to compare saved before/after results.
- Documented findings, remediation and residual risk in a structured risk register.

### Result
**5 → 4 open TCP services | 20.0% observed attack-surface reduction**

- **EICAR detection:** PASS
- **EICAR quarantine/isolation:** PASS
- **Firewall remediation:** Verified
- **Post-remediation TCP/445:** Filtered
- Evidence retained as scan output, screenshots, script and risk register.

> The 20% figure represents the **observed reduction in open TCP services from the authorised assessment host**. It is not presented as a generic vulnerability-remediation percentage.

---

## Technical Evidence

| Area | Evidence |
|---|---|
| Network exposure | `scans/nmap_before.txt`, `scans/nmap_after.txt` |
| Baseline services | 135/tcp, 139/tcp, 445/tcp, 8000/tcp, 8089/tcp |
| Remediation | Windows Defender Firewall rule for inbound TCP/445 |
| Endpoint protection | Microsoft Defender + EICAR detection/quarantine |
| Measurement | `scripts/calculate_metrics.sh` |
| Risk management | `report/risk_register.csv` |
| Supporting evidence | `evidence/` screenshots |
| Detailed assessment | `security_assessment.md` |
| Professional report | `Security_Lab_Project_Report_Final.pdf` |

---

## Security Workflow

```text
Discover
   ↓
Assess
   ↓
Interpret Risk
   ↓
Remediate
   ↓
Retest
   ↓
Measure
   ↓
Report
```

The project is deliberately small, but follows the same evidence-driven control loop used in operational security work: identify exposure, understand context, apply a proportionate control, verify the change, quantify the outcome, and communicate residual risk.

---

## Environment

- **Assessment host:** Kali Linux — `192.168.56.102`
- **Target endpoint:** Windows 10 — `192.168.56.104`
- **Primary tools:** Nmap, Microsoft Defender, PowerShell, Bash, ClamAV and EICAR
- **Assessment boundary:** Authorised laboratory systems only; no real malware or production systems were used.

---

## Key Management Takeaway

This project demonstrates more than the ability to run security tools. It demonstrates the ability to turn technical evidence into a **defensible security decision**:

**exposure → control validation → targeted remediation → independent retest → measurable result → business risk**

---

## Limitations

This is a controlled laboratory assessment, not a production penetration test or enterprise-wide vulnerability assessment. Open TCP services indicate exposure rather than confirmed exploitability, and the EICAR test validates only the tested endpoint-protection scenario.

---

## Repository Structure

```text
security-lab/
├── evidence/
├── report/
│   └── risk_register.csv
├── scans/
│   ├── nmap_before.txt
│   └── nmap_after.txt
├── scripts/
│   └── calculate_metrics.sh
├── security_assessment.md
└── Security_Lab_Project_Report_Final.pdf
```

**Interview line:**  
> “I established a five-service baseline, validated endpoint protection with EICAR, restricted SMB/445 using a targeted Windows Firewall rule, retested the endpoint and demonstrated a measurable 5-to-4 reduction in observed open TCP services.”
