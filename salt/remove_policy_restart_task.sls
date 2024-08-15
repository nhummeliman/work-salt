# Remove the powershell script
 delete_copied_file:
  file.absent:
    - name: "c:/tmp/GOV-34340/restart_policy_service.ps1"

# Remove the log file
 delete_log_file:   
  file.absent:
    - name: ""c:/tmp/GOV-34340/bound_counts.txt"

# State to delete the scheduled task
delete_scheduled_task:
  schedule.task:
    - name: Policy Service Restart
    - force: True
    - action: Delete