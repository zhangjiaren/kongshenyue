#
# Be sure to run `pod lib lint LJBaseWebImage.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LJBaseWebImage'
  s.version          = '0.0.4.1'
  s.summary          = '下载网络图片的封装库.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
             LJBaseWebImage对SDWebImage进行了封装，并以subSpec的方式，将SDWebImage引入,SDWebImage使用的是4.2.2版本
                       DESC

  s.homepage         = 'http://git.lianjia.com/mobile_ios/LJBaseWebImage'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yuanyueguang' => 'yuanyueguang001@lianjia.com' }
  s.source           = { :git => 'http://gerrit.lianjia.com/mobile_ios/LJBaseWebImage.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, "8.0"
  s.ios.deployment_target = '8.0'
  s.default_subspec = 'SDWebImage'
  s.source_files = 'LJBaseWebImage/Classes/*.{h,m}'

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

  #   sd.subspec 'WebP' do |webp|
		# webp.source_files = 'LJBaseWebImage/Classes/SDWebImage/UIImage+WebP.{h,m}', 'LJBaseWebImage/Classes/SDWebImage/SDWebImageWebPCoder.{h,m}'
		# webp.xcconfig = {
  #     		'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SD_WEBP=1',
		# 	'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/libwebp/src'   
		# 	} 
  #   	webp.watchos.xcconfig = {
  #     		'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SD_WEBP=1 WEBP_USE_INTRINSICS=1',
  #     		'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/libwebp/src'
  #   	}
  #   	webp.dependency 'LJBaseWebImage/SDWebImage/Core'
  #   	webp.dependency 'libwebp'
  #   end


  end



  s.subspec 'libwebp' do |libwebp|
  	libwebp.compiler_flags = '-D_THREAD_SAFE'
	libwebp.requires_arc = false
	libwebp.pod_target_xcconfig = {
  		'USER_HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/LJBaseWebImage/libwebp/**'
  	}

	  
	libwebp.subspec 'webp' do |webp|
		webp.source_files = 'libwebp/src/webp/*.h'
		webp.header_dir = 'webp'
	end

	libwebp.subspec 'core' do |core|
		core.source_files = 'libwebp/src/utils/*.{h,c}','libwebp/src/dsp/*.{h,c}','libwebpsrc/enc/*.{h,c}','libwebp/src/dec/*.{h,c}'
		core.dependency 'LJBaseWebImage/libwebp/webp'
	end

	libwebp.subspec 'demux' do |demux|
		demux.source_files = 'libwebp/src/demux/*.{h,c}'
		demux.dependency 'LJBaseWebImage/libwebp/core'
	end

	libwebp.subspec 'mux' do |mux|
		mux.source_files = 'libwebp/src/mux/*.{h,c}'
		mux.dependency 'LJBaseWebImage/libwebp/core'
	end
  end


  s.subspec 'WebP' do |webp|
	  webp.source_files = 'LJBaseWebImage/Classes/SDWebImage/UIImage+WebP.{h,m}', 'LJBaseWebImage/Classes/SDWebImage/SDWebImageWebPCoder.{h,m}'
	  webp.xcconfig = {
		  'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SD_WEBP=1',
	  	  'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/LJBaseWebImage/libwebp/src'
	  } 
	  webp.watchos.xcconfig = {
	      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SD_WEBP=1 WEBP_USE_INTRINSICS=1',
	      'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/LJBaseWebImage/libwebp/src'
	  }
	  webp.dependency 'LJBaseWebImage/SDWebImage/Core'
	  webp.dependency 'LJBaseWebImage/libwebp' 
  end
end
