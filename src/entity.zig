const Info = struct {
    name: []u8,
};

pub const Entity = struct {
    const Self = @This();

    x: i64,
    y: i64,
    info: Info,

    pub fn new(name: []const u8, x: i64, y: i64) Self {
        return Self {
            .x = x, 
            .y = y,
            .info = .{.name = name},
        };
    }
};