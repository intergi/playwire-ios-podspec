Pod::Spec.new do |s|
  s.name             = 'PlaywireMobile'
  s.version          = '5.1.0'
  s.summary          = 'PlaywireMobile SDK'
  s.homepage         = 'https://www.playwire.com'
  s.license          = { :type => 'Custom', :file => 'LICENSE' }
  s.author           = { 'ios.team' => 'mobile.team@playwire.com' }
  s.source           = { :git => 'https://github.com/intergi/PlaywireMobile.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.cocoapods_version = '>= 1.12.1'
  s.requires_arc = true

  s.default_subspecs = "Core"
  
  s.subspec "Core" do |ss|
    ss.vendored_frameworks = 'PlaywireMobile.xcframework'
    ss.preserve_paths =  'PlaywireMobile.xcframework/*'
  end
  
  s.subspec "VAST" do |ss|
    ss.vendored_frameworks = 'PlaywireMobileVAST.xcframework'
    ss.preserve_paths =  'PlaywireMobileVAST.xcframework/*'

    ss.dependency 'PlaywireMobile/Core', "#{s.version}"

    ss.dependency 'GoogleAds-IMA-iOS-SDK', '~> 3.22.1'

  end
  
  s.user_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC',
    'SWIFT_INCLUDE_PATHS' => '"$(PODS_ROOT)/PlaywireMobile/**" "$(PODS_XCFRAMEWORKS_BUILD_DIR)/**"'
  }
end