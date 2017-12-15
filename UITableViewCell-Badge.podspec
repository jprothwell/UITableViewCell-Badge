Pod::Spec.new do |s|
  s.name         = "UITableViewCell-BadgeEx"
  s.version      = "1.0"
  s.summary      = "The easiest way to add badge to your UITableViewCell."
  s.homepage     = "https://github.com/xn1108100154/UITableViewCell-Badge"
  s.screenshots  = "https://raw.githubusercontent.com/xn1108100154/UITableViewCell-Badge/master/demo.gif"
  s.license      = "MIT"
  s.author       = { "XuNing" => "ningxu.ios@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/xn1108100154/UITableViewCell-Badge.git", :tag => s.version.to_s }
  s.source_files = "UITableViewCell-Badge/*.{h,m}"
  s.requires_arc = true
end
