# frozen_string_literal: true.
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def common_pods
  pod 'SwiftLint'
  pod 'SwiftGen'
end

target 'jmbde' do
  platform :osx, '10.14'

  # Pods for jmbde
  common_pods
  pod 'AppCenter'
  pod 'Commander'

  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  target 'jmbdeTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'jmbdeUITests' do
    inherit! :search_paths
    # Pods for testing
  end
end



