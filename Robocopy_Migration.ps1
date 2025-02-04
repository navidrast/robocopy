# Define source and destination paths
$SourcePath = "\\SOURCE_SERVER\SharedFolder"
$DestinationPath = "\\POWERSTORE_SERVER\TargetFolder"

# Set up log file paths
$LogFile = "C:\MigrationLogs\RobocopyMigration.log"
$ErrorLogFile = "C:\MigrationLogs\RobocopyErrors.log"

# Define bandwidth throttling schedule (KBps)
$ThrottlingSchedule = @{
    "00:00-06:00" = 50000;  # 50 MBps during off-hours
    "06:01-18:00" = 20000;  # 20 MBps during peak hours
    "18:01-23:59" = 35000;  # 35 MBps during evening hours
}

# Function to determine current bandwidth limit
function Get-BandwidthLimit {
    $currentTime = (Get-Date).ToString("HH:mm")
    foreach ($timeRange in $ThrottlingSchedule.Keys) {
        $start, $end = $timeRange -split "-"
        if ($currentTime -ge $start -and $currentTime -le $end) {
            return $ThrottlingSchedule[$timeRange]
        }
    }
    return 20000  # Default limit if not found
}

# Get current bandwidth limit
$BandwidthLimit = Get-BandwidthLimit

# Robocopy options
$RobocopyCommand = "robocopy `"$SourcePath`" `"$DestinationPath`" /MIR /COPYALL /R:5 /W:5 /MT:32 /IPG:$BandwidthLimit /LOG+:$LogFile /V /TEE /NP /XD `"$Recycle.Bin`" `"System Volume Information`""

# Execute the Robocopy command
Write-Output "Starting file migration from $SourcePath to $DestinationPath..."
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $RobocopyCommand" -NoNewWindow -Wait

# Error Handling & Logging
if ($LASTEXITCODE -ge 8) {
    Write-Output "Robocopy encountered errors. Check the log: $ErrorLogFile"
    Add-Content -Path $ErrorLogFile -Value "Robocopy migration encountered errors. Check the log at $LogFile"
} else {
    Write-Output "Migration completed successfully!"
}