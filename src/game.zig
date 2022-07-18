const std = @import("std");
const World = @import("world.zig").World;

pub const Game = struct {
    const Self = @This();

    world: World,

    pub fn new() Self {
        return Game{
            .world = World.new(10, 10)
        };
    }

    pub fn loop(self: Game) !void {
        self.world.update();
    }
};