# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def common_pods
  pod 'SwiftLint', '~> 0.29'
  pod 'SwiftGen',  '~> 6.0.2'
end

target 'jmbde' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for jmbde
  common_pods
  pod 'AppCenter'
  pod 'Commander', '~> 0.8'

  # Use the following lines if you want to specify which service you want to use.
  pod 'AppCenter/Analytics'
  pod 'AppCenter/Crashes'
  
  target 'jmbdeTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'jmbdeUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
