#
# Be sure to run `pod lib lint PandaHTTP.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PandaHTTP"
  s.version          = "0.1.2"
  s.summary          = "PandaHTTP是对HTTP的一个封装"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = <<-DESC
    PandaHTTP是对HTTP的一个封装，使得对于HTTP的使用更方便
                       DESC

  s.homepage         = "https://github.com/openpandaOrg/PandaHTTP"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "lingen.liu" => "lingen.liu@gmail.com" }
  s.source           = { :git => "https://github.com/openpandaOrg/PandaHTTP.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'PandaHTTP' => ['Pod/Assets/*.png']
  }

   s.public_header_files = 'Pod/Classes/**/*.h'
   # s.frameworks = 'UIKit', 'MapKit'
   # s.dependency 'AFNetworking', '~> 3.0'
end
