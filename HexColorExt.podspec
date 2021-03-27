Pod::Spec.new do |spec|

  spec.name         = "HexColorExt"
  spec.version      = "1.2.0"
  spec.summary      = "An extension for UIColor."

  spec.homepage     = "https://knottx.github.io"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { "Visarut Tippun" => "knotto.vt@gmail.com" }
  spec.source       = { :git => "https://github.com/knottx/HexColorExt.git", :tag => "#{spec.version}" }
  
  spec.swift_version   = "5.1"
  spec.ios.deployment_target = "10.0"
  spec.source_files  = "HexColorExt/**/*.swift"
  spec.requires_arc  = true

end
