{ pkgs }:

let
  qtEnv = with pkgs.qt6;
    env "qt-custom-${qtbase.version}" [
    ];
in
pkgs.mkShell {
  packages = with pkgs; [
    # C++
    gcc
    clang-tools
    cmake
    ninja
    pkg-config

    # Drogon / Web
    drogon
    onnxruntime
    jsoncpp
    libuuid
    zlib
    openssl_4_0
    libpq
    sqlite
    yaml-cpp

    # Qt
    qt6.qtbase
    qt6.qttools
    qt6.qtdeclarative
    libGL
    libglvnd

    # Python
    python3
    python313Packages.numpy
    python313Packages.opencv4
    python313Packages.pandas
    python313Packages.tkinter

    # Dart / Flutter
    dart
    flutter

    #Android Toosl
    androidenv.androidPkgs.emulator
    # General
    git
  ];


  shellHook = ''
    export CMAKE_PREFIX_PATH=${qtEnv}
    export QT_QPA_PLATFORM_PLUGIN_PATH=${qtEnv}/lib/qt-6/plugins/platforms
  	exec fish
	'';
}
