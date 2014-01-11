# Personal Boxen Manifest
# File: /opt/boxen/repo/modules/people/manifests/webbj74.pp
#
# Requires the following added to Puppetfile:
#
#     github "fitbit","1.0.0.9.1", :repo => "webbj74/puppet-fitbit"
#     github "skype", "1.0.8"
#     github "toggl", "1.0.2"
#
class people::webbj74 {
  include fitbit::force
  include skype
  include toggl
}
