#define filepath for the bound port counts to be written to
$count_log_output = "c:/tmp/GOV-34340/bound_counts.txt"

#define port threshold
$port_count_threshold = 12000

# Filter TCP connections that are in the bound state and get a count
$bound_connections = Get-NetTCPConnection | Where-Object {$_.State -eq 'Bound'} 
$bound_count = $bound_connections.Count


# Append the count results as an entry to the count log file
$current_time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$log_entry = "$current_time - Bound Connections Count: $bound_count"
Add-Content -Path $count_log_output -Value $log_entry

# Gather size of log file, and overwite content if it exceeds 1MB
$size = (Get-ChildItem $count_log_output).Length
$size_in_MB = $size/1MB
if ($size -ge 1){
Set-Content -Path $count_log_output -Value $log_entry
}



if ($bound_count -ge $port_count_threshold) {

    # Stops the policy service, waits 30 seconds, and then starts the service again
    $current_time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $count_log_output -Value "Stopping IMFederatedFilingService"
    Stop-Service -Name "IMFederatedFilingService"
    Start-Sleep -Seconds 30
    Add-Content -Path $count_log_output -Value "Starting IMFederatedFilingService"
    Start-Service -Name "IMFederatedFilingService"

}