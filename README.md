# Contributors:
1. Jianzhen Toh (22582509)
2. Nathania Chrestella Teruna (22642853)
# General Overview:
The general overview of this project consists of multiple method implementations in C++ and OpenGL. This project consists of the implementation of 10 methods that affect the camera rotation, object rotation, varying light adjustments, reshape callback, vertex shader, fragment shader, specular highlights and also basic CRUD operations such as object deletion, duplication and the addition of the spotlight. All of the implemented components work as planned. The part that we found the most trouble with would be the spotlight function in Part J as the spotlight does not have the same brightness as Light 1 and the rotation of the spotlight isn’t as noticeable even though the implementation was successful.

# Build Instructions:
### Mac OS:
#### Command line / Other IDE fall back:
  `cd` into the top project folder, so that `ls` should list `CMakeLists.txt`, `src`, `lib`, `res`, etc...
  generate build files:
  > cmake -S . -B cmake-build

  build:
  > cmake --build cmake-build

  run:
  > ./start_scene

  to clean:
  > cmake --build cmake-build-debug --target clean

# Further notes:
All modified files reside in the `res` and `src` folders
