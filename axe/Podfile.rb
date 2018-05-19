# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
source 'https://github.com/axe-org/demo-private-spec.git'
source 'https://github.com/CocoaPods/Specs.git'
target 'Demo' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!
  # 非axe管理的一些全局的组件。
  pod 'Bugly'

  # axe管理的组件
  AXE_PODFILE
end
