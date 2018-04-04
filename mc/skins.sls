{% from "mc/map.jinja" import mc with context %}

include:
  - mc

mc_files_skins:
  file.recurse:
    - name: {{ mc.skins_dir }}
    - source: salt://mc/files/skins

