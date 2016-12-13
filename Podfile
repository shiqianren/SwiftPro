source 'https://github.com/CocoaPods/Specs.git'
platform :ios, "9.0"
use_frameworks!
inhibit_all_warnings!

target "swiftProject" do
pod 'SVProgressHUD','~> 2.0.1'
pod 'ReachabilitySwift', '~> 3'
pod 'Alamofire', :git => 'https://github.com/Alamofire/Alamofire'
pod 'HandyJSON'
pod 'Kingfisher', '~> 3.0' ## 轻量级的SDWebImage
pod 'EZSwiftExtensions', :git => 'https://github.com/goktugyil/EZSwiftExtensions.git'
pod 'SnapKit', '~> 3.0.2' ## 自动布局

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end






















