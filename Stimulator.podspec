#
# Be sure to run `pod lib lint Stimulator.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Stimulator"
  s.version          = "1.0.4"
  s.summary          = "Custom event handling based on Responder Chain"
  s.description      = <<-DESC
                       Stimulator
                       Custom event handling based on Responder Chain
                       DESC
  s.homepage         = "https://github.com/ukitaka/Stimulator"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "yuki.takahashi" => "yuki.takahashi.1126@gmail.com" }
  s.source           = { :git => "https://github.com/ukitaka/Stimulator.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Stimulator/Classes/**/*'
  s.resource_bundles = {
    'Stimulator' => ['Stimulator/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
