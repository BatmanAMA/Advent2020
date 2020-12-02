$passwords = (gc .\day2.input) -replace '-',' ' -replace ':' | ConvertFrom-Csv -Header 'min','max','char','pw' -Delimiter ' '
$valid = $passwords | where {
    $m = [regex]::Matches($_.pw,$_.char.trim()).Count 
    $m -le $_.max -and $m -ge $_.min
}
$valid.count
######
# Part 2
######

$valid = $passwords | Where-Object {
        $pa = $_.pw.ToCharArray()
        $pa[$_.min-1] -match $_.char -xor $pa[$_.max-1] -match $_.char
    }
$valid.count