
Pod::Spec.new do |s|

  s.name         = "HYParentalGate"
  s.version      = "1.0.7"
  s.summary      = "Parental Gate control"

  s.description  = <<-DESC
                    A simple Parental Gate control that might be used in the kids apps in order to protect adult's content, e.g. in app purchases.
                    DESC

  s.homepage     = "https://github.com/RomanN2/HYParentalGate"
  s.screenshots  = "https://raw.githubusercontent.com/RomanN2/HYParentalGate/master/.github/Screenshot.jpeg"

  s.license      = "MIT"


  s.author             = { "Roman Nazarkevych" => "rnazarkevych@gmail.com" }
  s.social_media_url   = "https://twitter.com/RomanN2"

  s.platform     = :ios
  s.ios.deployment_target = "8.0"


  s.source       = { :git => "https://github.com/RomanN2/HYParentalGate.git", :tag => "1.0.7" }
  s.source_files  = "HYParentalGate", "HYParentalGate/**/*.{swift}"
  s.resources = "HYParentalGate/*.{xcassets,xib}"

  s.swift_version = "4.2"
end
