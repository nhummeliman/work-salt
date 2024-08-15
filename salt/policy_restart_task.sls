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


create_scheduled_task:
  cmd.run:
    - name: 'schtasks /create /tn "restart_policy_service" /xml "C:/tmp/GOV-34340/task.xml" /f /ru chisupport.local/namezaga /rp "Mhdocs123'
    - shell: powershell
    - require:
      - file: copy_powershell_file
      - file: copy_xml_file