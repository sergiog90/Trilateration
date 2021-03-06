Pod::Spec.new do |s|
  s.name         = "Trilateration"
  s.version      = "0.0.6"
  s.summary      = "Trilateration for iOS based on located Beacons."
  s.description  = <<-DESC
                    Get your position with trilateration using located Beacons.
                    Assign latitude and logitude to your beacons and get your location using trilateration.
                   DESC
  s.homepage     = "https://github.com/sergiog90/Trilateration"
  s.screenshots  = "https://raw.githubusercontent.com/sergiog90/Trilateration/master/Screenshots/01.png"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Sergio García" => "sergiogm.amurrio@gmail.com" }
  s.social_media_url   = "https://twitter.com/sergio_g90"
  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/sergiog90/Trilateration.git", :tag => "0.0.6" }

  s.public_header_files = 'Trilateration/**/*.h'
  s.source_files  = "Trilateration", "Trilateration/**/*.{h,m}"
  s.framework    = "Foundation", "UIKit", "CoreLocation"
end
