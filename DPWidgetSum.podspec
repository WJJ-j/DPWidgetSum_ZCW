Pod::Spec.new do |s|

s.name          = 'DPWidgetSum_ZCW'
s.version       = '1.0.0'
s.ios.deployment_target = '8.0'
s.summary       = '中彩信息开源框架'
s.homepage      = 'https://github.com/WJJ-j/DPWidgetSum_ZCW'
s.license       = { :type => 'MIT', :file => 'LICENSE' }
s.author        = { 'WJJ-j' => 'wangjiejie@zhcw.com' }
s.source        = { :git => 'https://github.com/WJJ-j/DPWidgetSum_ZCW.git', :tag => s.version }
s.source_files  = 'DPWidgetSum_SDK/**/*.{h,m}'
s.resource_bundles = { 'DPResources' => ['DPWidgetSum_SDK/DPResources.bundle'] }
s.requires_arc  = true
s.frameworks    = 'UIKit','Foundation'

s.dependency 'MBProgressHUD'
s.dependency 'ReactiveObjC', '~> 3.1.1'
s.dependency 'TTTAttributedLabel', '~> 2.0.0'
end
