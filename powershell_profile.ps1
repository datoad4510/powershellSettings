Import-Module ZLocation

Import-Module posh-git

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History -HistoryNoDuplicates
Set-PSReadLineOption -PredictionViewStyle ListView

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/lambdageneration.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons


# Ctrl+f: search filesystem. Ctrl+r: look at command history from newest to oldest
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

Set-Alias grep Select-String