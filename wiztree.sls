{% load_yaml as versions -%}
- '4.18'
- '4.17'
- '4.16'
- '4.15'
- '4.13'
- '4.12'
- '4.11'
- '4.10'
- '4.09'
- '4.08'
- '4.07'
- '4.06'
- '4.05'
- '4.04'
- '4.03'
- '4.02'
- '4.01'
- '4.00'
- '3.41'
- '3.40'
- '3.39'
- '3.38'
- '3.37'
- '3.36'
- '3.35'
- '3.34'
- '3.33'
- '3.32'
- '3.31'
- '3.30'
- '3.29'
- '3.28'
- '3.27'
- '3.25'
- '3.24'
- '3.23'
- '3.22'
- '3.21'
- '3.20'
- '3.19'
- '3.18'
- '3.17'
- '3.16'
- '3.15'
- '3.14'
- '3.13'
- '3.12'
- '3.11'
- '3.10'
- '3.00'
- '2.01'
- '2.00'
- '1.07'
- '1.06'
- '1.05'
- '1.04'
- '1.03'
- '1.02'
- '1.01'
- '1.00'
{% endload -%}

{% load_yaml as uninstall_only -%}
- '4.14'
- '3.26'
{% endload -%}

{# The latest version of WizTree is hosted at a different location to the others -#}
{# so take account of that fact -#}
{% set is_not_archived = {versions[0]: ""} -%}

wiztree:
  {%- for version in versions + uninstall_only %}
  '{{ version }}':
    full_name: WizTree v{{ version }}
    {%- if version not in uninstall_only %}
    installer: https://diskanalyzer.com/files{{ is_not_archived[version]|d("/archive") }}/wiztree_{{ version|replace(".", "_") }}_setup.exe
    install_flags: /SILENT /NORESTART
    {%- endif %}
    uninstaller: '%ProgramFiles%\WizTree\unins000.exe'
    uninstall_flags: /SILENT /NORESTART
  {%- endfor %}
