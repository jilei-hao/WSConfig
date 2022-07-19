if ($Env:PATH -notlike "*F:\tk\jom_1_1_2*")
{
    $Env:PATH+=";F:\tk\jom_1_1_2"
}

$config=$args[0]

$build_folder=".\build-"+$config

cmake `
-S ".\itk" `
-B $build_folder `
-G "NMake Makefiles JOM" `
-D CMAKE_BUILD_TYPE=$config `
-D BUILD_TESTING=OFF `
-D BUILD_EXAMPLES=OFF `
-D Module_MorphologicalContourInterpolation=ON