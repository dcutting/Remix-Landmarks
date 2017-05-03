Pod::Spec.new do |s|
  s.name         = "LandmarkService"
  s.version      = "0.0.1"
  s.summary      = "A service for storing & retrieving landmarks"
  s.homepage     = "http://cutting.io"
  s.license      = { "type" => "MIT" }
  s.author       = "Dan Cutting"
  s.platform     = :ios, "10.3"
  s.source       = { :path => '.' }

  s.subspec "API" do |sp|
    sp.source_files = "Source/API"
  end

  s.subspec "Mock" do |sp|
    sp.source_files = "Source/MockLandmarkService"
  end

  s.dependency "LandmarkEntity"
end
