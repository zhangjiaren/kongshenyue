Pod::Spec.new do |s|
s.name          = “long”
s.version       = "1.0.0"
s.summary       = "of iOS a"
s.description   = <<-DESC
kong
DESC
s.source       = { :git => "https://github.com/zhangjiaren/kongshenyue.git"}
s.source_files = "Logistics/Taxi/*.{swift}”
s.requires_arc = true
end
