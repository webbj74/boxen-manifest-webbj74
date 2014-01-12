# Public: Install XQuartz into /opt/X11.
#
# Examples
#
#   include xquartz
class printers::brother_hl2270dw {
  package { 'BrotherWirelessSetupWizard':
    provider => 'pkgdmg',
    source   => 'http://download.brother.com/welcome/dlf004989/BrotherWDSW_200.dmg',
  }  
  package { 'BrotherAdminLight':
    provider => 'pkgdmg',
    source   => 'http://download.brother.com/welcome/dlf004934/BRAdminLight_Code_1224a.dmg',
  }  
}
