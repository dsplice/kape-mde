# kape-mde

Taken from:  https://github.com/DFIRanjith/Scripts/blob/main/kape.ps1

Notes from:  https://medium.com/@DFIRanjith/remote-collection-of-windows-forensic-artifacts-using-kape-and-microsoft-defender-for-endpoint-f7d3a857e2e0


## One Time Step
- Upload both kape.exe and kapemde.ps1 to the MDE library

## To collect triage package
- Connect to the remote machine using Live Response in MDE
- Upload the kape.zip file to the remote machine using put (eg putfile kape.zip)
- Run kapemde.ps1 via Live Response (eg run kapemde.ps1)
- In C:\Temp\ copy the file to the MDE library (eg copy {date}{machinename}kapeoutput.zip)
- Download triage package (eg download {filename}.zip)
- Once done, clean up the end system (eg del Kape.zip, del {filename}.zip)
