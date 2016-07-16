# Debian / Ubuntu sources list generator role for Ansible
* * *

## Description

This role generates the file sources.list for Debian 7/8 and Ubuntu 12.04/14.04/16.04 distributions.

It has a fixed set of repositories which are mandatory (like main and updates), and a set of optional repositories which can be selected with variables.

All repositories are written on sources.list file, no file is created under sources.list.d folder.

By default any file under sources.list.d folder which contains a similar line already on a new sources.list generated file is deleted. This can be disabled with _sources_list_remove_duplicates_: False.

List of managed repositories:

```
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| Repository    | Debian | Debian | Ubuntu | Ubuntu | Ubuntu |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
|               | 7      | 8      | 12.04  | 14.04  | 16.04  |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| main          | Y      | Y      | Y      | Y      | Y      |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| updates       | Y      | Y      | Y      | Y      | Y      |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| security      | Y      | Y      | Y      | Y      | Y      |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| backports     | O      | O      | O      | O      | O      |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| multimedia    | O      | O      |        |        |        |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| partner       |        |        | O      | O      | O      |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| extras        |        |        | O      | O      |        |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| winswitch     | O      | O      | O      | O      | O      |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| x2go          | O      | O      | O      | O      | O      |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| nodejs-0.12   | O      | O      | O      | O      | O      |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| virtualbox    |        | O      | O      | O      | O      |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| wine          |        | O      | O      | O      | O      |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| google_chrome |        | O      | O      | O      | O      |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| steam         | O      | O      |        | O      | O      |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| playonlinux   |        | O      | O      | O      |        |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| opera         | O      | O      |        |        |        |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| libreoffice   |        |        | O      | O      | O      |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| i3            |        |        | O      | O      | O      |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| oracle_java   |        |        | O      | O      | O      |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| owncloud      |        |        |        | O      | O      |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
| getdeb        |        |        | O      | O      | O      |
+ ------------- + ------ + ------ + ------ + ------ + ------ +
```

Y: Mandatory repository

O: Optional repository

## Variables

There are no mandatory variables.

- _sources_list_repositories_optional_: list with optional repositories to use.
- _sources_list_enable_sources_: enable generation of deb-src entries (default: True)
- _sources_list_remove_duplicates_: remove already existing sources.list.d/ files which duplicate a repository on sources.list file (default: True).
- _sources_list_repositories_: dictionary with respositories definitions. Check it on defaults/main.yml file.
```
sources_list_repositories:
  - name:
    comment:
    optional: Boolean
	src: Boolean
	releases:
	  - versions: list
        url:
        distribution_postfix:
        components:
        distribution:
        arch:
        key_id:
        key_server: / key_package: / key_url:
```
