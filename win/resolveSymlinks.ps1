# --help for help

$path = $args[0]

if($args.Length -eq 0 -or $args -contains "--help"){
	echo "Resolves the symlinks in a path"
	echo "Usage: resolveSymlinks [--help] path"
	echo ""
	echo "EXAMPLES:"
	echo "   NOTE: source/repos is a symlink to F:/source/repos"
	echo "   resolveSymlinks 'C:/Users/ldev/source/repos/tinyscripts'"
	echo "   C:/source/repos/tinyscripts"
	echo ""
	echo "BUGS:"
	echo "   Doesn't work for cross drive links"
	exit 0
}

$resolved = ((Get-Item -Force $path).Target)

echo $resolved
