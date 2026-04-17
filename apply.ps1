$tbProfiles = "$env:USERPROFILE\AppData\Roaming\Thunderbird\Profiles"
if (Test-Path $tbProfiles -PathType Container) {
    $prof = $tbProfiles | Get-ChildItem | Sort-Object LastWriteTime | Select-Object -Last 1
    $dest = $prof.FullName | Join-Path -ChildPath "chrome" 
    Get-ChildItem "*.css" | Copy-Item -Destination $dest
    "Copied css files to {0}" -f $dest | Write-Host
}
else {
    "'{0}' not found!" -f $tbProfiles | Write-Host -ForegroundColor Magenta
}
