# Cleanup of Kape and artifacts

$zipFilePath = "C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Downloads\kape.zip"
$extractPath = "C:\kape-da"

# Check if the extraction directory exists, if exists, delete it
if (Test-Path -Path $extractPath -PathType Container) {
    Remove-Item $extractPath -Recurse
}

# Check if the zip file exists, if exists, delete it
if (Test-Path $zipFilePath -PathType leaf) {
   Remove-Item $zipFilePath
}
