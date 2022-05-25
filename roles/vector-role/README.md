Vector role
=========

Install vector in your hosts

- `Get vector distribution`. Downloads the distribution kit of the version specified in [variables](group_vars/clickhouse/vars.yml), if it does not find the specified version, it downloads the latest stable one.
- `Install clickhouse packages`. Installs downloaded distributions.


Requirements
------------

tested only on centos 7

Role Variables
--------------

Variables is used: 
- `vector_version`  
  example
  `vector_version: "0.21.1"`  
  if version is not specified, latest version will be installed



Example Playbook
----------------

    - hosts: servers
      roles:
         - vector-role

