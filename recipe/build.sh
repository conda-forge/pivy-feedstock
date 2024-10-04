echo "USE_QT6 is set ${USE_QT6}"

if [[ ${HOST} =~ .*linux.* && ${USE_QT6} = "0" ]]; then
  sed -i 's|_qt5gui_find_extra_libs(EGL.*)|_qt5gui_find_extra_libs(EGL "EGL" "" "")|g' $PREFIX/lib/cmake/Qt5Gui/Qt5GuiConfigExtras.cmake
  sed -i 's|_qt5gui_find_extra_libs(OPENGL.*)|_qt5gui_find_extra_libs(OPENGL "GL" "" "")|g' $PREFIX/lib/cmake/Qt5Gui/Qt5GuiConfigExtras.cmake
fi

Python_INCLUDE_DIR="$(python -c 'import sysconfig; print(sysconfig.get_path("include"))')"

cmake -G "Ninja" -B build \
      -D CMAKE_BUILD_TYPE:STRING="Release" \
      -D CMAKE_INSTALL_PREFIX:PATH=$PREFIX \
      -D Python_EXECUTABLE:PATH="$PYTHON" \
      -D Python_INCLUDE_DIR:PATH=${Python_INCLUDE_DIR} \
      -D PIVY_USE_QT6:BOOL=$USE_QT6 \
      -D QT_HOST_PATH:PATH="${PREFIX}"

cmake install build