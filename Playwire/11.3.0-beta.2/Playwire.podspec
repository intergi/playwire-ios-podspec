Pod::Spec.new do |s|
  s.name             = 'Playwire'
  s.version          = '11.3.0-beta.2'
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

    ss.dependency 'Google-Mobile-Ads-SDK', '12.0.0'
    ss.dependency 'FirebaseAnalytics', '~> 11'
    ss.dependency 'GoogleUserMessagingPlatform', '2.5.0'
    ss.dependency 'PlaywireMobile/VAST', '6.1.0'
  end
  
  s.subspec "Coppa" do |ss|
    ss.dependency 'Playwire/Core', "#{s.version}"

    ss.vendored_frameworks = 'sdks/Playwire_COPPA.xcframework'
    ss.preserve_paths =  'sdks/Playwire_COPPA.xcframework/*'

    ss.dependency 'GoogleMobileAdsMediationChartboost', '9.8.1.0'
    ss.dependency 'GoogleMobileAdsMediationInMobi', '10.8.2.0'
    ss.dependency 'GoogleMobileAdsMediationIronSource', '8.8.0.0.0'
    ss.dependency 'GoogleMobileAdsMediationVungle', '7.4.5.0'
  end
  
  s.subspec "Total" do |ss|
    ss.dependency 'Playwire/Coppa', "#{s.version}"

    ss.dependency 'AmazonPublisherServicesSDK', '5.1.0'
    ss.dependency 'PrebidMobile', '2.5.0'

    ss.dependency 'GoogleMobileAdsMediationFyber', '8.3.6.0'
    ss.dependency 'GoogleMobileAdsMediationPangle', '6.5.0.9.0'
    ss.dependency 'GoogleMobileAdsMediationAppLovin', '13.2.0.0'
    ss.dependency 'GoogleMobileAdsMediationFacebook', '6.17.1.0'

    ss.dependency 'AppLovinSDK', '13.2.0'
    ss.dependency 'AppLovinMediationAmazonAdMarketplaceAdapter', '5.1.0.0'
    ss.dependency 'AppLovinMediationChartboostAdapter', '9.8.1.0'
    ss.dependency 'AppLovinMediationFyberAdapter', '8.3.6.0'
    ss.dependency 'AppLovinMediationGoogleAdManagerAdapter', '12.0.0.0'
    ss.dependency 'AppLovinMediationGoogleAdapter', '12.0.0.0'
    ss.dependency 'AppLovinMediationInMobiAdapter', '10.8.2.0'
    ss.dependency 'AppLovinMediationIronSourceAdapter', '8.8.0.0.0'
    ss.dependency 'AppLovinMediationVungleAdapter', '7.4.5.0'
    ss.dependency 'AppLovinMediationFacebookAdapter', '6.17.1.0'
    ss.dependency 'AppLovinMediationByteDanceAdapter', '6.5.0.9.0'
    ss.dependency 'PrebidMobileMAXAdapters', '2.5.0'

    ss.resource_bundles = {
      'PlaywirePrivacy' => ['sdks/Playwire_NonCOPPA.xcframework/ios-arm64/PrivacyInfo.xcprivacy'] 
    }
  end
  
  s.user_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC',
    'SWIFT_INCLUDE_PATHS' => '"$(PODS_ROOT)/Playwire/**" "$(PODS_XCFRAMEWORKS_BUILD_DIR)/**"'
  }
end