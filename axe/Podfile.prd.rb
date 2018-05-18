# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
source 'https://github.com/axe-org/demo-private-spec.git'
source 'https://github.com/CocoaPods/Specs.git'
target 'Demo' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  
  pod 'Ground/release' , '0.0.1'
  pod 'Login/release' , '0.0.2'
  pod 'Test/release' , '0.0.1'
end
