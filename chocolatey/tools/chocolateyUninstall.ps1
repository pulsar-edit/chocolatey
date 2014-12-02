$dest = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageName = 'Atom' # arbitrary name for the package, used in messages

# Uninstall desktop shortcut
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$desktopLink = Join-Path $desktop "$packageName.lnk"
if (Test-Path ($desktopLink)) {Remove-Item $desktopLink -force}

# Uninstall start menu shortcut
$startMenu = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Programs))
$githubStartMenuGroup = Join-Path $startMenu "GitHub, Inc"
$startMenuLink = Join-Path $githubStartMenuGroup "$packageName.lnk"
if (Test-Path ($startMenuLink)) {Remove-Item $startMenuLink -force}

# Uninstall apm shortcut
$apmPath = Join-Path $nugetExePath "apm.bat"
if (Test-Path ($apmPath)) {Remove-Item $apmPath -force}
