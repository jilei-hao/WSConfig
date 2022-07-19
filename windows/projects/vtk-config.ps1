if ($Env:PATH -notlike "*F:\tk\jom_1_1_2*")
{
    $Env:PATH+=";F:\tk\jom_1_1_2"
}

$config=$args[0]

$build_folder=".\build-"+$config

cmake `
-S ".\vtk" `
-B $build_folder `
-G "NMake Makefiles JOM" `
-D CMAKE_BUILD_TYPE=$config `
-D VTK_GROUP_ENABLE_Qt:STRING=YES `
-D VTK_MODULE_ENABLE_VTK_GUISupportQtQuick:STRING=NO `
-D VTK_MODULE_ENABLE_VTK_GUISupportQtSQL:STRING=NO `
-D CMAKE_PREFIX_PATH="C:\Qt\Qt6.2\6.2.4\msvc2019_64\lib\cmake" `
-D VTK_BUILD_TESTING=OFF `
-D VTK_BUILD_EXAMPLES=OFF `
-D BUILD_SHARED_LIBS=OFF