Before do
  profile = Selenium::WebDriver::Firefox::Profile.new

  profile.native_events = true
  profile.add_extension File.expand_path("#{File.join(File.dirname(__FILE__), 'firebug-1.11.4b1.xpi')}", __FILE__)
  profile.add_extension File.expand_path("#{File.join(File.dirname(__FILE__), 'fireStarter-0.1a6.xpi')}", __FILE__)
  profile.add_extension File.expand_path("#{File.join(File.dirname(__FILE__), 'netExport-0.9b3.xpi')}", __FILE__)

  p File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'performance_out') , __FILE__)

  profile['extensions.firebug.currentVersion'] = "1.11.4b1"
  profile['extensions.firebug.allPagesActivation'] = "on"
  profile['extensions.firebug.activateSameOrigin'] = true
  profile['extensions.firebug.framePosition'] = "bottom"
  profile['extensions.firebug.previousPlacement'] = 1
  profile['extensions.firebug.net.enableSites'] = true
  profile['extensions.firebug.addonBarOpened'] = true
  profile['extensions.firebug.console.enableSites'] = true
  profile['extensions.firebug.defaultPanelName'] = "net"
  profile['extensions.firebug.netexport.alwaysEnableAutoExport'] = true
  profile['extensions.firebug.netexport.autoExportToFile'] = true
  #profile['extensions.firebug.netexport.beaconServerURL'] = 'http://localhost/showslow/beacon/har/'
  profile['extensions.firebug.netexport.defaultLogDir'] = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'performance_out') , __FILE__)

  @browser = Watir::Browser.new :firefox, :profile => profile

end

After do
  @browser.close
end