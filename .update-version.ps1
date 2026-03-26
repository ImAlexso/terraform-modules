Get-ChildItem -Recurse -Filter "versions.tf" | ForEach-Object {
    (Get-Content $_.FullName) `
        -replace 'version\s*=\s*">=\s*4\.0"', 'version = "~> 4.0"' `
    | Set-Content $_.FullName
}