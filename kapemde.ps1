# Remote collection of Windows Forensic Artifacts using KAPE and Microsoft Defender for Endpoint.
# https://medium.com/@DFIRanjith/remote-collection-of-windows-forensic-artifacts-using-kape-and-microsoft-defender-for-endpoint-f7d3a857e2e0
# Edited by Derek Armstrong 20250223

$zipFilePath = "C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Downloads\kape.zip"
$extractPath = "C:\kape-da"

# Check if there are at least 40 GB free on C drive.  Exit if not
$thresholdGB = 40 
$freeSpace = (Get-PSDrive -Name C).Free / 1GB
if ($freeSpace -lt $thresholdGB) {
    Write-Host "Error: Not enough free space on C: drive. Available: $([math]::round($freeSpace, 2)) GB, Required: $thresholdGB GB"
    exit 1  # Return an error code
}

# Check if the extraction directory exists, if not, create it
if (-not (Test-Path -Path $extractPath -PathType Container)) {
    New-Item -ItemType Directory -Path $extractPath -Force | Out-Null
}

# Unzip the file using the built-in ComObject Shell.Application
$shell = New-Object -ComObject Shell.Application
$zipFile = $shell.NameSpace($zipFilePath)
$destination = $shell.NameSpace($extractPath)
$destination.CopyHere($zipFile.Items())

# Wait for the extraction process to complete 
while ($destination.Items().Count -ne $zipFile.Items().Count) {
    Start-Sleep -Seconds 1
}

# Execute the kape.exe with the given parameters
$command = "C:\kape-da\kape.exe"
$params = "--tsource C: --tdest C:\kape-da\kape-%d-%m --target CombinedLogs,KapeTriage,MessagingClients,ProgramExecution,RemoteAdmin,BITS,WindowsFirewall --zip kapeoutput-%m --debug"
Start-Process -FilePath $command -ArgumentList $params -Wait

# Clean up files
Remove-Item $zipFilePath
