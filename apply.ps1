$tbProfiles = "$env:USERPROFILE\AppData\Roaming\Thunderbird\Profiles"
if (Test-Path $tbProfiles -PathType Container) {
    $dest = $tbProfiles | Get-ChildItem | Sort-Object LastWriteTime | Select-Object -Last 1 | Get-ChildItem -Filter "chrome"
    Get-ChildItem "*.css" | ForEach-Object{
        "Copied '{0}' to profile." -f $_.Name | Write-Host -ForegroundColor Cyan
        $_ | Copy-Item -Destination $dest
    }
}
else {
    "'{0}' not found!" -f $tbProfiles | Write-Host -ForegroundColor Magenta
}
