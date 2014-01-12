#  Personal Boxen Manifest
#  File: /opt/boxen/repo/modules/people/manifests/webbj74.pp
#
#  Requires the following added to Puppetfile:
#
#      github "fitbit","1.0.0.9.1", :repo => "webbj74/puppet-fitbit"
#      github "skype", "1.0.8"
#      github "toggl", "1.0.2.907", :repo => "webbj74/puppet-toggl"
#      github "wget",  "1.0.0"
#
#  References:
#  - example manifest - https://gist.github.com/wfarr/d0fbd5f8961ec6f32bdf
#  - example manifest - https://gist.github.com/jbarnette/2c07b3968f32ea7d9d10
#  - git aliases - http://durdn.com/blog/2012/11/22/must-have-git-aliases-advanced-examples/
class people::webbj74 {

  # apps
  include skype
  include toggl

  # brews
  include wget

  git::config::global {
    'alias.la':      value => '"!git config -l | grep alias | cut -c 7-"';
    'alias.ls':      value => 'log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate';
    'alias.ll':      value => 'log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat';
    'alias.lnc':     value => 'log --pretty=format:"%h\\ %s\\ [%cn]"';
    'alias.lds':     value => 'log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short';
    'alias.ld':      value => 'log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative';
    'alias.le':      value => 'log --oneline --decorate';
    'alias.filelog': value => 'log -u';
    'alias.fl':      value => 'log -u';
    'alias.f':       value => '"!git ls-files | grep -i"';
    'color.ui':      value => 'true';
    'core.editor':   value => 'vim';
    'core.pager':    value => '/usr/bin/less -r';
    'pull.default':  value => 'simple';
    'push.default':  value => 'simple';
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
