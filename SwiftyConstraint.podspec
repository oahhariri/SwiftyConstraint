
Pod::Spec.new do |s|
  s.name             = 'SwiftyConstraint'
  s.version          = '2.0'
  s.summary          = 'SwiftyConstraint'
  s.homepage         = 'https://github.com/oahhariri/SwiftyConstraint'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Abdulrahman Hariri' => 'oahhariri@gmail.com' }
  s.source           = { :git => 'https://github.com/oahhariri/SwiftyConstraint.git', :tag => s.version.to_s }
  s.swift_version = '5.0'
  s.platform = :ios, "9.0"
  s.source_files = 'Sources/SwiftyConstraint/**/*'
end
