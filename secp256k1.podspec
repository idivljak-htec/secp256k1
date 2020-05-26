Pod::Spec.new do |s|
  # Common settings
  s.name = "secp256k1"
  s.version = "1.0.0"
  s.summary = "Optimized C library for EC operations on curve secp256k1"
  s.description = "libsecp256k1 fork that compiles with swiftc"
  s.homepage = "https://github.com/greymass/secp256k1"
  s.license = { :type => "MIT", :file => "COPYING" }
  s.author = { "secp256k1 contributors" => "https://github.com/bitcoin-core/secp256k1/graphs/contributors" }
  s.source = { :git => "https://github.com/greymass/secp256k1.git", :branch => "podspec" }

  # Platforms
  s.ios.deployment_target = "7.0"
  s.osx.deployment_target = "10.7"
  s.tvos.deployment_target = "9.0"

  # Build
  s.public_header_files = "include/secp256k1.h"
  s.source_files = "src/secp256k1.c"
  s.compiler_flags = "-DENABLE_MODULE_ECDH",
                     "-DENABLE_MODULE_RECOVERY",
                     "-DUSE_NUM_NONE",
                     "-DUSE_FIELD_INV_BUILTIN",
                     "-DUSE_SCALAR_INV_BUILTIN",
                     "-DUSE_FIELD_10X26",
                     "-DUSE_SCALAR_8X32",
                     "-DECMULT_GEN_PREC_BITS=4",
                     "-DECMULT_WINDOW_SIZE=15"
  s.xcconfig = { "HEADER_SEARCH_PATHS" => '"${PODS_ROOT}/secp256k1/include"' }
end
