const std = @import("std");
const gl = @import("gl");
const glfw = @import("glfw");

fn glGetProcAddress(p: glfw.GLProc, proc: [:0]const u8) ?gl.FunctionPointer {
    _ = p;
    return glfw.getProcAddress(proc);
}

fn errorCallback(error_code: glfw.ErrorCode, description: [:0]const u8) void {
    std.log.err("glfw: {}: {s}\n", .{ error_code, description });
}

pub fn main() !void {
    glfw.setErrorCallback(errorCallback);
    _ = glfw.init(.{});
    defer glfw.terminate();

    const window = glfw.Window.create(1024, 768, "test", null, null, .{
        .opengl_profile = .opengl_core_profile,
        .context_version_major = 3,
        .context_version_minor = 3
    }) orelse {
        std.log.err("glfw: Could not create window", .{});
        std.process.exit(1);
    };
    defer window.destroy();

    glfw.makeContextCurrent(window);

    const proc: glfw.GLProc = undefined;
    try gl.load(proc, glGetProcAddress);

    while (!window.shouldClose() and window.getKey(.escape) != .press) {

        gl.clearColor(0.2, 1, 0.3, 1);
        gl.clear(gl.COLOR_BUFFER_BIT);

        glfw.pollEvents();
        window.swapBuffers();
    }
}
