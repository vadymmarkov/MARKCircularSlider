Pod::Spec.new do |s|
  s.name             = "#MARKCircularSlider#"
  s.version          = "0.1.0"
  s.summary          = "An easy-to-use circular slider"
  s.homepage         = "https://github.com/markvaldy/#MARKCircularSlider#"
  s.license          = {
    :type => 'MIT',
    :file => 'LICENSE.md'
  }
  s.author           = { "Vadym Markov" => "impressionwave@gmail.com" }
  s.social_media_url = 'https://twitter.com/markvaldy'
  s.source           = {
    :git => "https://github.com/markvaldy/#MARKCircularSlider#.git",
    :tag => s.version.to_s
  }

  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.frameworks = 'UIKit'

  s.source_files = 'Source/**/*.{h,m}'
end
