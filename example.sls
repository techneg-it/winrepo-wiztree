{% load_yaml as versions -%}
- '1.0'
{% endload -%}

example:
  {% for version in versions -%}
  '{{ version }}':
    full_name: Example Application
    installer: https://download-installer.cdn.mozilla.net/pub/firefox/releases/{{ version }}/win32/en-US/Firefox%20Setup%20{{ version }}.exe
    install_flags: /S
    uninstaller: '%ProgramFiles%\example\uninstall.exe'
    uninstall_flags: /S
  {% endfor -%}
