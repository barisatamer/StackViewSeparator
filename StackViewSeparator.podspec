#
# Be sure to run `pod lib lint StackViewSeparator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StackViewSeparator'
  s.version          = '0.1.0'
  s.summary          = 'An extension to adding separators to UIStackViews'
  s.swift_version    = '4.1'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
An extension to add separator views to UIStackView, written in Swift 4.0
                       DESC

  s.homepage         = 'https://github.com/barisatamer/StackViewSeparator'
  s.screenshots     = 'https://camo.githubusercontent.com/40a3a2b78ebc51deaff7a67671003079e835b529/68747470733a2f2f692e696d6775722e636f6d2f58386d547549512e676966'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Baris Atamer' => 'baris@igenius.net' }
  s.source           = { :git => 'https://github.com/barisatamer/StackViewSeparator.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.3'

  s.source_files = 'StackViewSeparator/Classes/**/*'
  
  # s.resource_bundles = {
  #   'StackViewSeparator' => ['StackViewSeparator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
