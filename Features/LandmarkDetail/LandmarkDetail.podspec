Pod::Spec.new do |s|
  s.name         = "LandmarkDetail"
  s.version      = "0.0.1"
  s.summary      = "Details of a single landmark"
  s.homepage     = "http://cutting.io"
  s.license      = { "type" => "MIT" }
  s.author       = "Dan Cutting"
  s.platform     = :ios, "10.3"
  s.source       = { :path => '.' }
  s.source_files = "Source"
  s.resource_bundles = {
    s.name => ['Resources/**/*']
  }
  s.dependency "LandmarkService/API"
  s.dependency "LoadablePodResource"
end
