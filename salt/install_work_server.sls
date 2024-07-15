install_work_server:
  cmd.run:
    -name: c:/salt/installers/"iManage WorkServer (x64).exe" /install /quiet /log "C:/salt/logs" SERVICE_USERNAME={{ pillar['middle-earth']['domain_account']['username'] }} SERVICE_PASSWORD={{ pillar['middle-earth']['domain_account']['password'] }} SERVICE_LOGON_TYPE=ServiceAccount PIDKEY=02003-0132264 SDK_LICENSE_PIDKEY=02003-0132814 APACHE_SERVER_NAME={{ pillar['middle-earth']['url'] }}.chisupport.local SSLCERT=C:/salt/certs/work.crt SSLKEY=c:/salt/certs/work.key

install_work_web_server:
  cmd.run:
    -name: iManageWorkWebServer.exe /install /quiet /log "C:/salt/logs" PIDKEY=02004-0134805

install_control_center:
  cmd.run:
    -name: iManageControlCenter.exe /install /quiet /log "C:/salt/logs"




