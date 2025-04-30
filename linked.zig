const std = @import("std");

const Node = struct {
    data: i32,
    next: ?*Node,
};

fn append(allocator: std.mem.Allocator, head: *?*Node, value: i32) !void {
    const new_node = try allocator.create(Node);
    new_node.* = Node{
        .data = value,
        .next = null,
    };

    if (head.* == null) {
        head.* = new_node;
        return;
    }

    var current = head.*.?; // Unwrap optional (*Node)
    while (current.next) |next_node| {
        current = next_node;
    }
    current.next = new_node;
}

fn traverse(head: ?*Node) void {
    var current = head;
    while (current) |node| {
        std.debug.print("{} ({}) -> ", .{ node.data, node });
        current = node.next;
    }
    std.debug.print("NULL\n", .{});
}

// zig run linked.zig
pub fn main() !void {
    var head: ?*Node = null;
    try append(std.heap.page_allocator, &head, 10);
    try append(std.heap.page_allocator, &head, 20);
    traverse(head);
}
