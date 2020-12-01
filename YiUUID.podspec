Pod::Spec.new do |s|
  s.name = 'YiUUID'
  s.module_name = 'YiUUID'
  s.version = '0.0.2'
  s.license = 'MIT'
  s.summary = '提供最简单的API，获取具有不同持久性级别的UUID'
  s.homepage = 'https://github.com/coderyi/YiUUID'
  s.authors = { 'coderyi' => 'coderyi@163.com' }
  s.source = { :git => 'https://github.com/coderyi/YiUUID.git', :tag => "v#{s.version}" }
  s.swift_version = '5.0'
  s.ios.deployment_target = '8.0'
  s.source_files = 'YiUUID/YiUUID/*.swift'
  s.dependency "KeychainAccess", "~> 4.2.0"
end
