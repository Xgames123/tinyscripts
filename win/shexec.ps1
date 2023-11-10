$file = $args[0]
if ($file -eq $null){
  echo "Usage: shexec <file>"
  exit -1
}
shtops.ps1 $(Get-Content $file) | out-string | Invoke-Expression
