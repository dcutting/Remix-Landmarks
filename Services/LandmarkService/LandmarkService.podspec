Pod::Spec.new do |s|
  s.name         = "LandmarkService"
  s.version      = "0.0.1"
  s.summary      = "A service for storing & retrieving landmarks"
  s.homepage     = "http://cutting.io"
  s.license      = { "type" => "MIT" }
  s.author       = "Dan Cutting"
  s.platforms    = { :ios => "10.3", :osx => "10.12" }
  s.source       = { :path => '.' }

  s.subspec "API" do |sp|
    sp.source_files = "Source/API"
  end

  s.subspec "Mock" do |sp|
    sp.source_files = "Source/MockLandmarkService"
    sp.dependency "LandmarkService/API"
  end

  s.subspec "Tests" do |sp|
    sp.platform = :osx, "10.12"
    sp.framework = 'XCTest'
    sp.source_files = "Tests"
    sp.dependency "LandmarkService/Mock"
    sp.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }
  end

  s.dependency "LandmarkEntity"
end
