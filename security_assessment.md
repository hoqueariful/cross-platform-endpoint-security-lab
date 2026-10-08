# Security Assessment Report

## Cross Platform Endpoint Security and Patch Assessment Laboratory

**Assessment type:** Controlled defensive security assessment  
**Assessment workstation:** Kali Linux  
**Target endpoint:** Windows 10  
**Kali IP:** 192.168.56.102  
**Windows IP:** 192.168.56.104  
**Primary focus:** Network exposure, endpoint protection, isolation, patch assessment, remediation, verification and business risk

---

## 1. Executive Summary

This project is a compact, controlled cybersecurity assessment designed to demonstrate an end to end analyst workflow rather than isolated use of security tools.

The assessment established a network baseline, validated endpoint protection, safely tested malware detection and quarantine, reviewed operating system maintenance, applied a targeted defensive remediation and repeated the assessment to determine whether the change produced an observable improvement.

The initial Nmap assessment identified **five open TCP services** on the Windows laboratory endpoint:

```text
135/tcp   Microsoft Windows RPC
139/tcp   Microsoft Windows NetBIOS
445/tcp   Microsoft DS / SMB
8000/tcp  Splunk HTTP
8089/tcp  Splunk HTTPS
```

The assessment treated open services as **network exposure**, not automatic proof of exploitable vulnerability. Service purpose and business context remain essential when deciding whether an exposure requires remediation.

Microsoft Defender was validated with the **EICAR Anti Malware Test File**, allowing the endpoint protection workflow to be tested without deploying real malware. Detection and quarantine were successfully observed in the Windows Security interface.

A targeted Windows Defender Firewall rule was then implemented to block inbound SMB traffic on TCP 445 from the Kali assessment host. The rule was verified and the Windows endpoint was reassessed using the same Nmap methodology.

The project therefore demonstrates a practical sequence:

**Baseline → Evidence → Risk interpretation → Remediation → Retest → Measurement → Reporting**

---

## 2. STAR Case Study

### Situation

The Windows 10 laboratory endpoint was reachable from the authorised Kali Linux assessment workstation and exposed multiple TCP services. The baseline assessment recorded five open services, including SMB on TCP 445 and Splunk services on TCP 8000 and 8089.

The objective was not simply to list ports. The security question was whether the exposure was justified, appropriately controlled and capable of being reduced without making unnecessary changes to the environment.

### Task

The task was to establish a defensible technical baseline, validate endpoint security controls, demonstrate safe malware detection and isolation, identify a practical attack surface reduction opportunity, apply a proportionate remediation, retest the endpoint and communicate the findings in business terms.

### Action

The assessment was performed inside an authorised laboratory using Kali Linux at **192.168.56.102** and Windows 10 at **192.168.56.104**.

The initial service assessment used Nmap service and version enumeration.

The Windows endpoint was evaluated using native PowerShell and Microsoft Defender status information.

The endpoint protection workflow was tested with the EICAR Anti Malware Test File rather than real malware. The resulting event was reviewed in Windows Security Protection History to verify quarantine.

TCP 445 was selected for a controlled remediation exercise. A narrowly scoped Windows Defender Firewall rule was created to block SMB traffic from the Kali assessment host. The rule was verified before the endpoint was rescanned.

The same Nmap methodology was used for the post remediation assessment. A small Bash utility was used to calculate the change in observed open TCP services from the saved baseline and post remediation scan files.

Linux package update status and Windows operating system, build and installed hotfix information were also reviewed to provide broader maintenance and lifecycle context.

### Result

The assessment established a verified baseline of **five open TCP services**.

The endpoint security test produced:

**EICAR detection: PASS**  
**EICAR quarantine: PASS**

The targeted Windows firewall remediation was successfully created and verified.

The final network exposure metric is derived only from the saved post remediation Nmap result:

**Baseline open TCP services:** 5  
**Post remediation open TCP services:** [INSERT ACTUAL VALUE]  
**Observed reduction:** [INSERT ACTUAL PERCENTAGE]

No unsupported performance claims are made. All quantitative results in the final portfolio must match the underlying evidence.

---

## 3. Business Problem

A security team needs more than command output. It needs to know what is exposed, why the exposure matters, whether controls are functioning and whether a remediation actually changed the security state.

This project addresses those questions through a focused workflow:

```text
Technical discovery
        ↓
Security validation
        ↓
Business risk interpretation
        ↓
Targeted remediation
        ↓
Independent retest
        ↓
Measured result
        ↓
Management reporting
```

The business benefit is a **repeatable, evidence driven process** for turning technical observations into remediation decisions.

---

## 4. Assessment Objectives

1. Establish a network exposure baseline for the Windows endpoint.
2. Identify and document reachable services.
3. Assess the operational state of Microsoft Defender.
4. Validate malware detection and quarantine safely using EICAR.
5. Apply a targeted firewall remediation for SMB exposure.
6. Repeat the network assessment after remediation.
7. Measure the change using recorded evidence.
8. Assess Linux package updates and Windows patch state.
9. Translate technical observations into business risk and recommended actions.
10. Produce an auditable evidence trail suitable for a cybersecurity portfolio.

---

## 5. Scope

### In Scope

| Area | Assessment coverage |
|---|---|
| Network security | TCP service discovery and service identification |
| Endpoint security | Microsoft Defender status |
| Malware control validation | EICAR detection test |
| Isolation | Quarantine and Protection History verification |
| Host security | Targeted Windows Defender Firewall remediation |
| Linux maintenance | APT package update assessment |
| Windows maintenance | OS, build and installed hotfix assessment |
| Verification | Before and after reassessment |
| Risk management | Finding, impact, recommendation and status |
| Reporting | Evidence, report and risk register |

### Out of Scope

| Area | Exclusion |
|---|---|
| Malware | No real malware deployment or execution |
| Offensive activity | No destructive exploitation |
| Credentials | No unauthorised credential attacks |
| Persistence | No persistence testing |
| External targets | No third party or production systems |
| Enterprise testing | No claim of enterprise wide coverage |
| Compliance | No full compliance audit |
| Applications | No full application penetration test |

---

## 6. Authorisation and Rules of Engagement

All testing was limited to systems within the authorised laboratory environment.

**Assessment workstation:** Kali Linux, 192.168.56.102  
**Assessment target:** Windows 10, 192.168.56.104

Testing was restricted to the defined laboratory assets. The EICAR test file was used instead of real malware. The firewall change was scoped to the Kali assessment host and TCP 445.

No production, third party or unauthorised systems were targeted.

---

## 7. Laboratory Architecture

```text
                    AUTHORISED SECURITY LAB

        +-------------------------------------------+
        |                                           |
        |   Kali Linux              Windows 10      |
        |   192.168.56.102         192.168.56.104   |
        |        |                       |           |
        |        +------ Nmap ---------->|           |
        |                                |           |
        |                       Microsoft Defender  |
        |                       Windows Firewall     |
        |                       Patch assessment     |
        |                                |           |
        +-------------------------------------------+
                                         |
                                         v
                              Evidence and Reporting
                                         |
                                         v
                                  Risk Register
```

The architecture separates the **assessment workstation** from the **target endpoint**, making the before and after workflow easy to reproduce and explain.

---

## 8. Methodology

### Phase 1: Baseline Assessment

The initial state was recorded before remediation.

### Phase 2: Security Control Validation

Microsoft Defender status and the EICAR detection and isolation workflow were assessed.

### Phase 3: Risk Interpretation

Exposed services were considered in context instead of being treated as vulnerabilities automatically.

### Phase 4: Controlled Remediation

A narrow Windows firewall control was applied to the selected SMB exposure.

### Phase 5: Retest

The same Nmap service and version scan was repeated after the change.

### Phase 6: Measurement

The observed before and after service counts were compared.

### Phase 7: Reporting

Technical findings were translated into business impact, recommended action and residual risk.

---

## 9. Network Exposure Assessment

### 9.1 Baseline

The baseline assessment used:

```bash
sudo nmap -sV 192.168.56.104 -oN scans/nmap_before.txt
```

The recorded result contained five open TCP services:

| Port | Service | Interpretation |
|---|---|---|
| 135/tcp | Microsoft Windows RPC | Windows management and RPC exposure |
| 139/tcp | Microsoft Windows NetBIOS | Legacy Windows networking exposure |
| 445/tcp | Microsoft DS / SMB | File and network sharing exposure |
| 8000/tcp | Splunk HTTP | Application service exposure |
| 8089/tcp | Splunk HTTPS | Splunk management or API related exposure |

### 9.2 Assessment Interpretation

An open port is an **exposure indicator**, not a confirmed vulnerability. A defensible assessment considers the service, its business purpose, authentication requirements, network location, expected users and compensating controls.

For the laboratory remediation exercise, TCP 445 was selected because it provided a clear opportunity to demonstrate a targeted host based control.

### 9.3 Evidence

**Baseline Nmap screenshot:** `evidence/03_nmap_scan.png`  
**Baseline scan:** `scans/nmap_before.txt`

---

## 10. Endpoint Security Assessment

Microsoft Defender was assessed using PowerShell to confirm the operational state of key protection functions.

The control areas reviewed were:

**Antivirus enabled**  
**Real time protection enabled**  
**Antispyware enabled**  
**Antimalware service enabled**

The assessment intentionally distinguishes between **control presence** and **control effectiveness**. A protection product being enabled does not by itself prove that every threat would be detected.

The EICAR test therefore provided a separate validation of the specific detection and quarantine workflow.

---

## 11. EICAR Detection and Quarantine Validation

### Purpose

The EICAR Anti Malware Test File was used to test endpoint protection safely without introducing genuine malicious code.

### Expected workflow

```text
EICAR test artefact
        ↓
Microsoft Defender detection
        ↓
Access blocked
        ↓
Quarantine
        ↓
Protection History review
        ↓
Analyst verification
```

### Result

**Detection: PASS**  
**Quarantine: PASS**

The result confirms the behaviour of the endpoint against the specific EICAR test condition. It does not establish that every malware family would be detected.

### Evidence

`evidence/05_eicar_detection.png`  
`evidence/06_quarantine.png`

---

## 12. Firewall Remediation

### 12.1 Rationale

TCP 445 was selected as the remediation target. Rather than disabling SMB globally, a source specific Windows Defender Firewall rule was applied against the authorised Kali assessment host.

This approach demonstrates proportional control: restrict the assessed exposure while avoiding unnecessary changes to unrelated Windows functionality.

### 12.2 Remediation Scope

**Source:** 192.168.56.102  
**Target:** 192.168.56.104  
**Protocol:** TCP  
**Port:** 445  
**Direction:** Inbound  
**Action:** Block

### 12.3 Verification

The firewall rule was verified as enabled with an inbound block action before the post remediation Nmap assessment was performed.

### 12.4 Operational Consideration

In a production organisation, a change of this type would be subject to service ownership, dependency validation, change control and rollback planning.

---

## 13. Post Remediation Verification

The post remediation assessment used the same Nmap command structure as the baseline:

```bash
sudo nmap -sV 192.168.56.104 -oN scans/nmap_after.txt
```

This creates a direct before and after comparison.

The baseline count is confirmed as:

**Before:** 5 open TCP services

The post remediation count must be taken directly from `scans/nmap_after.txt`.

**After:** [INSERT ACTUAL VALUE]

The observed reduction is calculated as:

```text
Reduction % = ((Before - After) / Before) × 100
```

No percentage should be reported unless it is supported by the two saved Nmap result files.

---

## 14. Project Metrics

### Network Exposure

**Baseline:** 5 open TCP services  
**Post remediation:** [INSERT ACTUAL VALUE]  
**Observed reduction:** [INSERT ACTUAL PERCENTAGE]

### Endpoint Security Control

**EICAR detection:** PASS  
**EICAR quarantine:** PASS

### Linux Patch Assessment

**Packages requiring updates before remediation:** [INSERT ACTUAL VALUE]  
**Packages requiring updates after remediation:** [INSERT ACTUAL VALUE]

### Windows Patch Assessment

**Operating system:** [INSERT ACTUAL VALUE]  
**OS build:** [INSERT ACTUAL VALUE]  
**Most recent relevant HotFix:** [INSERT ACTUAL VALUE]

---

## 15. Patch and Maintenance Assessment

### 15.1 Kali Linux

The Kali environment was assessed for available package updates, updates were applied where required and the environment was checked again after remediation.

This provides evidence of maintenance activity but should not be interpreted as complete vulnerability coverage.

### 15.2 Windows 10

The Windows endpoint was assessed for:

**Operating system edition**  
**Windows version**  
**OS build**  
**Recent installed hotfixes**  
**Windows Update service state**

This establishes the platform and update state at the time of the assessment.

---

## 16. Windows 10 Lifecycle Consideration

The laboratory endpoint uses Windows 10 as a legacy platform case study.

Microsoft ended standard Windows 10 support on **14 October 2025**. Continued operational use therefore requires a supported migration path or, where applicable and eligible, an Extended Security Updates arrangement.

This is treated as a **platform lifecycle and risk management finding**, not as proof that every Windows 10 installation is automatically compromised.

Microsoft reference:

https://support.microsoft.com/en-us/windows/deployment/updates-lifecycle/windows-10-support-has-ended-on-october-14-2025

---

## 17. Risk Assessment

The risk register translates technical observations into business language.

A lightweight project model was used:

```text
Risk Score = Impact × Likelihood
```

The model is suitable for a portfolio demonstration. It is not intended to replace an enterprise risk methodology.

### Key Findings

| Finding | Technical meaning | Business impact | Recommended action |
|---|---|---|---|
| SMB exposure before remediation | TCP 445 was reachable from the assessment host | Unnecessary exposure may increase attack surface | Restrict or disable exposure where business requirements permit |
| Windows 10 lifecycle | Platform is beyond standard support | Creates support, maintenance and security management risk | Plan migration to a supported platform or an appropriate temporary transition arrangement |
| Linux package updates | Packages required maintenance | Unpatched software can increase exposure to known weaknesses | Apply updates and reassess |
| EICAR detection and quarantine | Endpoint control responded to the test artefact | Provides evidence that the specific detection and isolation path worked | Repeat control validation periodically |

The authoritative structured findings should be maintained in:

`reports/risk_register.csv`

---

## 18. Business Impact Analysis

### Attack Surface

Reducing unnecessary exposure can decrease the number of reachable services available to an attacker from a given network position.

### Endpoint Protection

Validating detection and quarantine provides stronger assurance than simply confirming that an antivirus product is installed.

### Patch Management

Regular maintenance reduces the time for which known software weaknesses may remain unaddressed.

### Platform Lifecycle

Operating beyond standard vendor support requires explicit management because normal maintenance and security update coverage may no longer be available.

### Evidence and Accountability

Before and after assessments create an auditable trail showing what was discovered, what was changed and what happened afterwards.

---

## 19. Evidence Register

| Evidence | Purpose |
|---|---|
| `03_nmap_scan.png` | Baseline network exposure |
| `05_eicar_detection.png` | Endpoint malware detection |
| `06_quarantine.png` | Isolation and quarantine verification |
| `10_project_metrics.png` | Before and after remediation measurement |
| `11_linux_patch_status.png` | Linux update assessment |
| `13_windows_patch_status.png` | Windows OS and hotfix evidence |
| `14_risk_register.png` | Business risk prioritisation |
| `15_final_project_structure.png` | Final laboratory project structure |

---

## 20. Evidence Handling Principle

The report uses a strict evidence based approach.

It does not claim that an open port is automatically exploitable.

It does not claim that a successful EICAR test means complete malware protection.

It does not claim complete enterprise vulnerability coverage from a small laboratory.

It does not use a pre selected percentage simply because it sounds impressive.

All final quantitative statements must correspond to the recorded laboratory output.

This improves the credibility of the project when reviewed by a technical interviewer, security manager or hiring panel.

---

## 21. Recommended Remediation Priorities

### Priority 1: Platform Lifecycle

Move the Windows endpoint to a supported operating system release. Where immediate migration is not possible, assess whether an applicable supported transition arrangement is justified.

### Priority 2: Network Exposure

Confirm whether SMB access is genuinely required. Where it is not, maintain appropriate restriction. Where it is required, minimise exposure through network segmentation, access control and service hardening.

### Priority 3: Patch Management

Maintain regular update cycles for operating systems and installed applications. Prioritise security updates according to exposure, exploitability and business criticality.

### Priority 4: Endpoint Control Assurance

Repeat controlled endpoint security validation periodically and retain evidence that the security control remains operational.

---

## 22. Real World Operational Improvements

A production version of this process would normally integrate with enterprise security tooling.

Potential extensions include centralised endpoint telemetry, vulnerability scanning, asset inventory, SIEM correlation, ticketing and change management.

The laboratory intentionally stops at the assessment, remediation and verification layer so that the project remains small, understandable and reproducible.

---

## 23. Limitations

This is a controlled laboratory project.

It is **not** a production penetration test, enterprise vulnerability assessment, malware analysis engagement or compliance audit.

Nmap service enumeration does not provide complete vulnerability coverage.

Installed hotfix information does not establish complete enterprise patch compliance.

A successful EICAR test validates only the tested endpoint protection scenario.

The number of open services and update states represents the environment at the time of assessment and can change with software, configuration or operating system updates.

---

## 24. Deliverables

The completed project should contain:

**README.md**  
Recruiter focused project overview.

**security_assessment.md**  
Detailed technical and business assessment.

**risk_register.csv**  
Structured findings and remediation tracking.

**nmap_before.txt**  
Baseline network exposure evidence.

**nmap_after.txt**  
Post remediation network exposure evidence.

**calculate_metrics.sh**  
Repeatable before and after metric calculation.

**Evidence screenshots**  
Visual evidence linked to major assessment stages.

---

## 25. Interview Narrative

> I built a small cross platform endpoint security assessment laboratory using Kali Linux and Windows 10. I established a five service baseline with Nmap, validated Microsoft Defender detection and quarantine using the EICAR test file, applied a targeted Windows Defender Firewall control to restrict SMB exposure, repeated the assessment and measured the resulting change. I also assessed patch and platform lifecycle risk and translated the findings into a business focused risk register. The project demonstrates that I can move from technical evidence to proportionate remediation and measurable reporting rather than simply running individual security tools.

---

## 26. Final Conclusion

The laboratory demonstrated a complete, evidence driven defensive assessment cycle.

The most important outcome is the linkage between technical activity and business decision making:

```text
Discover the exposure
        ↓
Understand the service and context
        ↓
Validate the endpoint controls
        ↓
Apply a proportionate remediation
        ↓
Retest the environment
        ↓
Measure the outcome
        ↓
Communicate residual risk
```

This workflow is directly relevant to junior security roles involving **SOC operations, vulnerability management, endpoint security, information security and IT security support**.

The project is intentionally modest in size. Its value comes from disciplined assessment, reliable evidence, proportionate remediation and clear communication rather than from unnecessary software complexity.

---

## 27. Safety and Authorisation Statement

All testing was performed against systems within the authorised laboratory environment.

No real malware was deployed.

The EICAR Anti Malware Test File was used for safe endpoint control validation.

No production, third party or unauthorised systems were targeted.
