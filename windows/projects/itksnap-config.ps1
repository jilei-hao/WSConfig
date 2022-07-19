if ($Env:PATH -notlike "*F:\tk\jom_1_1_2*")
{
    $Env:PATH+=";F:\tk\jom_1_1_2"
}

$config=$args[0]

$build_folder=".\build-"+$config
$itk_dir="F:\dev\itk-dev\build-" + $config
$vtk_dir="F:\dev\vtk-dev\build-" + $config
$curl_base="F:\tk\curl-7.56.1\builds\libcurl-vc14-x64-"+$config+"-static-ipv6-sspi-winssl"
$curl_include_dir=$curl_base+"\include"
$curl_lib=if ($config -like "release") {$curl_base+"\lib\libcurl_a.lib"} else {$curl_base+"\lib\libcurl_a_debug.lib"}

cmake `
-S ".\itksnap" `
-B $build_folder `
-G "NMake Makefiles JOM" `
-D CMAKE_BUILD_TYPE=$config `
-D BUILD_OUTSIDE_INSIGHT_APPLICATIONS=ON `
-D ITK_DIR=$itk_dir `
-D VTK_DIR=$vtk_dir `
-D DART_TESTING_TIMEOUT:STRING=1500 `
-D CURL_INCLUDE_DIR:PATH=$curl_include_dir `
-D CURL_LIBRARY:FILEPATH=$curl_lib `
-D CMAKE_PREFIX_PATH="C:\Qt\Qt6.2\6.2.4\msvc2019_64\lib\cmake" `
-D BUILD_TESTING=ON