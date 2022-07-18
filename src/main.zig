const Game = @import("game.zig").Game;

pub fn main() anyerror!void {
    var game = Game.new();
    try game.loop();
}
