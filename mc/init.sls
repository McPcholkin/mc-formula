{% from "mc/map.jinja" import mc with context %}

mc:
  pkg.installed:
    - name: {{ mc.pkg }}

{% if salt['pillar.get']('mc:managed_ini', True) == True %}
{{ mc.config_root }}/ini:
  file.managed:
    - source: salt://mc/files/ini.jinja
    - template: jinja
    - user: root
    - group: {{ mc.group }}
    - mode: 644
    - template: jinja
    - makedirs: True
    - require:
      - pkg: mc.pkg
{% endif %}