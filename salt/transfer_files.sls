{% set work_server_version = pillar['middle_earth']['work_server_version'] %}
{% set work_web_server_version = pillar['middle_earth']['work_web_server_version'] %}
{% set control_center_version = pillar['middle_earth']['control_center_version'] %}

work_files:
  file.managed:
    - makedirs: True
    - names:
      - name: C:/salt/installers/iManage Work Server {{ work_server_version }}.zip
        source: salt://resources/iManage Work Server {{ work_server_version }}.zip
      - name: C:/salt/installers/iManage Work Web Server {{ work_web_server_version }}.zip
        source: salt://resources/iManage Work Web Server {{ work_web_server_version }}.zip
      - name: C:/salt/installers/iManage Control Center {{ control_center_version }}.zip
        source: salt://resources/iManage Control Center {{ control_center_version }}.zip
      - name: C:/salt/certs/work.crt
        source: {{ pillar['middle_earth']['certificate']['public_key'] }}
      - name: C:/salt/certs/work.key
        source: {{ pillar['middle_earth']['certificate']['private_key'] }}

extract_work_server:
  archive.extracted:
    - name: C:/salt/installers
    - source: C:/salt/installers/iManage Work Server {{ work_server_version }}.zip
    - archive_format: zip
    - enforce_toplevel: False

extract_work_web_server:
  archive.extracted:
    - name: C:/salt/installers
    - source: C:/salt/installers/iManage Work Web Server {{ work_web_server_version }}.zip
    - archive_format: zip
    - enforce_toplevel: False

extract_control_center:
  archive.extracted:
    - name: C:/salt/installers
    - source: C:/salt/installers/iManage Control Center {{ control_center_version }}.zip
    - archive_format: zip
    - enforce_toplevel: False