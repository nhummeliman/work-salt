copy_powershell_file:
  file.managed:
    - name: "c:/tmp/GOV-34340/Restart_policy_service.ps1"
    - source: "salt://resources/Restart_policy_service.ps1"
    - makedirs: True

copy_xml_file:
  file.managed:
    - name: "C:/tmp/GOV-34340/task.xml"
    - source: "salt://resources/task.xml"
    - makedirs: True

Gov-34340_Scheduled_Task:
  schedule.present:
    - function: cmd.run
    - job_args:
      - Powershell.exe -File "C:/tmp/GOV-34340/GOV-34340_restart_ps.ps1"
    - minutes: 10
    - enabled: True
    - maxrunning: 1
    - jid_include: True
    - persist: True
