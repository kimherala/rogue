const std = @import("std");
const Allocator = std.mem.Allocator;
const Entity = @import("entity.zig").Entity;

pub const World = struct {
    const Self = @This();

    player: Entity,
    entities: []Entity,

    width: i64,
    height: i64,

    pub fn new(allocator: Allocator, width: i64, height: i64) Self {
        _ = allocator;
        return Self {
            .player = undefined,
            .entities = undefined,
            .width = width,
            .height = height,
        };
    }

    pub fn update(self: World) void {
        _ = self;
    }
 };