const std = @import("std");
const expect = std.testing.expect;
const Game = @import("game.zig").Game;

pub fn main() anyerror!void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer {
        const leaked = gpa.deinit();
        if (leaked) expect(false) catch @panic("Memory leaked!");
    }

    var game = Game.new(allocator);
    try game.loop();
}
