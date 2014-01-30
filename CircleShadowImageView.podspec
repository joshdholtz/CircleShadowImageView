Pod::Spec.new do |s|
  s.name         = "CircleShadowImageView"
  s.version      = "0.0.1"
  s.summary      = "UIImageView subclass for making a circle image with a shadow"
  s.description  = <<-DESC
                    UIImageView subclass for making a circle image with a shadow... easy peasey
                   DESC
  s.homepage     = "https://github.com/joshdholtz/CircleShadowImageView"
  s.license      = 'MIT'
  s.author       = { "Josh Holtz" => "me@joshholtz.com" }
  s.source       = { :git => "https://github.com/joshdholtz/CircleShadowImageView.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '6.0'
  s.requires_arc = true

  s.public_header_files = 'Classes/*.h'
  s.source_files = 'Classes/*'
end
