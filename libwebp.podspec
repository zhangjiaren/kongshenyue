#
# Be sure to run `pod lib lint LJLibwebp.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'libwebp'
s.version          = '1.0.0'
s.summary          = '封装 libwebp 1.0.0 支持webp格式图片'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
封装 libwebp 1.0.0 支持webp格式图片,在LJBaseWebImage 可以引用 LJLibwebp
DESC

s.homepage         = 'hhttps://github.com/zhangjiaren/kongshenyue'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'zhangjairen001' => 'zhangjairen001@lianjia.com' }
s.source           = { :git => 'https://github.com/zhangjiaren/kongshenyue.git', :commit => "5e7b0d8239ac3ffda6e2a6b918c01d2edfca0aee" }
s.ios.deployment_target = '8.0'
s.compiler_flags = '-D_THREAD_SAFE'
s.requires_arc = false


s.pod_target_xcconfig = {
    'USER_HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/libwebp/**'
}
s.subspec 'webp' do |webp|
	webp.source_files = 'libwebp/src/webp/*.h'
	webp.header_dir = 'webp'
end

s.subspec 'core' do |core|
	core.source_files = 'libwebp/src/utils/*.{h,c}','libwebp/src/dsp/*.{h,c}','libwebp/src/enc/*.{h,c}','libwebp/src/dec/*.{h,c}'
	core.dependency 'libwebp/webp'
end

s.subspec 'demux' do |demux|
	demux.source_files = 'libwebp/src/demux/*.{h,c}'
	demux.dependency 'libwebp/core'
end

s.subspec 'mux' do |mux|
	mux.source_files = 'libwebp/src/mux/*.{h,c}'
	mux.dependency 'libwebp/core'
end


end
