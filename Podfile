source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '11.0'

inhibit_all_warnings!

target 'SwiftGPUImage3' do

##外部第三方库
    use_frameworks!
    #pod 'GPUImage3'
    pod 'GPUImage', podspec:'./GPUImage.podspec'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ONLY_ACTIVE_ARCH'] = "NO"
    end
  end
end
