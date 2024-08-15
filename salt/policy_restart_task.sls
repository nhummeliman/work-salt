copy_powershell_file:
  file.managed:
    - name: "c:/tmp/GOV-34340/Restart_policy_service.ps1"
    - source: "salt://resources/Restart_policy_service.ps1"
    - makedirs: True


create_scheduled_task:
  win_task.create_task_from_xml:
    - name: "Policy Restart Task"
    - xml_path: "salt://resources/task.xml"
    - force: True