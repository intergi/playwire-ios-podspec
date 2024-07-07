Pod::Spec.new do |s|
  s.name             = 'Playwire'
  s.version          = '10.1.0'
  s.summary          = 'Playwire SDK'
  s.homepage         = 'https://www.playwire.com'
  s.license          = { :type => 'Custom', :file => 'LICENSE' }
  s.author           = { 'ios.team' => 'mobile.team@playwire.com' }
  s.source           = { :git => 'https://github.com/intergi/playwire-ios-pods.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.cocoapods_version = '>= 1.10'
  s.requires_arc = true

  s.default_subspecs = "Total"
  
  s.subspec "Core" do |ss|
    ss.vendored_frameworks = 'sdks/Playwire.xcframework'
    ss.preserve_paths =  'sdks/Playwire.xcframework/*'
    
    ss.dependency 'Google-Mobile-Ads-SDK', '11.2.0'
    ss.dependency 'FirebaseAnalytics'
    ss.dependency 'PlaywireMobile/VAST', '3.0.0'
  end
  
  s.subspec "Coppa" do |ss|
    ss.dependency 'Playwire/Core', "#{s.version}"

    ss.vendored_frameworks = 'sdks/Playwire_COPPA.xcframework'
    ss.preserve_paths =  'sdks/Playwire_COPPA.xcframework/*'

    ss.dependency 'GoogleMobileAdsMediationChartboost', '9.7.0.0'
    ss.dependency 'GoogleMobileAdsMediationInMobi', '10.7.1'
    ss.dependency 'GoogleMobileAdsMediationIronSource', '7.9.1.0.0'
    ss.dependency 'GoogleMobileAdsMediationVungle', '7.3.0.0'
  end
  
  s.subspec "Total" do |ss|
    ss.vendored_frameworks = 'sdks/Playwire_NonCOPPA.xcframework', 'sdks/PrebidMobile.xcframework'
    ss.preserve_paths =  'sdks/Playwire_NonCOPPA.xcframework/*', 'sdks/PrebidMobile.xcframework/*'

    ss.dependency 'Playwire/Coppa', "#{s.version}"

    ss.dependency 'GoogleMobileAdsMediationFyber', '8.2.7.0'
    ss.dependency 'GoogleMobileAdsMediationPangle', '5.8.0.8.0'
    ss.dependency 'GoogleMobileAdsMediationAppLovin', '12.4.0.0'
    ss.dependency 'GoogleMobileAdsMediationFacebook', '6.15.0.0'
    ss.dependency 'AmazonPublisherServicesSDK', '4.9.2'

    ss.resource_bundles = {
      'PlaywirePrivacy' => ['sdks/Playwire_NonCOPPA.xcframework/ios-arm64/PrivacyInfo.xcprivacy'] 
    }

  end
  
  s.user_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC',
    'SWIFT_INCLUDE_PATHS' => '"$(PODS_ROOT)/Playwire/**" "$(PODS_XCFRAMEWORKS_BUILD_DIR)/**"'
  }
end