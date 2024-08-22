delete_ps_file:
  file.absent:
    - name: "c:/tmp/GOV-34340/Restart_policy_service.ps1"

delete_log_file:   
  file.absent:
    - name: "c:/tmp/GOV-34340/bound_counts.txt"

delete_xml_file:   
  file.absent:
    - name: "c:/tmp/GOV-34340/task.xml"

# State to delete the scheduled task
Gov-34340_Scheduled_Task_Remove:
  schedule.absent:
    - name: 'Gov-34340_Scheduled_Task'
