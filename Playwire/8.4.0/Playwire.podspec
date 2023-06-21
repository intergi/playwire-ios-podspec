Pod::Spec.new do |s|
  s.name             = 'Playwire'
  s.version          = '8.4.0'
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
    
    ss.dependency 'Google-Mobile-Ads-SDK', '10.4.0'
    ss.dependency 'FirebaseAnalytics'
  end
  
  s.subspec "Coppa" do |ss|
    ss.dependency 'Playwire/Core', "#{s.version}"

    ss.vendored_frameworks = 'sdks/Playwire_COPPA.xcframework'
    ss.preserve_paths =  'sdks/Playwire_COPPA.xcframework/*'

    ss.dependency 'GoogleMobileAdsMediationAdColony'
    ss.dependency 'GoogleMobileAdsMediationChartboost'
    ss.dependency 'GoogleMobileAdsMediationInMobi'
    ss.dependency 'GoogleMobileAdsMediationIronSource'
    ss.dependency 'GoogleMobileAdsMediationVungle', '6.12.3.0'

  end
  
  s.subspec "Total" do |ss|
    ss.vendored_frameworks = 'sdks/Playwire_NonCOPPA.xcframework', 'sdks/PrebidMobile.xcframework'
    ss.preserve_paths =  'sdks/Playwire_NonCOPPA.xcframework/*', 'sdks/PrebidMobile.xcframework/*'

    ss.dependency 'Playwire/Coppa', "#{s.version}"

    ss.dependency 'AmazonPublisherServicesSDK', '4.1.0'
    ss.dependency 'GoogleMobileAdsMediationFyber'
    ss.dependency 'GoogleMobileAdsMediationPangle'
    ss.dependency 'GoogleMobileAdsMediationAppLovin'


  end
  
  # Adding excluded archs because of failing lint process (some dependencies still don't support arm64)
  # https://stackoverflow.com/a/63955114/6245536
  s.pod_target_xcconfig = { 
    "VALID_ARCHS[sdk=iphonesimulator*]" => "x86_64",
    "VALID_ARCHS[sdk=iphoneos*]" =>  "arm64 armv7"
  }

  s.user_target_xcconfig = {
    "VALID_ARCHS[sdk=iphonesimulator*]" => "x86_64",
    'OTHER_LDFLAGS' => '-ObjC',
    'SWIFT_INCLUDE_PATHS' => '"$(PODS_ROOT)/Playwire/**" "$(PODS_XCFRAMEWORKS_BUILD_DIR)/**"'
  }
end