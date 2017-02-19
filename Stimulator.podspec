Pod::Spec.new do |s|
  s.name             = "Stimulator"
  s.version          = "2.0.0"
  s.summary          = "Custom event handling based on Responder Chain"
  s.description      = <<-DESC
                       Stimulator
                       Custom event handling based on Responder Chain
                       DESC
  s.homepage         = "https://github.com/ukitaka/Stimulator"
  s.license          = 'MIT'
  s.author           = { "yuki.takahashi" => "yuki.takahashi.1126@gmail.com" }
  s.source           = { :git => "https://github.com/ukitaka/Stimulator.git", :tag => s.version.to_s }
  
  s.platform     = :ios, '9.0'
  s.requires_arc = true
  
  s.source_files = 'Sources/Stimulator.swift'
end

