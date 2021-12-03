const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const stdin = std.io.getStdIn().reader();

    var last: i64 = 9223372036854775807; // max int64
    var count: i64 = 0;
    var buf = std.mem.zeroes([32]u8);
    while (try stdin.readUntilDelimiterOrEof(&buf, '\n')) |str| {
        const trimmed = std.mem.trim(u8, str, " \t\r\n");
        if (trimmed.len == 0) break;
        const num = std.fmt.parseInt(i64, trimmed, 10) catch |err| {
            try stdout.print("this is invalid: {s}\n", .{trimmed});
            return err;
        };
        if (num > last) count += 1;
        last = num;
    }

    try stdout.print("{d}", .{count});
}
