#
# Be sure to run `pod lib lint KLineSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KLineSDK'
  s.version          = '1.0.0'
  s.summary          = 'A High-Performance KLine SDK'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/zzzzhongzhen/KLineSDK.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ZhongZhen' => '18701503072@163.com' }
  s.source           = { :git => 'https://github.com/zzzzhongzhen/KLineSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'KLineSDK/Classes/*.swift'
  s.swift_versions = '5.0'
    
  s.subspec 'Class' do |classes|
      classes.source_files = "KLineSDK/Classes/Class/*.swift"
#      classes.public_header_files = "KLineSDK/Classes/Class/**/*.{h}"
#      classes.dependency "#{myproject}#{myname}/Common"
  end
  
  s.subspec 'Common' do |common|
      common.source_files = "KLineSDK/Classes/Common/*.swift"
#      common.public_header_files = "KLineSDK/Classes/Common/*.{h}"
#      classes.dependency "#{myproject}#{myname}/Common"
  end


  #  s.resources    = "KLineSDK/Assets/*"
  # s.resource_bundles = {
  #   'KLineSDK' => ['KLineSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'SnapKit', '~> 5.0.1'
   s.dependency 'RxSwift', '~> 6.5.0'
   s.dependency 'RxCocoa', '~> 6.5.0'
   s.dependency 'RxSwiftExt', '~> 6.0.1'

end
