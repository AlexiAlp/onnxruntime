Pod::Spec.new do |spec|
    spec.name                   = "onnxruntime-c"
    spec.version                = "1.25.0-local"
    spec.authors                = { "ONNX Runtime" => "onnxruntime@microsoft.com" }
    spec.license                = { :type => "MIT", :file => "LICENSE" }
    spec.homepage               = "https://github.com/microsoft/onnxruntime"
    spec.source                 = { :http => "file:///http_source_placeholder" }
    spec.summary                = "ONNX Runtime C/C++ Pod"
    spec.ios.deployment_target  = "15.1"

    macosx_deployment_target =  ""
    if macosx_deployment_target != ""
        spec.osx.deployment_target = macosx_deployment_target
    end

    spec.vendored_frameworks    = "onnxruntime.xcframework"
    spec.static_framework       = true
    spec.weak_framework         = [ "CoreML" ]
    spec.source_files           = "Headers/*.h"
    spec.preserve_paths         = [ "LICENSE" ]
    spec.description            = "A pod for the ONNX Runtime C/C++ library."
    spec.library                = "c++"
    spec.pod_target_xcconfig    = {
        "OTHER_CPLUSPLUSFLAGS" => "-fvisibility=hidden -fvisibility-inlines-hidden",
    }
end
