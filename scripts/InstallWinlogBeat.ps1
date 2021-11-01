$path = 'C:\Users\Administrator\beats'

$cli = New-Object System.Net.WebClient
$uri = New-Object System.Uri($url)
$file = Split-Path $uri.AbsolutePath -Leaf
$cli.DownloadFile($uri, (Join-Path $path $file))

Expand-Archive -Path .\winlogbeat-7.15.1-windows-x86_64.zip

.\install-service-winlogbeat.ps1

.\winlogbeat.exe test config -c .\winlogbeat.yml -e

.\winlogbeat.exe setup -e

Start-Service winlogbeat

services.msc

Stop-Service winlogbeat