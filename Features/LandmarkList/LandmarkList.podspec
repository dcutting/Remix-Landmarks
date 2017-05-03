Pod::Spec.new do |s|
  s.name         = "LandmarkList"
  s.version      = "0.0.1"
  s.summary      = "A list of landmarks"
  s.homepage     = "http://cutting.io"
  s.license      = { "type" => "MIT" }
  s.author       = "Dan Cutting"
  s.platform     = :ios, "10.3"
  s.source       = { :path => '.' }

  s.subspec "Logic" do |sp|
    sp.source_files = "Source/Logic"
    sp.dependency "LandmarkService/API"
  end

  s.subspec "Flow" do |sp|
    sp.source_files = "Source/Flow"
    sp.dependency "LandmarkList/Logic"
  end
  
  s.subspec "iOS" do |sp|
    sp.source_files = "Source/iOS"
    sp.dependency "LandmarkList/Flow"
    sp.dependency "LoadablePodResource"
    sp.resource_bundles = {
      s.name => ['Resources/**/*']
    }
  end

  s.subspec "Fixtures" do |sp|
    sp.platform = :ios, "10.3"
    sp.source_files = "Fixtures"
    sp.dependency "LandmarkList/Flow"
  end
end
