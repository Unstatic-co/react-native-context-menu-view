require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

# Update for the New Architecture
folly_version = '2021.07.22.00'
folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'

Pod::Spec.new do |s|
  s.name         = "react-native-context-menu-view"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  react-native-context-menu-view
                   DESC
  s.homepage     = "https://github.com/mpiannucci/react-native-context-menu-view"
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.authors      = { "Matthew Iannucci" => "mpiannucci@gmail.com" }
  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/mpiannucci/react-native-context-menu-view.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true

  s.dependency "React"
  # ...
  # s.dependency "..."

  # Update for the New Architecture
  s.compiler_flags  = folly_compiler_flags + " -DRCT_NEW_ARCH_ENABLED=1"

  s.pod_target_xcconfig    = {
    "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost\"",
    "OTHER_CPLUSPLUSFLAGS" => "-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1",
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++17"
  }

  s.dependency "React-Core"
  s.dependency "React-RCTFabric" # This is for Fabric Native Component
  s.dependency "React-Codegen"
  s.dependency "RCT-Folly", folly_version
  s.dependency "RCTRequired"
  s.dependency "RCTTypeSafety"
  s.dependency "ReactCommon/turbomodule/core"
end

