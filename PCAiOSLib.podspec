#
#  Be sure to run `pod spec lint PCAiOSLib.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.name = "PCAiOSLib"
  s.summary = "The PCAiOSLib Cocoapod is an easy way to use the PCA Predict or Addressy type-ahead search technology within an iOS application."
  s.requires_arc = true

  s.version = "1.1.1"

  s.license = { :type => "BSD", :file => "LICENSE" }

  s.author = { "PCA Predict" => "support@pcapredict.com" }

  s.homepage = "https://www.pcapredict.com"

  s.source = { :git => "https://github.com/PCAPredict/PCAiOSLib.git", :tag => "#{s.version}"}

  s.framework = "UIKit"
  s.dependency 'Alamofire', '~> 4.8.1'
  s.dependency 'AlamofireObjectMapper', '~> 5.2.0'

  s.source_files = "PCA-iOS-Lib/**/*.{swift}"

  s.resources = "PCA-iOS-Lib/**/*.{png,jpeg,jpg,storyboard,xib}"

  s.resource_bundles = {
    "PCAiOSLib" => [
      "PCA-iOS-Lib/**/*.xib"
    ]
  }
end