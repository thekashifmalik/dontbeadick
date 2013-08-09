nginx:
  pkg:
    - latest
  service:
    - running
    - watch:
      - file: nginxconf


nginxconf:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://nginx/nginx.conf
    - template: jinja
    - makedirs: True
    - mode: 755
    - require:
    	- pkg: nginx