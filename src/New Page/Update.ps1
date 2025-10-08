$company = '162915c7-5408-f011-9af6-6045bde9c6b1'
$itemId = '11f0b0fa-5408-f011-9af6-6045bde9c6b1'
$base = 'https://api.businesscentral.dynamics.com/v2.0/23a0c336-e5f0-4bbc-90b2-2899179cbbb5/ImeshSand/api/ImeshNirmal/app1/v1.0'
$url = "$base/companies($company)/items($itemId)"

# 1) GET via Invoke-RestMethod (gets body easily)
try {
  $getBody = Invoke-RestMethod -Uri $url -Method Get -Headers @{
    Authorization = "Bearer $token"
    Accept = "application/json"
  }
} catch {
  Write-Host "GET failed:" $_.Exception.Message
  return
}

# 2) Try to extract ETag from body first
$etag = $null
if ($getBody -and $getBody.'@odata.etag') {
  $etag = $getBody.'@odata.etag'
  Write-Host "ETag from body:" $etag
}

# 3) Fallback: try to read ETag header using Invoke-WebRequest
if (-not $etag) {
  $web = Invoke-WebRequest -Uri $url -Method Get -Headers @{
    Authorization = "Bearer $token"
    Accept = "application/json"
  }
  # check common header name casings
  if ($web.Headers.ETag) { $etag = $web.Headers.ETag }
  elseif ($web.Headers.'ETag') { $etag = $web.Headers.'ETag' }
  elseif ($web.Headers.'etag') { $etag = $web.Headers.'etag' }
  Write-Host "ETag from header (if any):" $etag
}

# 4) Last-resort fallback (use with caution)
if (-not $etag) {
  Write-Host "Warning: no ETag found in body or header. Using If-Match: * (force update)."
  $etag = '*'
}

# 5) PATCH with chosen If-Match
$patchBody = @{ description = "ATHENS Desk - Updated Description1" } | ConvertTo-Json

try {
  $patchResult = Invoke-RestMethod -Uri $url -Method Patch -Headers @{
    Authorization = "Bearer $token"
    "Content-Type" = "application/json"
    "If-Match" = $etag
    Accept = "application/json"
  } -Body $patchBody

  Write-Host "PATCH succeeded. Server returned:"
  $patchResult | ConvertTo-Json -Depth 5
}
catch {
  Write-Host "PATCH failed:" $_.Exception.Message
  if ($_.Exception.Response) {
    try { $err = $_.Exception.Response.Content; Write-Host "Response body:"; Write-Host $err } catch { }
  }
}