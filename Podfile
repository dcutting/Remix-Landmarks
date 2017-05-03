platform :ios, '10.3'

use_frameworks!

plugin 'cocoapods-amimono'

target :Remix do
  pod 'LandmarkBrowser', :path => 'Features/LandmarkBrowser'
end

# Need to list all dependencies here so CocoaPods can find them.
pod 'LoadablePodResource', :path => 'Utilities/LoadablePodResource'
pod 'LandmarkEntity', :path => 'Entities/LandmarkEntity'
pod 'LandmarkService', :path => 'Services/LandmarkService'
pod 'LandmarkList', :path => 'Features/LandmarkList'
pod 'LandmarkDetail', :path => 'Features/LandmarkDetail'

post_install do |installer|
  require 'cocoapods-amimono/patcher'
  Amimono::Patcher.patch!(installer)
end
