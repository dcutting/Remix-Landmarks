Pod::Spec.new do |s|
  s.name         = "LandmarkEntity"
  s.version      = "0.0.1"
  s.summary      = "Landmark entity models and logic"
  s.homepage     = "http://cutting.io"
  s.license      = { "type" => "MIT" }
  s.author       = "Dan Cutting"
  s.platforms    = { :ios => "10.3", :osx => "10.12" }
  s.source       = { :path => '.' }
  s.source_files = "Source"
end
