{% set work_server_version = pillar['middle_earth']['work_server_version'] %}
{% set work_web_server_version = pillar['middle_earth']['work_web_server_version'] %}
{% set control_center_version = pillar['middle_earth']['control_center_version'] %}

uninstall_work_server:
  cmd.run:
    - name: 'c:/salt/installers/iManage Work Server {{ work_server_version }}/iManage WorkServer (x64).exe /uninstall /quiet /log "C:/salt/logs"'

uninstall_work_web_server:
  cmd.run:
    - name: 'c:/salt/installers/iManage Work Web Server {{ work_web_server_version }}/iManageWorkWebServer.exe /uninstall /quiet /log "C:/salt/logs"'

uninstall_control_center:
  cmd.run:
    - name: 'c:/salt/installers/iManage Control Center {{ control_center_version}}/iManageControlCenter.exe /uninstall /quiet /log "C:/salt/logs"'
