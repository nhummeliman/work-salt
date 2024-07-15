/tmp/test_file.txt:
  file.managed:
    - contents: {{ pillar['test_pillar']['value'] }}