cmake -G "Ninja" -B build -S . ^
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5 ^
    -D CMAKE_BUILD_TYPE="Release" ^
    -D CMAKE_INSTALL_PREFIX:FILEPATH=%LIBRARY_PREFIX% ^
    -D Python_EXECUTABLE:FILEPATH=%PREFIX%/python ^
    -D PIVY_USE_QT6:BOOL=%USE_QT6%

ninja -C build install
