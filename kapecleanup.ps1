# Cleanup of Kape and artifacts

$zipFilePath = "C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Downloads\kape.zip"
$extractPath = "C:\kape-da"

# Clean up files
Remove-Item $zipFilePath
Remove-Item $extractPath -Recurse
