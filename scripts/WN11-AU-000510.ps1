<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows System event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Nosilla Garner
    LinkedIn        : linkedin.com/in/nosillagarner/
    GitHub          : github.com/nos49
    Date Created    : 2026-10-13
    Last Modified   : 2026-10-13
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : 21156 (Windows Compliance Checks - DISA Microsoft Windows 11 STIG v2r9 audit)
    STIG-ID         : WN11-AU-000510
    Documentation   : https://stigaview.com/products/win11/latest/WN11-AU-000510/

.TESTED ON
    Date(s) Tested  : 2026-10-13
    Tested By       : Nosilla Garner
    Systems Tested  : Windows 11 Pro (stigs-ng)
    PowerShell Ver. : 5.1.26100.9444

.USAGE
    Run from an elevated (Administrator) PowerShell session.
    Example syntax:
    PS C:\> .\remediation-STIG-ID-WN11-AU-000510.ps1
#>

# Must run as Administrator
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "This script must be run as Administrator."
    exit 1
}

$regPath   = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\System"
$valueName = "MaxSize"
$valueData = 32768   # 0x00008000 = 32 MB

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $valueName -Value $valueData -PropertyType DWord -Force | Out-Null

$current = (Get-ItemProperty -Path $regPath -Name $valueName).$valueName
Write-Output "WN11-AU-000510: $regPath\$valueName is now set to $current (required: >= 32768)."
