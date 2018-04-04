{% from "mc/map.jinja" import mc with context %}

mc:
  pkg.removed:
    - name: {{ mc.pkg }}


