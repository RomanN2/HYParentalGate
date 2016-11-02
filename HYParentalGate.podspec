
Pod::Spec.new do |s|

  s.name         = "HYParentalGate"
  s.version      = "1.0.1"
  s.summary      = "Parental Gate control"

  s.description  = <<-DESC
                    A simple Parental Gate control that might be used in the kids apps in order to protect adult's content, e.g. in app purchases.
                    DESC

  s.homepage     = "http://25happyeyes.com/"
  s.screenshots  = "https://s22.postimg.org/3rq8shbcx/Parental_Gate.png"

  s.license      = "Apache License Version 2.0"


  s.author             = { "Roman Nazarkevych" => "rnazarkevych@gmail.com" }
  s.social_media_url   = "https://www.facebook.com/roman.nazarkevych"

  s.platform     = :ios
  s.ios.deployment_target = "8.0"


  s.source       = { :git => "https://github.com/RomanN2/HYParentalGate.git", :tag => "1.0.1" }
  s.source_files  = "HYParentalGate", "HYParentalGate/**/*.{h,m}"
  s.resources = "HYParentalGate/*.{xcassets,xib,plist}"

end
