# Windows 11 DISA STIG Remediation (PowerShell)

PowerShell scripts that remediate 10 DISA STIG findings on a Windows 11 Pro VM, built as part of my cybersecurity internship.

## Overview
I scanned a Windows 11 VM (`stigs-ng`) with Tenable Vulnerability Management using the DISA Microsoft Windows 11 STIG compliance audit. I then picked 10 failed checks that could be fixed safely with a script and wrote a PowerShell remediation for each one. After running the scripts, I rescanned the VM to verify the fixes.

## Workflow
1. **Baseline scan:** Ran a Tenable compliance scan against the DISA Windows 11 STIG.
2. **Triage:** Compared the failed audits against the [Windows 11 STIG list](https://stigaview.com/products/win11/latest/) and chose 10 low-risk fixes.
3. **Remediate:** Wrote one PowerShell script per STIG, each of which sets the required registry value and prints the result.
4. **Verify:** Rescanned to confirm each finding passed, then corrected any that didn't (for example, the Security event log size threshold for WN11-AU-000505).

## STIGs Remediated
| STIG-ID | Description | Severity |
|---|---|---|
| WN11-AU-000500 | Application event log size ≥ 32768 KB | CAT II |
| WN11-AU-000505 | Security event log size ≥ 5120000 KB | CAT II |
| WN11-AU-000510 | System event log size ≥ 32768 KB | CAT II |
| WN11-CC-000005 | Camera access from the lock screen disabled | CAT II |
| WN11-CC-000010 | Lock screen slide shows disabled | CAT II |
| WN11-CC-000180 | Autoplay turned off for non-volume devices | CAT I |
| WN11-CC-000185 | Default AutoRun behavior prevents autorun commands | CAT I |
| WN11-CC-000190 | Autoplay disabled for all drives | CAT I |
| WN11-CC-000330 | WinRM client must not use Basic authentication | CAT I |
| WN11-CC-000345 | WinRM service must not use Basic authentication | CAT I |

## Usage
Run each script from an elevated (Administrator) PowerShell session:

    Set-ExecutionPolicy -Scope Process Bypass
    .\remediation-STIG-ID-WN11-AU-000500.ps1

## Environment
- **OS:** Windows 11 Pro
- **PowerShell:** 5.1.26100.9444
- **Scanner:** Tenable Vulnerability Management (DISA Windows 11 STIG v2r9 audit)

## Author
**Nosilla Garner** · [LinkedIn](https://www.linkedin.com/in/nosillagarner/)
