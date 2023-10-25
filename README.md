# Basic Example using zig + OpenGL + glfw

1. `git clone --recurse-submodules git@github.com:guidoschmidt/example.zig-opengl.git`
2. Generate OpenGL zig module (needs dotnet SDK 7):
    ```shell
    cd tools/zig-opengl/
    dotnet run OpenGL-Registry/xml/gl.xml gl3v3.zig GL_VERSION_3_3
    ```
3. `zig build run`
