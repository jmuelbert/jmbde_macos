# Uncomment the next line to define a global platform for your project
platform :osx, '10.12'
# platform :ios, '9.0'

use_frameworks!

def common_pods
  pod 'SwiftLint', '~> 0.25'
  pod 'SwiftGen'
end

target 'JMBde' do
  common_pods
  pod 'Commander', '~> 0.8'
  pod 'AppCenter'

  target 'JMBdeTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'JMBdeUITests' do
    inherit! :search_paths
    # Pods for testing
  end
end
