# kape-mde

Taken from:  https://github.com/DFIRanjith/Scripts/blob/main/kape.ps1

Notes from:  https://medium.com/@DFIRanjith/remote-collection-of-windows-forensic-artifacts-using-kape-and-microsoft-defender-for-endpoint-f7d3a857e2e0


## One Time Step
- Upload both kape.exe and kapemde.ps1 to the MDE library (overwrite if necessary)

## To collect triage package
- Connect to the remote machine using Live Response in MDE
- Upload the kape.zip file to the remote machine using put (putfile kape.zip -overwrite)
- Run kapemde.ps1 via Live Response (run kapemde.ps1)
- Change directory into the kape output folder (eg cd C:\kape-da\kape-20250224T153141-{machinename})
- Get ConsoleLog (eg getfile 2025-02-24T15_31_41_4683858_ConsoleLog.txt)
- Get the triage file (eg getfile 2025-02-24T162604_kapeoutput-M783731.zip)
- Once done, clean up the triage files manually (smb share etc)
