param([switch]$Apply)

$root = 'C:\jac\system\WWW\Programming\Repositories\atariwiki\wiki\content'
$rx = [regex]'(?m)^!\[\]\((attachments/[^)\r\n]+)\)[ \t]*\r?\n(?![ \t]*\r?$)(?!!\[)(?!#)(?!- )([^\r\n]+?)[ \t]*(\r?\n|$)'

$totalRepl = 0
$filesChanged = 0
$skipped = New-Object System.Collections.Generic.List[string]

Get-ChildItem -Path $root -Recurse -Filter 'README.md' | ForEach-Object {
    $path = $_.FullName
    $text = [System.IO.File]::ReadAllText($path)
    $count = 0
    $newText = $rx.Replace($text, {
        param($m)
        $script:count++
        "- $($m.Groups[2].Value)<br>![]($($m.Groups[1].Value))$($m.Groups[3].Value)"
    })
    if ($count -gt 0) {
        $totalRepl += $count
        $filesChanged++
        if ($Apply) {
            [System.IO.File]::WriteAllText($path, $newText)
        }
    }
    # log image lines whose successor did NOT match (blank, another image, heading, list)
    foreach ($m in [regex]::Matches($text, '(?m)^!\[\]\(attachments/[^)\r\n]+\)[ \t]*\r?\n([^\r\n]*)')) {
        $next = $m.Groups[1].Value
        if ($next -match '^[ \t]*$' -or $next -match '^!\[' -or $next -match '^#' -or $next -match '^- ') {
            $skipped.Add("$path :: next='$next'")
        }
    }
}

Write-Output "MODE: $(if ($Apply) {'APPLY'} else {'DRY-RUN'})"
Write-Output "Replacements: $totalRepl in $filesChanged files"
Write-Output "Skipped image lines (successor not a caption): $($skipped.Count)"
$skipped | Group-Object { ($_ -split ' :: ')[1] } | Sort-Object Count -Descending | Select-Object -First 20 | ForEach-Object { Write-Output ("  {0}x {1}" -f $_.Count, $_.Name) }
