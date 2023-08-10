# Use --help for help

if($args -contains "--help"){
	echo "Usage: win-install [--user] [--uninstall] [--help]"
	echo ""
	echo "Options:"
	echo "--user       Installs for the current user instead of the machine"
	echo "--uninstall  Uninstall NOTE: (If you installed using the --user option you also need it to uninstall)"
	exit 0
}

$uninstall=$false
if($args -contains "--uninstall"){
	$uninstall=$true
}

$user='Machine'
if($args -contains "--user"){
	$user='User'
}

$rootdir=$(Get-Location)

echo "INFO:"
echo "Root directory: $rootdir"
echo ""
if ( -not (Test-Path -Path "$rootdir/win-install.ps1" -PathType Leaf)){
	echo "FATAL: $rootdir/win-install.ps1 doesn't exist"
	echo "Run the script from the root directory (./win-install.ps1)"
	echo "Aborting install"
	exit -1
}

$awnser = $(Read-Host "Is this ok (y/N) ")
if ($awnser -ne "y"){
	echo "Aborting install"
	exit -1
}




echo "Setting environment vars for $user..."
$path = [System.Environment]::GetEnvironmentVariable('Path',$user)

if($uninstall){
	$path = ($path.Split(';') | Where-Object { $_ -ne '$rootdir/win' }) -join ';'
}else{
	$path += ";$rootdir/win"
}

[Environment]::SetEnvironmentVariable("Path", $path, $user)

$Env:PATH+=";$rootdir/win"

echo "done"