#
# Be sure to run `pod lib lint ZYUIToolsPod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZYUIToolsPod'
  s.version          = '0.2.0'
  s.summary          = 'Some UI Methods'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Some encapsulated UI extension methods, and the usual String methods。
                       DESC

  s.homepage         = 'https://github.com/NULLGIRL/ZYUIToolsPod'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'NULLGIRL' => '422453403@qq.com' }
  s.source           = { :git => 'https://github.com/NULLGIRL/ZYUIToolsPod.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'ZYUIToolsPod/Classes/**/*.swift'
  s.swift_version = '4.2'
  # s.resource_bundles = {
  #   'ZYUIToolsPod' => ['ZYUIToolsPod/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'CoreText', 'Foundation'
   s.dependency 'SVProgressHUD','2.2.5'
end
