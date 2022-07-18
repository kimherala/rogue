const std = @import("std");
const Allocator = std.mem.Allocator;
const World = @import("world.zig").World;

pub const Game = struct {
    const Self = @This();

    world: World,

    pub fn new(allocator: Allocator) Self {
        return Game{
            .world = World.new(allocator, 10, 10)
        };
    }

    pub fn loop(self: Game) !void {
        self.world.update();
    }
};