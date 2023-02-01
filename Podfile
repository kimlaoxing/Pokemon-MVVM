# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!

workspace 'Pokemon-MVVM'

def core_pods
pod 'Toast-Swift', '~> 5.0.1'
pod 'Declayout'
pod 'Alamofire'
pod 'RxSwift', '6.5.0'
pod 'RxCocoa', '6.5.0'
pod 'SDWebImage'
end

target 'Router' do
project 'Router/Router.project'
end

target 'Home' do
project 'Home/Home.project'
core_pods
end

target 'Components' do
project 'Components/Components.project'
core_pods
end

target 'Pokemon-MVVM' do
project 'Pokemon-MVVM.project'
core_pods
end


