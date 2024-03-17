Pod::Spec.new do |s|
  s.name             = 'Playwire'
  s.version          = '9.2.1'
  s.summary          = 'Playwire SDK'
  s.homepage         = 'https://www.playwire.com'
  s.license          = { :type => 'Custom', :file => 'LICENSE' }
  s.author           = { 'ios.team' => 'mobile.team@playwire.com' }
  s.source           = { :git => 'https://github.com/intergi/playwire-ios-pods.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'
  s.cocoapods_version = '>= 1.10'
  s.requires_arc = true

  s.default_subspecs = "Total"
  
  s.subspec "Core" do |ss|
    ss.vendored_frameworks = 'sdks/Playwire.xcframework'
    ss.preserve_paths =  'sdks/Playwire.xcframework/*'
    
    ss.dependency 'Google-Mobile-Ads-SDK', '10.14.0'
    ss.dependency 'FirebaseAnalytics'
  end
  
  s.subspec "Coppa" do |ss|
    ss.dependency 'Playwire/Core', "#{s.version}"

    ss.vendored_frameworks = 'sdks/Playwire_COPPA.xcframework'
    ss.preserve_paths =  'sdks/Playwire_COPPA.xcframework/*'

    ss.dependency 'GoogleMobileAdsMediationAdColony', '4.9.0.2'
    ss.dependency 'GoogleMobileAdsMediationChartboost', '9.6.0.0'
    ss.dependency 'GoogleMobileAdsMediationInMobi', '10.6.0.0'
    ss.dependency 'GoogleMobileAdsMediationIronSource', '7.7.0.0.0'
    ss.dependency 'GoogleMobileAdsMediationVungle', '7.2.2.0'
  end
  
  s.subspec "Total" do |ss|
    ss.vendored_frameworks = 'sdks/Playwire_NonCOPPA.xcframework', 'sdks/PrebidMobile.xcframework'
    ss.preserve_paths =  'sdks/Playwire_NonCOPPA.xcframework/*', 'sdks/PrebidMobile.xcframework/*'

    ss.dependency 'Playwire/Coppa', "#{s.version}"

    ss.dependency 'GoogleMobileAdsMediationFyber', '8.2.6.0'
    ss.dependency 'GoogleMobileAdsMediationPangle', '5.7.0.7.0'
    ss.dependency 'GoogleMobileAdsMediationAppLovin', '12.1.0.1'
    ss.dependency 'GoogleMobileAdsMediationFacebook', '6.14.0.0'
    ss.dependency 'AmazonPublisherServicesSDK', '4.7.8'

  end
  
  s.user_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC',
    'SWIFT_INCLUDE_PATHS' => '"$(PODS_ROOT)/Playwire/**" "$(PODS_XCFRAMEWORKS_BUILD_DIR)/**"'
  }
end