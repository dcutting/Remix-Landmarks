Pod::Spec.new do |s|
  s.name         = "LoadablePodResource"
  s.version      = "0.0.1"
  s.summary      = "Utility for easily loading resources from a pod bundle"
  s.homepage     = "http://cutting.io"
  s.license      = { "type" => "MIT" }
  s.author       = "Dan Cutting"
  s.platform     = :ios, "10.3"
  s.source       = { :path => '.' }
  s.source_files = "Source"
end
