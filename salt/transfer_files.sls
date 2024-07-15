work_files:
  file.managed:
    - makedirs: True
    - names:
      - C:/salt/installers/filename1.zip
        - source: salt://resources/filename1.zip
      - C:/salt/installers/filename2.zip
        - source: salt://resources/filename2.zip
      - C:/salt/certs/work.crt
        - source: {{ pillar['middle-earth']['certificate']['public-key'] }}
      - C:/salt/certs/work.key
        - source: {{ pillar['middle-earth']['certificate']['private-key'] }}

extract_filename1:
  archive.extracted:
    - name: C:/desired/location/for/filename1
    - source: C:/salt/installers/filename1.zip
    - archive_format: zip
    - enforce_toplevel: False

extract_filename2:
  archive.extracted:
    - name: C:/desired/location/for/filename2
    - source: C:/salt/installers/filename2.zip
    - archive_format: zip
    - enforce_toplevel: False
