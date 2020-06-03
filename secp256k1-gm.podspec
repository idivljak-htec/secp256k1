Pod::Spec.new do |s|
  s.name = "secp256k1-gm"
  s.version = "0.0.3"
  s.summary = "Optimized C library for EC operations on curve secp256k1"
  s.homepage = "https://github.com/greymass/secp256k1"
  s.license = { :type => "MIT", :file => "COPYING" }
  s.author = { "secp256k1 contributors" => "https://github.com/bitcoin-core/secp256k1/graphs/contributors" }
  s.source = { :git => "https://github.com/greymass/secp256k1.git", :tag => "0.0.3" }
  s.ios.deployment_target = "12.0"
  s.public_header_files = "include/*.h"
  s.module_name = "secp256k1"
  s.source_files = "src/secp256k1.c", "src/**/*.h", "include/*.h"
  s.compiler_flags = "-DENABLE_MODULE_ECDH",
                     "-DENABLE_MODULE_RECOVERY",
                     "-DUSE_NUM_NONE",
                     "-DUSE_FIELD_INV_BUILTIN",
                     "-DUSE_SCALAR_INV_BUILTIN",
                     "-DUSE_FIELD_10X26",
                     "-DUSE_SCALAR_8X32",
                     "-DECMULT_GEN_PREC_BITS=4",
  "-DECMULT_WINDOW_SIZE=15"
  s.xcconfig = {
    "HEADER_SEARCH_PATHS" => "$(SRCROOT)/secp256k1-gm $(SRCROOT)/secp256k1-gm/src $(SRCROOT)/secp256k1-gm/include",
    "OTHER_CFLAGS" => "-pedantic -Wall -Wextra -Wcast-align -Wnested-externs -Wshadow -Wstrict-prototypes -Wno-shorten-64-to-32 -Wno-conditional-uninitialized -Wno-unused-function -Wno-long-long -Wno-overlength-strings -O3"
  }
end
