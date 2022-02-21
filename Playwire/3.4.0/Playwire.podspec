Pod::Spec.new do |s|
  s.name             = 'Playwire'
  s.version          = '3.4.0'
  s.summary          = 'Playwire SDK'
  s.homepage         = 'https://www.playwire.com'
  s.license          = { :type => 'Custom', :file => 'LICENSE' }
  s.author           = { 'ios.team' => 'mobile.team@playwire.com' }
  s.source           = { :git => 'https://github.com/intergi/playwire-ios-pods.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  s.cocoapods_version = '>= 1.10'
  s.requires_arc = true

  s.default_subspecs = "Total"
  
  s.subspec "Core" do |ss|
    ss.vendored_frameworks = 'sdks/Playwire.xcframework'
    ss.preserve_paths =  'sdks/Playwire.xcframework/*'
    
    ss.dependency 'Google-Mobile-Ads-SDK', '8.11.0' 
  end
  
  s.subspec "Amazon" do |ss|
    ss.vendored_frameworks = 'sdks/Playwire_Amazon.xcframework'
    ss.preserve_paths =  'sdks/Playwire_Amazon.xcframework/*'
    
    ss.dependency 'Playwire/Core', "#{s.version}"
    ss.dependency 'AmazonPublisherServicesSDK', '4.1.0'
  end
  
  s.subspec "Prebid" do |ss|
    ss.vendored_frameworks = 'sdks/Playwire_Prebid.xcframework', 'sdks/PrebidMobile.xcframework'
    ss.preserve_paths =  'sdks/Playwire_Prebid.xcframework/*', 'sdks/PrebidMobile.xcframework/*'
    
    ss.dependency 'Playwire/Core', "#{s.version}"
  end

  s.subspec "Smaato" do |ss|
    ss.vendored_frameworks = 'sdks/Playwire_Smaato.xcframework'
    ss.preserve_paths =  'sdks/Playwire_Smaato.xcframework/*'
    
    ss.dependency 'Playwire/Core', "#{s.version}"
    ss.dependency 'smaato-ios-sdk/Banner'
    ss.dependency 'smaato-ios-sdk-mediation-admob/Banner'
    ss.dependency 'smaato-ios-sdk/Interstitial'
    ss.dependency 'smaato-ios-sdk-mediation-admob/Interstitial'
    ss.dependency 'smaato-ios-sdk/RewardedAds'
    ss.dependency 'smaato-ios-sdk-mediation-admob/RewardedAds'
  end

  s.subspec "Coppa" do |ss|
    ss.dependency 'Playwire/Core', "#{s.version}"

    ss.dependency 'GoogleMobileAdsMediationAdColony'
    ss.dependency 'GoogleMobileAdsMediationAppLovin'
    ss.dependency 'GoogleMobileAdsMediationChartboost'
    ss.dependency 'GoogleMobileAdsMediationInMobi'
    ss.dependency 'GoogleMobileAdsMediationIronSource'
    ss.dependency 'GoogleMobileAdsMediationVungle'
  end

  
  s.subspec "Total" do |ss|
    ss.dependency 'Playwire/Coppa', "#{s.version}"

    ss.dependency 'Playwire/Amazon', "#{s.version}"
    ss.dependency 'Playwire/Prebid', "#{s.version}"
    ss.dependency 'Playwire/Smaato', "#{s.version}"

    ss.dependency 'GoogleMobileAdsMediationFyber'
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

  # Adding tests with a swift dependency is a workaround in order to make pod lib lint work
  # See: https://github.com/CocoaPods/CocoaPods/issues/8649
  s.test_spec 'Tests' do |ss|
    ss.dependency 'Result', '~> 5.0'
  end 
end