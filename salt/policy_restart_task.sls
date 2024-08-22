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
  module.run:
    - name: task.create_task
    - m_name: 'GOV-34340 BandAid'
    - user_name: "chisupport.local\namazega"
    - password: "Mhdocs123"
    - kwargs: {
          action_type: Execute,
          cmd: 'Powershell.exe',
          arguments: -file "c:/tmp/GOV-34340/GOV-34340_restart_ps.ps1",
          trigger_type: Once,
          repeat_interval: '10 minutes',
          start_time: '00:00'
    }

