Pod::Spec.new do |spec|	
	spec.name         = "toolbox"
	spec.version      = "1.0.0"
	spec.summary      = "Hyperether iOS toolbox"
	spec.description  = "This is a toolbox created to make iOS-development easier and to prevent adding of reddudant code."
	spec.homepage     = "https://hyperether.com/"
	spec.license      = "MIT"
	spec.author       = { "nebojsa" => "nbrankovic@hyperether.com"}
	spec.platform     = :ios, "12.1"
	spec.source       = { :git => "https://github.com/hyperether/ios_toolbox.git", :tag => "1.0.0" }
	spec.source_files = "toolbox/*.{swift}"
	spec.swift_version = "4.2"
end