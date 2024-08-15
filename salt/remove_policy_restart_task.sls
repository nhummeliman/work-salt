# Remove the powershell script
delete_copied_file:
  file.absent:
    - name: "c:/tmp/GOV-34340/Restart_policy_service.ps1"

# Remove the log file
delete_log_file:   
  file.absent:
    - name: "c:/tmp/GOV-34340/bound_counts.txt"

delete_log_file:   
  file.absent:
    - name: "c:/tmp/GOV-34340/task.xml"

# State to delete the scheduled task
create_scheduled_task:
  cmd.run:
    - name: 'schtasks /delete /tn "restart_policy_service" /f'
    - shell: powershell
