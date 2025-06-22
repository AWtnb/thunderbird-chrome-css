$dest = "$env:USERPROFILE\AppData\Roaming\Thunderbird\Profiles\" | Get-ChildItem | Sort-Object LastWriteTime | Select-Object -Last 1 | Get-ChildItem -Filter "chrome"
Get-ChildItem "*.css" | ForEach-Object{$_ | Copy-Item -Destination $dest}
