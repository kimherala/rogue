const std = @import("std");
const Allocator = std.mem.Allocator;
const World = @import("world.zig").World;
const sdl = @cImport({
    @cInclude("SDL.h");
});

pub const Game = struct {
    const Self = @This();

    world: World,

    pub fn new(allocator: Allocator) Self {
        return Game{
            .world = World.new(allocator, 10, 10)
        };
    }

    pub fn loop(self: Game) !void {
        _ = sdl.SDL_Init(sdl.SDL_INIT_VIDEO);
        defer sdl.SDL_Quit();

        var window = sdl.SDL_CreateWindow("Rogue", sdl.SDL_WINDOWPOS_CENTERED, sdl.SDL_WINDOWPOS_CENTERED, 640, 400, 0);
        defer sdl.SDL_DestroyWindow(window);

        var renderer = sdl.SDL_CreateRenderer(window, 0, sdl.SDL_RENDERER_PRESENTVSYNC);
        defer sdl.SDL_DestroyRenderer(renderer);

        gameloop: while (true) {
            var sdl_event: sdl.SDL_Event = undefined;
            while (sdl.SDL_PollEvent(&sdl_event) != 0) {
                switch (sdl_event.type) {
                    sdl.SDL_QUIT => break :gameloop,
                    else => {},
                }   
            }
            
            _ = sdl.SDL_SetRenderDrawColor(renderer, 0xff, 0xff, 0xff, 0xff);
            _ = sdl.SDL_RenderClear(renderer);
            sdl.SDL_RenderPresent(renderer);
        }

        self.world.update();
    }
};