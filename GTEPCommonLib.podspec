#
# Be sure to run `pod lib lint GTCommonLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GTEPCommonLib'
  s.version          = '1.0.7'
  s.summary          = 'In this library, it contains custom UI classes and common extensions.'

  s.description      = <<-DESC
    This is a collection of pre-written code, classes, and functions that can be used to simplify development and add functionality to iOS applications.
                       DESC
                       
  s.homepage         = 'https://github.com/shenditya/GTEPCommonLib'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Shendy Aditya Syamsudin' => 'shendyaditya@live.com' }
  s.source           = { :git => 'https://github.com/shenditya/GTEPCommonLib.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.swift_version = '4.2'
  s.source_files = 'GTEPCommonLib/Classes/**/*'
  s.resource_bundles = {
      'GTEPCommonLib' => ['GTEPCommonLib/Assets/**/*']
  }


end
