{% from "apache/map.jinja" import apache with context %}

apache_pkgs:
  pkg.installed:
    - pkgs:
      - {{ apache.pkg }}
      {% for module in apache.modules %}
      - {{ module }}
      {% endfor %}

apache_service:
  service.running:
    - name: {{ apache.service }}
    - enable: true
    - require:
      - pkg: apache_pkgs

apache_disable_default_site:
  file.absent:
    - name: {{ apache.defaultsite }}
    - watch_in:
      - service: apache_service
