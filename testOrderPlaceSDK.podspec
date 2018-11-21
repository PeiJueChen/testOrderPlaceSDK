#Pod::Spec.new do |s| 是它的语法, 就相当现在这个s 变量就是我们spec的对象,下面我们给它相关的属性赋值就可以.
Pod::Spec.new do |s|
#required,就是你pod 的名字.
s.name         = "testOrderPlaceSDK"
#required,版本号, 这里要说一下是,因为我们正常用的 source 是:git => :tag的方式,所以每次更新新版本要打tag push to git , tag 的version 写在这里.
s.version      = "0.0.7"
#required,摘要应该简短，但内容丰富.
s.summary      = "testOrderPlaceSDK alpha."
#optional,官方是说可选, 但建议写上,(描述比摘要要长)注意是在<<-DESC  DESC之间写下.
s.description  = <<-DESC
You can write your description here.
DESC
#required,Pod主页的URL,如果你的项目上传到gitHub,就是你项目的首地址.
s.homepage     = "https://github.com/PeiJueChen/testOrderPlaceSDK"
#optional,显示Pod的效果截图。 适用于面向UI的库。 CocoaPods建议使用gif格式.
# s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

#required,Pod的许可证。我们当前在项目下创建的LICENSE现在派上用场了.注意名字一定是: LICENSE, 不用文件后缀的.它可以是txt文件名字为:LICENSE,不要后缀.
s.license = { :type => 'MIT', :file => 'LICENSE' }
#required,pod维护的作者,前面是名字,后面是email.
s.author = { "风筝" => "13286953452@126.com" }
#required,lib的位置,如果放在gitHub,就是gitHub项目下的地址,写上tag的版本, 新版本这样写: s.version.to_s
s.source = { :git => "https://github.com/PeiJueChen/testOrderPlaceSDK.git", :tag => "#{s.version}" }
#写下你代码的位置, 也可以在后面指定.{h,m,swift},如果多个逗号隔开,swift提供对外的class与method建议加上public
#s.source_files  = 'testOrderPlaceSDK/Classes/**/*'
#排除的文件.
#s.exclude_files = "Classes/Exclude"

# 指定公开的.h 文件,如果不指定,那source_files中所有头文件都是public的.
# s.public_header_files = "Classes/**/*.h"

#本地 framework
s.ios.vendored_frameworks = 'testOrderPlaceSDK/frameworks/AlipaySDK.framework','testOrderPlaceSDK/frameworks/OrderPlaceSDK.framework'
#本地 a library
s.ios.vendored_library = 'testOrderPlaceSDK/frameworks/libWeChatSDK.a'

#导入 resource 的多种方式
s.resources = ['testOrderPlaceSDK/Assets/AlipaySDK.bundle']
#s.resource_bundles = {
#'testOrderPlaceSDK' => ['testOrderPlaceSDK/Assets/**/*.{storyboard,xib}']
#}
#下载后不应删除的任何文件,比如某个txt
#s.preserve_path = 'IMPORTANT.txt'
#s.preserve_paths = 'Frameworks/*.framework'

#optional,如果code中用到swift,必须指定swift版本,如果用的是OC可以不用写.
s.swift_version = '4.0'

#optional,指定支持的cocoapods版本.
#s.cocoapods_version = '>= 0.36'

#optional,如果指定 use_frameworks! ,则pod应包含静态库框架.
s.static_framework = true
#required,指定ios版本,这个相当重要,如果 profile文件中: platform :ios, "8.0",选择的版本是8.0.但我这个pod的s.ios.deployment_target 是9.0,那这个就不会安装到ios 8.0上.对后面更新pod lib很有用.
s.ios.deployment_target = "8.0"
#系统 frameworks
s.frameworks = 'CoreTelephony', 'SystemConfiguration', 'QuartzCore', 'CoreText', 'CoreGraphics', 'UIKit', 'Foundation', 'CFNetwork', 'CoreMotion', 'AVFoundation', 'Security'
#系统 a libraries
s.libraries = 'z', 'c++', 'sqlite3.0'

#依赖的其他pod
#s.dependency 'AFNetworking', '~> 1.0'
#s.dependency 'RestKit/CoreData', '~> 0.20.0'   // 使用到其他subspecs
#s.ios.dependency 'MBProgressHUD', '~> 0.5'

#requires_arc允许您指定哪个source_files使用ARC.这可以支持ARC的文件，true表示所有source_files都使用ARC.
#不使用ARC的文件会有-fno-objc-arc编译器标志.
#此属性的默认值为true.
# s.requires_arc = true


#对subspec做个说明, 一般用到这种情况的不多, subspec类似p:NSOjbect ,而p可以说是subspec,它基于NSOjbect,我们一半用到subspec模式时会指定一个'Core'
#它包括基本的东西,而subspec是它的另一个子类~~可以这么理解吧
#下面看使用和配置
# 使用 subspec order : pod 'testOrderPlaceSDK/Order'
# 使用 core : pod 'testOrderPlaceSDK/Core'
# s.default_subspec   = 'Core'
# s.subspec "Core" do |core|
# core.source_files = 'sources/extensions/ANAlipayResultCode.h'
# core.resources    = 'AlipaySDK.bundle'
# core.vendored_frameworks = 'AlipaySDK.framework'
# core.public_header_files = 'AlipaySDK.framework/Headers/**/*.h', 'sources/extensions/ANAlipayResultCode.h'
# end

# s.subspec "Order" do |order|
# order.source_files = 'sources/order/**/*.{h,m}'
# 注意要dependency core
# order.dependency 'AlipaySDK-2.0/Core'
# end
end
