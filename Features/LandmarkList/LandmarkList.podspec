Pod::Spec.new do |s|
  s.name         = "LandmarkList"
  s.version      = "0.0.1"
  s.summary      = "A list of landmarks"
  s.homepage     = "http://cutting.io"
  s.license      = { "type" => "MIT" }
  s.author       = "Dan Cutting"
  s.source       = { :path => '.' }
  s.ios.deployment_target = '10.3'
  s.osx.deployment_target = '10.12'

  s.subspec "Logic" do |sp|
    sp.source_files = "Logic"
    sp.dependency "LandmarkService/API"
  end

  s.subspec "View" do |sp|
    sp.source_files = "View"
    sp.dependency "LandmarkList/Logic"
  end

  s.subspec "iOS-View" do |sp|
    sp.platform     = :ios
    sp.source_files = "iOS-View"
    sp.dependency "LandmarkList/View"
    sp.dependency "LoadablePodResource"
    sp.resource_bundles = {
      s.name => ['Resources/**/*']
    }
  end

  s.subspec "iOS-Flow" do |sp|
    sp.platform     = :ios
    sp.source_files = "iOS-Flow"
    sp.dependency "LandmarkList/iOS-View"
  end

  s.subspec "Tests" do |sp|
    sp.source_files = "Tests"
    sp.dependency "LandmarkList/View"
  end
  
  s.subspec "iOS-Fixtures" do |sp|
    sp.platform     = :ios
    sp.source_files = "iOS-Fixtures"
    sp.dependency "LandmarkList/iOS-Flow"
  end
end
