apache_pkgs:
  pkg.installed:
    - pkgs:
      - httpd
      - mod_wsgi

apache_service:
  service.running:
    - name: httpd
    - enable: true
    - require:
      - pkg: apache_pkgs

apache_disable_default_site:
  file.absent:
    - name: /etc/httpd/sites-enabled/000-default.conf
    - watch_in:
      - service: apache_service
