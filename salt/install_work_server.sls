{% set work_server_version = pillar['middle_earth']['work_server_version'] %}
{% set work_web_server_version = pillar['middle_earth']['work_web_server_version'] %}
{% set control_center_version = pillar['middle_earth']['control_center_version'] %}

install_work_server:
  cmd.run:
    -name: '"c:/salt/installers/iManage Work Server {{ work_server_version }}/iManage WorkServer (x64).exe" /install /quiet /log "C:/salt/logs" SERVICE_USERNAME={{ pillar['middle_earth']['domain_account']['username'] }} SERVICE_PASSWORD={{ pillar['middle_earth']['domain_account']['password'] }} SERVICE_LOGON_TYPE=ServiceAccount PIDKEY=02003-0132264 SDK_LICENSE_PIDKEY=02003-0132814 APACHE_SERVER_NAME={{ pillar['middle_earth']['url'] }}.chisupport.local SSLCERT=C:/salt/certs/work.crt SSLKEY=c:/salt/certs/work.key'

install_work_web_server:
  cmd.run:
    -name: '"c:/salt/installers/iManage Work Web Server {{ work_web_server_version }}/iManageWorkWebServer.exe" /install /quiet /log "C:/salt/logs" PIDKEY=02004-0134805'

install_control_center:
  cmd.run:
    -name: '"c:/salt/installers/iManage Control Center {{ control_center_version}}/iManageControlCenter.exe" /install /quiet /log "C:/salt/logs"'




