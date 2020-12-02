$expense = get-content .\day1.input | %{[int]$_}
$answers = $expense | where {
    $expense -contains (2020 - $_)
}
$answers[0] * $answers[1]

$i = 0
do {
    $a = $expense[$i++]
    $f = 2020 - $a
    $answer = $expense | where {$expense -contains ($f - $_)}
} while ($answer.count -lt 2)
$a * $answer[0] * $answer[1]