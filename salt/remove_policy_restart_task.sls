{% set regionID = salt['pillar.get']('regional:region.id') %}
{% set vaultID = salt['pillar.get']('regional:region.vault.store') %}
{% set custID = grains['id'].split(regionID)[0]|string %}
{% set svcpw = salt['vault'].read_secret("" +vaultID + "/" +custID + "/irm/irmadsvc", 'password') %}
{% set svcaccount = salt['pillar.get']('irm:' +custID + ':svc_account') %}

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
create_scheduled_task:
  cmd.run:
    - name: 'schtasks /delete /tn "restart_policy_service" /f'
    - shell: powershell
    - runas: "{{ svcaccount }}"
    - password: "{{ svcpw }}"
