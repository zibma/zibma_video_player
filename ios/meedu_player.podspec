#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint player.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'meedu_player'
  s.version          = '0.3.4'
  s.summary          = 'A new Flutter UI video controls for the flutter video_player plugin.'
  s.description      = <<-DESC
  A new Flutter UI video controls for the flutter video_player plugin..
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  s.swift_version = '5.0'
end
