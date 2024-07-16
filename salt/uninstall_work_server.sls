uninstall_work_server:
  cmd.run:
    - name: "c:/salt/installers/iManage WorkServer (x64).exe" /uninstall /quiet /log "C:/salt/logs 

uninstall_work_web_server:
  cmd.run:
    - name: "c:/salt/installers/iManageWorkWebServer.exe" /uninstall /quiet /log "C:/salt/logs"" 

uninstall_control_center:
  cmd.run:
    - name: "c:/salt/installers/iManageControlCenter.exe" /uninstall /quiet /log "C:/salt/logs"




