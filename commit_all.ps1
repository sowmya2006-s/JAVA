$files = git status --porcelain
foreach ($line in $files) {
    if ([string]::IsNullOrWhiteSpace($line)) { continue }
    $file = $line.Substring(3)
    if ($file -match '^"(.*)"$') {
        $file = $Matches[1]
    }
    Write-Host "Adding and committing: $file"
    git add $file
    git commit -m "Update $file"
}
git push
