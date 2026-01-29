Pod::Spec.new do |s|
  s.name             = "onnxruntime-objc"
  s.version          = "1.25.0-local"
  s.summary          = "ONNX Runtime Objective-C Pod"
  s.description      = "A pod for the ONNX Runtime Objective-C API."
  s.homepage         = "https://github.com/microsoft/onnxruntime"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "ONNX Runtime" => "onnxruntime@microsoft.com" }
  s.source           = { :http => "file:///http_source_placeholder" }
  s.ios.deployment_target = "15.1"

  macosx_deployment_target =  ""
  if macosx_deployment_target != ""
    s.osx.deployment_target = macosx_deployment_target
  end

  s.preserve_paths = [ "LICENSE" ]
  s.default_subspec = "Core"
  s.static_framework = true

  s.subspec "Core" do |core|
    core.dependency "onnxruntime-c", "#{s.version}"
    core.requires_arc = true
    core.compiler_flags = "-std=c++17", "-fobjc-arc-exceptions", "-Wall", "-Wextra", "-Werror"

    include_dirs = [
      "objectivec"
    ].map { |relative_include_dir|
      '"${PODS_TARGET_SRCROOT}/' + relative_include_dir + '"'
    }

    core.pod_target_xcconfig = {
      "HEADER_SEARCH_PATHS" => include_dirs.join(" "),
      "OTHER_CPLUSPLUSFLAGS" => "-fvisibility=hidden -fvisibility-inlines-hidden",
    }

    core.public_header_files = [
      "objectivec/include/onnxruntime.h", "objectivec/include/ort_enums.h", "objectivec/include/ort_env.h", "objectivec/include/ort_coreml_execution_provider.h", "objectivec/include/ort_custom_op_registration.h", "objectivec/include/ort_value.h", "objectivec/include/ort_xnnpack_execution_provider.h", "objectivec/include/ort_session.h"
    ]

    core.source_files = [
      "objectivec/ort_env.mm", "objectivec/include/ort_env.h", "objectivec/ort_session.mm", "objectivec/include/ort_custom_op_registration.h", "objectivec/ort_coreml_execution_provider.mm", "objectivec/error_utils.h", "objectivec/include/ort_session.h", "objectivec/ort_session_internal.h", "objectivec/include/onnxruntime.h", "objectivec/include/ort_enums.h", "objectivec/cxx_utils.mm", "objectivec/include/ort_coreml_execution_provider.h", "objectivec/include/ort_xnnpack_execution_provider.h", "objectivec/ort_env_internal.h", "objectivec/include/ort_value.h", "objectivec/ort_xnnpack_execution_provider.mm", "objectivec/error_utils.mm", "objectivec/ort_enums_internal.h", "objectivec/cxx_utils.h", "objectivec/ort_value.mm", "objectivec/ort_value_internal.h", "objectivec/cxx_api.h", "objectivec/ort_enums.mm", "objectivec/assert_arc_enabled.mm"
    ]

    core.test_spec "Tests" do |test|
      test.source_files = [
        "objectivec/test/test_utils.h", "objectivec/test/ort_env_test.mm", "objectivec/test/test_utils.mm", "objectivec/test/assertion_utils.h", "objectivec/test/assert_arc_enabled.mm", "objectivec/test/ort_value_test.mm", "objectivec/test/ort_session_test.mm"
      ]

      test.resources = [
        "objectivec/test/testdata/identity_string.ort", "objectivec/test/testdata/single_add.basic.ort"
      ]
    end
  end
end
