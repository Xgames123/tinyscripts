# Converts linux shell scripts to powershell
# Usage: shtops shcode


$shcode = $args[0]

# aliases
# NOTE: aliases need to be converted to functions because powershell doesn't support args in aliases
$shcode = $($shcode -ireplace "^alias ([a-z]*)=[`"']?([^'`"\n]*)[`"']?", 'function $1(){$2}')


echo $shcode