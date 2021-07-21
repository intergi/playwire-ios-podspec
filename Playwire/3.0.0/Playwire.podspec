Pod::Spec.new do |s|
  s.name             = 'Playwire'
  s.version          = '3.0.0'
  s.summary          = 'Playwire SDK'
  s.homepage         = 'https://www.playwire.com'
  s.license          = { :type => 'Custom', :file => 'LICENSE' }
  s.author           = { 'ios.team' => 'mobile.team@playwire.com' }
  s.source           = { :git => 'git@github.com:intergi/playwire-ios-pods.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  s.cocoapods_version = '>= 1.10'
  s.requires_arc = true

  s.default_subspecs = "Total"
  
  s.subspec "Core" do |ss|
    ss.vendored_frameworks = 'sdks/Playwire.xcframework'
    ss.preserve_paths =  'sdks/Playwire.xcframework/*'
    
    ss.dependency 'GoogleUserMessagingPlatform', '~> 1.2.0'
    ss.dependency 'Google-Mobile-Ads-SDK', '~> 7.60.0' 
  end
  
  s.subspec "Amazon" do |ss|
    ss.vendored_frameworks = 'sdks/Playwire_Amazon.xcframework'
    ss.preserve_paths =  'sdks/Playwire_Amazon.xcframework/*'
    
    ss.dependency 'Playwire/Core', "#{s.version}"
    ss.dependency 'AmazonPublisherServicesSDK', '~> 3.3.0'
  end
  
  s.subspec "Prebid" do |ss|
    ss.vendored_frameworks = 'sdks/Playwire_Prebid.xcframework', 'sdks/PrebidMobile.framework'
    ss.preserve_paths =  'sdks/Playwire_Prebid.xcframework/*'
    
    ss.dependency 'Playwire/Core', "#{s.version}"
  end

  s.subspec "Smaato" do |ss|
    ss.vendored_frameworks = 'sdks/Playwire_Smaato.xcframework'
    ss.preserve_paths =  'sdks/Playwire_Smaato.xcframework/*'
    
    ss.dependency 'Playwire/Core', "#{s.version}"
    ss.dependency 'SmaatoSDK', '~> 10.2.7'
  end
  
  s.subspec "Total" do |ss|
    ss.dependency 'Playwire/Amazon', "#{s.version}"
    ss.dependency 'Playwire/Prebid', "#{s.version}"
    ss.dependency 'Playwire/Smaato', "#{s.version}"

    ss.dependency 'GoogleMobileAdsMediationAdColony', '4.1.5.0'
    ss.dependency 'GoogleMobileAdsMediationAppLovin', '6.12.8.0'
    ss.dependency 'GoogleMobileAdsMediationChartboost', '8.1.0.1'
    ss.dependency 'GoogleMobileAdsMediationFyber', '7.5.6.0'
    ss.dependency 'GoogleMobileAdsMediationInMobi', '9.0.7.0'
    ss.dependency 'GoogleMobileAdsMediationIronSource', '6.16.3.0'
    ss.dependency 'GoogleMobileAdsMediationVungle', '6.5.3.0'

  end
  
  # Adding excluded archs because of failing lint process (some dependencies still don't support arm64)
  # https://stackoverflow.com/a/63955114/6245536
  s.pod_target_xcconfig = { 
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
    'SWIFT_INCLUDE_PATHS' => "$(PODS_XCFRAMEWORKS_BUILD_DIR)/**"
  }

  # Adding tests with a swift dependency is a workaround in order to make pod lib lint work
  # See: https://github.com/CocoaPods/CocoaPods/issues/8649
  s.test_spec 'Tests' do |ss|
    ss.dependency 'Result', '~> 5.0'
  end 
end