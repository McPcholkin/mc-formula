{% from "mc/map.jinja" import mc with context %}

mc:
  pkg.installed:
    - name: {{ mc.pkg }}

{% if salt['pillar.get']('mc:managed_ini', True) == True %}
mc_files_ini:
  file.managed:
    - name: {{ mc.config_root }}/ini
    - source: salt://mc/files/config/ini.jinja
    - user: root
    - group: {{ mc.group }}
    - mode: 644
    - template: jinja
    - makedirs: True
    - require:
      - pkg: mc

mc_files_panels_ini:
  file.managed:
    - name: {{ mc.config_root }}/panels.ini
    - source: salt://mc/files/config/panels.ini.jina
    - user: root
    - group: {{ mc.group }}
    - mode: 644
    - template: jinja
    - makedirs: True
    - require:
      - pkg: mc

{% endif %}
