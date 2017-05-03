Pod::Spec.new do |s|
  s.name         = "LandmarkBrowser"
  s.version      = "0.0.1"
  s.summary      = "A compound module for browsing landmarks"
  s.homepage     = "http://cutting.io"
  s.license      = { "type" => "MIT" }
  s.author       = "Dan Cutting"
  s.platform     = :ios, "10.3"
  s.source       = { :path => '.' }
  s.source_files = "Source"
  s.dependency "LandmarkList"
  s.dependency "LandmarkDetail"
end
