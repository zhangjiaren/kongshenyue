#
# Be sure to run `pod lib lint LJLibwebp.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'LJBaseWebImage'
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

s.subspec 'SDWebImage' do |sd|
    sd.osx.deployment_target = '10.9'
    sd.ios.deployment_target = '7.0'
    sd.tvos.deployment_target = '9.0'
    sd.watchos.deployment_target = '2.0'
    #sd.source = { :git => 'https://github.com/rs/SDWebImage.git', :tag => s.version.to_s }

    sd.requires_arc = true
    sd.framework = 'ImageIO'
    sd.subspec 'Core' do |core|
        core.source_files = 'LJBaseWebImage/Classes/SDWebImage/{NS,SD,UI}*.{h,m}'
        core.exclude_files = 'LJBaseWebImage/Classes/SDWebImage/UIImage+WebP.{h,m}', 'LJBaseWebImage/Classes/SDWebImage/SDWebImageWebPCoder.{h,m}'
        core.tvos.exclude_files = 'LJBaseWebImage/Classes/SDWebImage/MKAnnotationView+WebCache.*'
    end

    sd.subspec 'MapKit' do |mk|
        mk.osx.deployment_target = '10.9'
        mk.ios.deployment_target = '7.0'
        mk.tvos.deployment_target = '9.0'
        mk.source_files = 'LJBaseWebImage/Classes/SDWebImage/MKAnnotationView+WebCache.*'
        mk.framework = 'MapKit'
        mk.dependency 'LJBaseWebImage/SDWebImage/Core'
    end

    sd.subspec 'GIF' do |gif|
        gif.ios.deployment_target = '7.0'
        gif.source_files = 'LJBaseWebImage/Classes/SDWebImage/FLAnimatedImage/*.{h,m}'
        gif.dependency 'LJBaseWebImage/SDWebImage/Core'
        #gif.dependency 'FLAnimatedImage', '~> 1.0'
        gif.xcconfig = {
            'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/FLAnimatedImage/FLAnimatedImage'
        }
    end
  end



s.pod_target_xcconfig = {
    'USER_HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/LJBaseWebImage/**'
}

s.subspec 'WebP' do |webp|
	  webp.source_files = 'LJBaseWebImage/Classes/SDWebImage/UIImage+WebP.{h,m}', 'LJBaseWebImage/Classes/SDWebImage/SDWebImageWebPCoder.{h,m}'
	  webp.xcconfig = {
		  'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SD_WEBP=1',
	  	  'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/LJBaseWebImage/src'
	  	  # 'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/LJBaseWebImage/src'

	  } 
	  webp.watchos.xcconfig = {
	      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SD_WEBP=1 WEBP_USE_INTRINSICS=1',
	      'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/LJBaseWebImage/src'
	  }
	  webp.dependency 'LJBaseWebImage/SDWebImage/Core'
	  # webp.dependency 'LJBaseWebImage/libwebp' 
	  	  # webp.dependency 'libwebp' 
	  webp.dependency 'LJBaseWebImage/libwebp' 
  end

s.subspec 'libwebp' do |libwebp|
	libwebp.subspec 'webp' do |webp|
		webp.source_files = 'src/webp/*.h'
		webp.header_dir = 'webp'
	end

	libwebp.subspec 'core' do |core|
		core.source_files = 'src/utils/*.{h,c}','src/dsp/*.{h,c}','src/enc/*.{h,c}','src/dec/*.{h,c}'
		core.dependency 'LJBaseWebImage/libwebp/webp'
	end

	libwebp.subspec 'demux' do |demux|
		demux.source_files = 'src/demux/*.{h,c}'
		demux.dependency 'LJBaseWebImage/libwebp/core'
	end

	libwebp.subspec 'mux' do |mux|
		mux.source_files = 'src/mux/*.{h,c}'
		mux.dependency 'LJBaseWebImage/libwebp/core'
	end
end
end
