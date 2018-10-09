#
# Be sure to run `pod lib lint LJLibwebp.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'LJlibwebp'
s.version          = '1.0.1'
s.summary          = 'add libwebp.podspec'
s.description      = 'Chinese ioser download libwebp from https://chromium.googlesource.com/webm/libwebp very difficulty.Want use source form https://github.com/webmproject/libwebp.git,so need add libwebp.podspec.'
s.homepage         = 'https://chromium.googlesource.com/webm/libwebp'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'kongshenyue' => 'eenjoyios@foxmail.com' }
s.source           = { :git => 'https://github.com/webmproject/libwebp.git', :commit => "5e7b0d8239ac3ffda6e2a6b918c01d2edfca0aee" }
s.ios.deployment_target = '8.0'
s.compiler_flags = '-D_THREAD_SAFE'
s.requires_arc = false

s.pod_target_xcconfig = {
    'USER_HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/LJlibwebp/**'
}
s.subspec 'webp' do |webp|
	webp.source_files = 'src/webp/*.h'
	webp.header_dir = 'webp'
end

s.subspec 'core' do |core|
	core.source_files = 'src/utils/*.{h,c}','src/dsp/*.{h,c}','src/enc/*.{h,c}','src/dec/*.{h,c}'
	core.dependency 'LJlibwebp/webp'
end

s.subspec 'demux' do |demux|
	demux.source_files = 'src/demux/*.{h,c}'
	demux.dependency 'LJlibwebp/core'
end

s.subspec 'mux' do |mux|
	mux.source_files = 'src/mux/*.{h,c}'
	mux.dependency 'LJlibwebp/core'
end
end
