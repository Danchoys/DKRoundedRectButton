Pod::Spec.new do |s|
  s.name             = "DKRoundedRectButton"
  s.version          = "1.0.0"
  s.summary          = "An AppStore's buy button-styled button."
  s.description      = <<-DESC
                        A custom UIButton subclass that has the look
                        and feeling of the rounded rect buttons, found
                        in the AppStore along with some other Apple's apps
                       DESC
  s.homepage         = "https://github.com/danchoys/DKRoundedRectButton"
  s.screenshots      = "http://imgur.com/CEmisEa.gif"
  s.license          = 'MIT'
  s.author           = { "Daniil Konoplev" => "danchoys@icloud.com" }
  s.source           = { :git => "https://github.com/danchoys/DKRoundedRectButton.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.1'
  s.requires_arc = true
  s.source_files = 'DKRoundedRectButton/*.{h,m}'
  s.frameworks = 'UIKit'
end
