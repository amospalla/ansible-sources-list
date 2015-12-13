Debian / Ubuntu sources list generator role for Ansible

List of repositories in the role:
- Debian: ['main', 'security', 'nodejs-0.12', 'backports']
- Ubuntu: ['main', 'security', 'updates', 'backports', 'partner', 'extras', 'libreoffice', 'wine', 'i3', 'google chrome', 'oracle java', 'owncloud', 'winswitch', 'x2go', 'nodejs-0.12', 'getdeb', 'playonlinux']
  extras repository doesn't have public key
	  i3 repositoriy public key can be installed with the sur5r-keyring package once the repository is enabled

Variables:

sources_list_proxy: host:port
sources_list_use_proxy: Boolean
sources_list_use_optional_repositories: list with optional repositories to use

sources_list_repositories: # definitions of custom repositories
    - name: some name # (used by sources_list_use_optional_repositories list)
      optional: Boolean # (when false the repo has to be included in sources_list_use_optional_repositories to be used)
      url: ftp.es.debian.org # (for example)
      protocol: http
      distribution_postfix: some examples are "/updates" or "-security"
      sections: ['main', 'contrib', 'non-free']
