

$apps = @(
    @{id = "7zip.7zip"; name="7zip"},
    @{id = "AnyDeskSoftwareGmbH.AnyDesk"; name="AnyDesk"},
    @{id = "Oracle.JavaRuntimeEnvironment"; name="Java JRE"},
    @{id = "Python.Python.3"; name="Python 3"; version = "3.9.7150.0"},
    @{id = "Discord.Discord"; name="Discord"},
    @{id = "File-New-Project.EarTrumpet"; name="EarTrumpet"},
    @{id = "Google.Chrome"; name="Chrome"},
    @{id = "Logitech.GHUB"; name="GHub"},
    @{id = "Microsoft.VisualStudioCode"; name="VisualCode"},
    @{id = "Notepad++.Notepad++"; name="Notepad++"},
    @{id = "Git.Git"; name="Git"},
    @{id = "Nvidia.GeForceExperience"; name="GForceExperience"},
    @{id = "Streamlabs.StreamlabsOBS"; name="OBS"},
    @{id = "Opera.OperaGX"; name="OperaGX"},
    @{id = "Microsoft.PowerToys"; name="PowerToys"},
    @{id = "Microsoft.WindowsTerminal"; name="WindowsTerminal"},
    @{id = "PuTTY.PuTTY"; name="Putty"},
    @{id = "qBittorrent.qBittorrent"; name="qBittorrent"},
    @{id = "VideoLAN.VLC"; name="VLC"},
    @{id = "RealVNC.VNCViewer"; name="VNCViewer"},
    @{id = "Zotero.Zotero"; name="Zotero"},
    @{id = "CPUID.CPU-Z"; name="CPU-Z"},
    @{id = "JetBrains.IntelliJIDEA.Community"; name="IntelliJ"},
    @{id = "JetBrains.PyCharm.Community"; name="PyCharm"},
    @{id = "hiyohiyo.CrystalDiskInfo"; name="CrystalDiskInfo"},
    @{id = "GitHub.GitHubDesktop"; name="GithubDesktop"},
    @{id = "Insecure.Nmap"; name="NMap"},
    @{id = "Rufus.Rufus"; name="Rufus"},
    @{id = "Intel.IntelDriverAndSupportAssistant"; name="IntelDriverAndSupportAssistant"}
)


foreach ($app in $apps)
{
    $listApp = winget list --exact --id $app.id
    if (![String]::Join("", $listApp).Contains($app.id)) {
        Write-host "Installing:" $app.name
        if ($app.location -ne $null) {
        #NOT WORKING
            if($app.version -ne $null){
                Write-host "Installing in custom path: " $app.location
                Write-host "Installing specific version: " $app.version
                winget install --exact --id $app.id --version $app.version --silent --location $app.location
            }else{
                
                Write-host "Installing in custom path: " $app.location
                winget install --exact --id $app.id --silent --location $app.location
            }
            
        }
        else {
            if($app.version -ne $null){
                Write-host "Installing specific version: " $app.version
                winget install --exact --id $app.id --version $app.version --silent
            }
            else{
                winget install --exact --id $app.id --silent
            }
            
        }
    }
    else {
        Write-host "Skipping Install of " $app.name
    }
}