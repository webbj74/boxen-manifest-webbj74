#  Personal Boxen Manifest
#  File: /opt/boxen/repo/modules/people/manifests/webbj74.pp
#
#  Requires the following added to Puppetfile:
#
#      github "fitbit","1.0.0.9.1", :repo => "webbj74/puppet-fitbit"
#      github "skype", "1.0.8"
#      github "toggl", "1.0.2.908", :repo => "webbj74/puppet-toggl"
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
    'alias.ls':      value => 'log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%an]" --decorate';
    'alias.ll':      value => 'log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%an]" --decorate --numstat';
    'alias.lnc':     value => 'log --pretty=format:"%h\\ %s\\ [%an]"';
    'alias.lds':     value => 'log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%an]" --decorate --date=short';
    'alias.ld':      value => 'log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%an]" --decorate --date=relative';
    'alias.le':      value => 'log --oneline --decorate';
    'alias.filelog': value => 'log -u';
    'alias.fl':      value => 'log -u';
    'alias.f':       value => '"!git ls-files | grep -i"';
    'alias.graph':   value => 'log --all --graph --decorate --oneline -n30';
    'alias.grep':    value => 'grep -EIi';
    'alias.sync':    value => '"!f() { git checkout master && git fetch --all && git rebase upstream/master && git push -f origin master; }; f"';
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

      #
      # These packages were basically useless; retaining as examples only
      #
      # package { 'BrotherWirelessSetupWizard':
      #   provider => 'pkgdmg',
      #   source   => 'http://download.brother.com/welcome/dlf004989/BrotherWDSW_200.dmg',
      # }
      # package { 'BrotherAdminLight':
      #   provider => 'pkgdmg',
      #   source   => 'http://download.brother.com/welcome/dlf004934/BRAdminLight_Code_1224a.dmg',
      # }
      #
    }
    'acquia-un-nefer': {
      notify{"Loading work":}

      # backup for aliases already stored in acquia/support-cli
      git::config::global {
        'alias.origin-release':  value => '"!f() { ACQUIA_REMOTE=$(git remote -v | grep -m 1 \"git@github.com:webbj74/support-cli.git (push)\" | cut -f1) && RELEASE_TAG=$(date -u +release-%F-%H-%M) && git tag -a ${RELEASE_TAG} && git push ${ACQUIA_REMOTE} ${RELEASE_TAG} && git --no-pager log --pretty=format:\"%n%C(yellow)%h%Creset %s%Cblue [%an]%n       %Cred%d%Creset%n\" --decorate -1; }; f"';
        'alias.origin-rollback': value => '"!f() { ACQUIA_REMOTE=$(git remote -v | grep -m 1 \"git@github.com:webbj74/support-cli.git (push)\" | cut -f1) && LATEST_TAG=$(git ls-remote --tags ${ACQUIA_REMOTE} release-* | cut -f2 | sort | tail -n1) && echo \"Rolling back ${LATEST_TAG}\" && git push ${ACQUIA_REMOTE} :${LATEST_TAG} && LATEST_TAG=$(git ls-remote --tags ${ACQUIA_REMOTE} release-* | cut -f2 | sort | tail -n1) && git --no-pager log --pretty=format:\"%nProd is now ${LATEST_TAG}%n%C(yellow)%h%Creset %s%Cblue [%an]%n       %Cred%d%Creset%n\" --decorate -1 ${LATEST_TAG}; }; f"';
        'alias.prod-release':    value => '"!f() { ACQUIA_REMOTE=$(git remote -v | grep -m 1 \"git@github.com:acquia/support-cli.git (push)\" | cut -f1) && RELEASE_TAG=$(date -u +release-%F-%H-%M) && git tag -a ${RELEASE_TAG} && git push ${ACQUIA_REMOTE} ${RELEASE_TAG} && git --no-pager log --pretty=format:\"%n%C(yellow)%h%Creset %s%Cblue [%an]%n       %Cred%d%Creset%n\" --decorate -1; }; f"';
        'alias.prod-rollback':   value => '"!f() { ACQUIA_REMOTE=$(git remote -v | grep -m 1 \"git@github.com:acquia/support-cli.git (push)\" | cut -f1) && LATEST_TAG=$(git ls-remote --tags ${ACQUIA_REMOTE} release-* | cut -f2 | sort | tail -n1) && echo \"Rolling back ${LATEST_TAG}\" && git push ${ACQUIA_REMOTE} :${LATEST_TAG} && LATEST_TAG=$(git ls-remote --tags ${ACQUIA_REMOTE} release-* | cut -f2 | sort | tail -n1) && git --no-pager log --pretty=format:\"%nProd is now ${LATEST_TAG}%n%C(yellow)%h%Creset %s%Cblue [%an]%n       %Cred%d%Creset%n\" --decorate -1 ${LATEST_TAG}; }; f"';
      }
    }
  }
}

