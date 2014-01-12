# Personal Boxen Manifest
# File: /opt/boxen/repo/modules/people/manifests/webbj74.pp
#
# Requires the following added to Puppetfile:
#
#     github "fitbit","1.0.0.9.1", :repo => "webbj74/puppet-fitbit"
#     github "skype", "1.0.8"
#     github "toggl", "1.0.2.907", :repo => "webbj74/puppet-toggl"
#     github "wget",  "1.0.0"
#
class people::webbj74 {

  # apps
  include skype
  include toggl

  # brews
  include wget

  git::config::global {
    'alias.la':     value => '"!git config -l | grep alias | cut -c 7-"';
    'color.ui':     value => 'true';
    'core.editor':  value => 'vim';
    'core.pager':   value => '/usr/bin/less';
    'pull.default': value => 'simple';
    'push.default': value => 'simple';
  }

  case $::hostname {
    'abies-alba': {
      notify{"Loading personal":}
      include fitbit::force
      include printers::brother_hl2270dw
    }
    'acquia-un-nefer': {
      notify{"Loading work":}
    }
  }
}
