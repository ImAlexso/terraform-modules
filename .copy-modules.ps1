$basePath = ".\stacks"
$source = "$basePath\network-core"

$files = "versions.tf"

$folders = @(
    "monitoring-stack",
    "security-stack",
    "data-stack",
    "storage-stack",
    "ai-stack",
    "container-registry-stack",
    "app-stack"
)

foreach ($folder in $folders) {
    $destination = "$basePath\$folder"

    foreach ($file in $files) {
        Copy-Item "$source\$file" -Destination "$destination\" -Force
    }
}