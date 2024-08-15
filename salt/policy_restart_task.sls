copy_powershell_file:
  file.managed:
    - name: "c:/tmp/GOV-34340/Restart_policy_service.ps1"
    - source: "salt://resources/Restart_policy_service.ps1"
    - makedirs: True


create_scheduled_task:
  schedule.task:
    - name: Policy Service Restart
    - action_type: Execute
    - cmd: 'powershell.exe -File "c:/tmp/GOV-34340/Restart_policy_service.ps1"'
    - user_name: 'chisupport.local\\nhummel'
    - password: 'Mhdocs123'  
    - start_time: '00:00'  
    - start_date: '2023-08-14'  
    - trigger_type: Daily
    - days_interval: 1
    - repeat_interval: 'PT10M'  # ISO 8601 duration format (PT10M = 10 minutes)
    - enabled: True
    - require:
      - file: copy_powershell_file
