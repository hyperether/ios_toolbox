Pod::Spec.new do |spec|	
	spec.name         = "HyperIOSToolbox"
	spec.version      = "1.6.0"
	spec.summary      = "Hyperether iOS toolbox"
	spec.description  = "This is a toolbox created to make iOS-development easier and to prevent adding of reddudant code."
	spec.homepage     = "https://hyperether.com/"
	spec.license      = { :type => 'MIT', :file => 'HyperIOSToolbox/LICENSE' }
	spec.author       = { "Hyperether" => "info@hyperether.com"}
	spec.platform     = :ios, "12.1"
	spec.source       = { :git => "https://github.com/hyperether/ios_toolbox.git", :tag => "1.6.0" }
	spec.source_files = "HyperIOSToolbox/**/*.{swift}"
	spec.swift_version = "4.2"
    	spec.resources    = 'HyperIOSToolbox/HyperIOSToolbox.bundle'
	spec.dependency   = 'ReachabilitySwift'
end