$tempDir = Join-Path $env:TEMP "posh1337"
if (-not(test-path $tempDir)) { md $tempDir | out-null }

function Download-File {
param (
  [string]$url,
  [string]$file
 )
  $downloader = new-object System.Net.WebClient
  $downloader.Proxy.Credentials=[System.Net.CredentialCache]::DefaultNetworkCredentials;
  $downloader.DownloadFile($url, $file)
}
$leetFile = join-path $tempDir 'leet.ps1'
$leetModFile = join-path $tempDir 'leet.psm1'
if (test-path $leetFile) { rm $leetFile }
if (test-path $leetModFile) { rm $leetModFile }
Download-File 'https://raw.githubusercontent.com/vidarkongsli/posh1337/master/leet.ps1' $leetFile
Download-File 'https://raw.githubusercontent.com/vidarkongsli/posh1337/master/leet.psm1' $leetModFile
Import-module $leetModFile -Force
Write-output ('Hello from Poshleet' | leet)
