pub const World = struct {
    const Self = @This();

    width: i64,
    height: i64,

    pub fn new(w: i64, h: i64) Self {
        return Self {
            .width = w,
            .height = h,
        };
    }

    pub fn update(self: World) void {
        _ = self;
    }
 };